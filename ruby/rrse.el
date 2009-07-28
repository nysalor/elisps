;;; rrse --- Ruby Reference|Refe Seeker for Emacsen

;; Copyright (C) 2006 Ohbayashi Ippei

;; Version: 0.1
;; URL: http://www.kmc.gr.jp/~ohai/rrse.html

;; This software is distributed under GNU general Public Licence version 2.
;; 
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.



;;; Code:

;;;; User customizable varaible
(defvar rrse-desc-separator " "
  "*Separator for each description")

;;;; Internal variables
(defvar rrse-refe-program-name
  (if (featurep 'meadow)
      "ruby"
    "refe"))

(defvar rrse-refe-program-args
  (if (featurep 'meadow)
      '("-S" "refe")
    nil))

(defvar rrse-refe-buffer-name "*rrse-help*")

(defvar rrse-forward-table nil)
(defvar rrse-rev-table nil)

(defvar rrse-enable t)

(defvar rrse-idle-delay 0.5)

(defvar rrse-table-file "~/.rrse/table")
(defvar rrse-rev-table-file "~/.rrse/rev-table")

;;;; Utitility functions
(defun rrse-id-char-p (c)
  "Return whether character C is in [a-zA-Z0-9_]"
  (or (and (<= ?a c) (<= c ?z))
      (and (<= ?A c) (<= c ?Z))
      (and (<= ?0 c) (<= c ?9))
      (= ?_ c)))

(defun rrse-each-line (fun)
  "Apply FUN to each line in current buffer"
  (goto-char (point-min))
  (while (not (eobp))
    (funcall fun (thing-at-point 'line))
    (forward-line)))


(defun rrse-chomp-string (str)
  "remove \\n from STR's tail"
  (if (eq (aref str (- (length str) 1)) ?\n)
      (substring str 0 (- (length str) 1))
    str))

(defun rrse-refe-call-process (buf &rest args)
  "Call refe"
  (let ((coding-system-for-read 'euc-japan))
    (apply 'call-process rrse-refe-program-name nil buf nil
           (append rrse-refe-program-args args))))

(defun rrse-bsearch (table word begin end)
  "binary search implementation"
  (if (or (= (+ begin 1) end) (= begin end))
      (cond
       ((string= word (car (aref table begin))) (cdr (aref table begin)))
       ((string= word (car (aref table end))) (cdr (aref table end)))
       (t nil))
    (let ((center (/ (+ begin end) 2)))
      (if (string< (car (aref table center)) word)
          (rrse-bsearch table word (+ center 1) end)
        (rrse-bsearch table word begin center)))))


(defun rrse-search (key table)
  "binary search"
  (rrse-bsearch table key 0 (- (length table) 1)))

(defun rrse-filter (fun list)
  "a list of all elements that satisfy (FUN elem) in LIST"
  (let ((head list)
        (result nil))
    (while head
      (if (funcall fun (car head))
          (setq result (cons (car head) result)))
      (setq head (cdr head)))
    (reverse result)))

;;;; Table Creation
(defun rrse-make-table ()
  (with-temp-buffer
    (if (file-exists-p rrse-table-file)
        (insert-file-contents rrse-table-file)
      (error "can't load %s" rrse-table-file))
    (let ((table (make-vector (count-lines (point-min) (point-max)) nil)))
      (rrse-each-line (lambda (line)
                        (aset table (count-lines (point-min) (point))
                              (split-string line "[\t\n]"))))
      table)))
    
(defun rrse-make-rev-table ()
  (with-temp-buffer
    (if (file-exists-p rrse-rev-table-file)
        (insert-file-contents rrse-rev-table-file)
      (error "can't load %s" rrse-rev-table-file))
    (let ((table (make-vector (count-lines (point-min) (point-max)) nil)))
      (rrse-each-line (lambda (line)
                        (aset table (count-lines (point-min) (point))
                              (split-string line "[\t\n]"))))
      table)))

(defun rrse-prepare-table ()
  (if (null rrse-forward-table)
      (setq rrse-forward-table (rrse-make-table)
            rrse-rev-table (rrse-make-rev-table))))

;;;; Find suitable methods

(defun rrse-get-current-word ()
  (save-excursion
    (buffer-substring-no-properties
     (progn (skip-syntax-backward "w_") (point))
     (progn (skip-syntax-forward "w_") (point)))))

(defun rrse-go-before-current-word ()
  (skip-syntax-backward "w_")
  (while (and (memq (char-before) '(?\t ?\  ?\n)) (> (point) (point-min)))
    (backward-char)))

(defun rrse-find-dot ()
  (save-excursion
    (rrse-go-before-current-word)
    (char-before)))
      
(defun rrse-find-reciever ()
  (if (not (eq (rrse-find-dot) ?.))
      ""
    (save-excursion
      (rrse-go-before-current-word)
      (backward-char)
      (let ((end (point)))
        (skip-syntax-backward "w_")
        (buffer-substring-no-properties (point) end)))))

(defun rrse-valid-class-method-p (word spec dot reciever)
  (and (eq dot ?.)
       (or (string= (concat reciever "." word) spec)
           (string-match (concat "::" (regexp-quote reciever) "\\." word)
                         spec))))

(defun rrse-valid-instance-method-p (word spec dot reciever)
  (and (eq dot ?.)
       (not (string= word "new"))
       (not (string-match "^Kernel#" spec))
       (string-match (concat "#" word) spec)))

(defun rrse-valid-kernel-or-module-method-p (word spec dot reciever)
  (and (not (eq dot ?.))
       (string-match "^\\(Object#\\|Kernel#\\|Module#\\)" spec)
       (not (string-match "class\\|initialize" word))))

(defun rrse-find-specs ()
  (let* ((word (rrse-get-current-word))
         (dot (rrse-find-dot))
         (reciever (rrse-find-reciever))
         (specs (rrse-search word rrse-rev-table))
         (class-method-p
          (lambda (spec) (rrse-valid-class-method-p word spec dot reciever)))
         (instance-method-p
          (lambda (spec) (rrse-valid-instance-method-p word spec dot reciever)))
         (kernel-method-p
          (lambda (spec) (rrse-valid-kernel-or-module-method-p
                          word spec dot reciever))))
    (or (rrse-filter class-method-p specs)
        (rrse-filter instance-method-p specs)
        (rrse-filter kernel-method-p specs))))
              
;;;; Convert Methods to Descriptions
(defun rrse-format-descs (descs)
  (mapconcat 'identity descs rrse-desc-separator))

(defun rrse-specs-to-descs (specs)
  (let ((make-desc (lambda (desc) (concat spec desc)))
        (pick-desc (lambda (spec)
                     (mapcar make-desc
                             (rrse-search spec rrse-forward-table)))))
    (apply 'append (mapcar pick-desc specs))))


;;;; show description in minibuffer
(defun rrse-show-minibuffer-help ()
  (let ((descs (rrse-specs-to-descs (rrse-find-specs))))
    (if descs
        (message "%s" (rrse-format-descs descs)))))
                 

(defun rrse-print-current-symbol-info ()
  (interactive)
  (condition-case err
      (and rrse-enable
           (eq major-mode 'ruby-mode)
           (not executing-kbd-macro)
           (not (eq (selected-window) (minibuffer-window)))
           (sit-for rrse-idle-delay)
           (rrse-show-minibuffer-help))
    (error (princ err) (error "stop hook"))))

;;;; show refe's help
(defun rrse-show-help (method)
  (let ((buf (or (get-buffer rrse-refe-buffer-name)
                 (generate-new-buffer rrse-refe-buffer-name))))
    (set-buffer buf)
    (setq buffer-read-only nil)
    (erase-buffer)
    (rrse-refe-call-process buf method)
    (goto-char (point-min))
    (set-buffer-modified-p nil)
    (setq buffer-read-only t)
    (display-buffer buf)))
    
(defun rrse-help-completing-read (methods)
  (completing-read "Method: " (mapcar 'list methods)))

(defun rrse-help ()
  (interactive)
  (let ((methods (rrse-find-specs)))
    (cond
     ((null methods) nil) 
     ((null (cdr methods)) (rrse-show-help (car methods)))
     (t (rrse-show-help (rrse-help-completing-read methods))))))

;;;; setup function
(defun rrse-setup ()
  (interactive)
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (rrse-prepare-table)
               (add-hook 'post-command-hook 'rrse-print-current-symbol-info))))
