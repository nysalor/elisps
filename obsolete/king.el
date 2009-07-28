;;  king.el --- Mule interface to King of Translation
;;
;;  (C) COPYRIGHT International Business Machines Corp. 1999
;;  All Rights Reserved
;;  Licensed Materials - Property of IBM
;;  US Government Users Restricted Rights - Use, duplication or
;;  disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
;;
;;

;;; Commentary:

;;  To use KingTranslation, define autoload entries in .emacs file as follows:
;;
;;  (autoload 'king-lookup-word "king" nil t)
;;  (autoload 'king-translate-region "king" nil t)
;;  (autoload 'king-translate-buffer "king" nil t)
;;  (autoload 'king-translate-file "king" nil t)
;;  (autoload 'king-add-userdict-region "king" nil t)
;;  (autoload 'king-add-userdict-buffer "king" nil t)
;;  (autoload 'king-add-userdict-file "king" nil t)

;;  Or if you want KingTranslation to be loaded from the beginning,
;;  you can put the following in your .emacs:
;;
;;  (require 'king)

;;  Suggested bindings are:
;;
;;  (global-set-key "\C-c\C-w" 'king-lookup-word)
;;  (global-set-key "\C-c\C-r" 'king-translate-region)
;;  (global-set-key "\C-c\C-b" 'king-translate-buffer)
;;  (global-set-key "\C-c\C-f" 'king-translate-file)
;;  (global-set-key "\C-c\C-e" 'king-add-userdict-region)
;;  (global-set-key "\C-c\C-a" 'king-add-userdict-buffer)
;;  (global-set-key "\C-c\C-u" 'king-add-userdict-file)
;;
;;  Set 'king-default-bindings' to t before loading king.el if you
;;  want to enable these default key bindings.

;;; Code:

(provide 'king)

(defvar king-version "1.00"
  "Version number of KingTranslation client.")
(defvar *translate-command* "kingtr" nil)
(defvar *addudict-command* "addudict" nil)
(defvar *lookup-command* "kingword" nil)
(defvar king-buf "*翻訳の王様*" 
  "Buffer associated with translation result.")
(defvar king-saved-configuration nil nil)
(defvar king-mode-map nil
  "*Keymap for king.")
(defvar king-window-height 10
  "*Mininum window height.")
(defvar king-mode-hook nil
  "Invoked in King mode after translation.")
(defvar king-default-bindings t
  "Set this to t to do the default key bindings.")
(defvar king-dictionary nil
  "System or User dictionaries to use.
When nil, use dictionaries specified in kingrc file.")
(defvar king-lookup-dictionary "art,bus,ent,int,pol,spo")
(defvar king-system-dictionary-array
  ["arg" "bus" "ent" "int" "pol" "spo"])
(defvar king-user-dictionary-directory "~/.king")
(defvar *trim-pattern* "^\\(;+\\|[ >]+\\)")

(if (not king-default-bindings) nil
  (global-set-key "\C-c\C-w" 'king-lookup-word)
  (global-set-key "\C-c\C-r" 'king-translate-region)
  (global-set-key "\C-c\C-b" 'king-translate-buffer)
  (global-set-key "\C-c\C-f" 'king-translate-file)
  (global-set-key "\C-c\C-e" 'king-add-userdict-region)
  (global-set-key "\C-c\C-a" 'king-add-userdict-buffer)
  (global-set-key "\C-c\C-u" 'king-add-userdict-file)
  )

;;; Entry points:

(defun king-lookup-word (arg)
  "Translate a word under cursor."
  (interactive
   (list (read-from-minibuffer "単語: "
			       (get-default-word) )))
  (if (and (not (get-buffer king-buf))
	   (not king-saved-configuration))
      (setq king-saved-configuration (current-window-configuration)))
  (let ((buffer (get-buffer-create king-buf)))
    (save-excursion
      (set-buffer buffer)
      (setq buffer-read-only nil)
      (erase-buffer)
      (king-mode))
    (if (not king-lookup-dictionary)
	(call-process *lookup-command* nil buffer nil arg)
      (call-process *lookup-command* nil buffer nil "-d" king-lookup-dictionary arg))
    (set-buffer buffer)
    (setq buffer-read-only t)
    ;; Force mode-line redisplay
    (set-buffer-modified-p (buffer-modified-p))
    (goto-char 1)
    (run-hooks 'king-mode-hook)
    (switch-to-buffer-other-window buffer)
    (if (< (window-height) king-window-height)
	(enlarge-window (- king-window-height (window-height)))) )
  )

(defun king-translate-region (start end &optional flag)
  "Translate the current region."
  (interactive "r")
  (if (and (not (get-buffer king-buf))
	   (not king-saved-configuration))
      (setq king-saved-configuration (current-window-configuration)))
  (let ((buffer (get-buffer-create king-buf)))
    (save-excursion
      (set-buffer buffer)
      (setq buffer-read-only nil)
      (erase-buffer)
      (king-mode))
    (trim-region start end)
    (message "translation in progress...")
    (save-excursion
      (set-buffer "*TEMP*")
      (unwind-protect
	  (if (not king-dictionary)
	      (call-process-region (point-min) (point-max)
				   *translate-command* nil buffer nil)
	    (call-process-region (point-min) (point-max)
				 *translate-command* nil buffer nil "-d" king-dictionary))
	(kill-buffer "*TEMP*")))
    (message "translation in progress...done")
    (set-buffer buffer)
    (setq buffer-read-only t)
    ;; Force mode-line redisplay
    (set-buffer-modified-p (buffer-modified-p))
    (goto-char 1)
    (run-hooks 'king-mode-hook)
    (switch-to-buffer-other-window buffer)
    (if (< (window-height) king-window-height)
	(enlarge-window (- king-window-height (window-height)))) )
  )

(defun king-translate-buffer ()
  "Translate every sentence in the buffer."
  (interactive)
  (king-translate-region (point-min) (point-max)) )

(defun king-translate-file (file)
  "Translate a file."
  (interactive "fFilename: ")
  (if (and (not (get-buffer king-buf))
	   (not king-saved-configuration))
      (setq king-saved-configuration (current-window-configuration)))
  (find-file file)
  (king-translate-region (point-min) (point-max)) )

(defun king-translate-rectangle (start end)
  "Translate rectangular region."
  (interactive "r")
  (if (and (not (get-buffer king-buf))
	   (not king-saved-configuration))
      (setq king-saved-configuration (current-window-configuration)))
  (let ((buffer (get-buffer-create "*RECT*"))
	(rect (extract-rectangle start end)))
    (save-excursion
      (set-buffer buffer)
      (insert-rectangle rect)))
  (unwind-protect
      (progn
	(set-buffer "*RECT*")
	(king-translate-region (point-min) (point-max)))
    (kill-buffer "*RECT*")))

(defun king-add-userdict-region (start end &optional flag)
  "Translate the current region."
  (interactive "r")
  (if (not (file-directory-p (expand-file-name king-user-dictionary-directory)) )
      (make-directory (expand-file-name king-user-dictionary-directory)))
  (let ((dict (completing-read
	       "Dictionary (default usr): "
	       (make-dgd-alist king-user-dictionary-directory) nil nil))
	(errbuf (get-buffer-create "*king-error*")))
    (if (equal dict "")
	(setq dict "usr"))
    (save-excursion
      (set-buffer errbuf)
      (erase-buffer))
    (message "addudict in progress...")
    (unwind-protect
	(call-process-region start end *addudict-command* nil errbuf nil "-u"
			     (expand-file-name king-user-dictionary-directory)
			     "-n" dict)
      (message "addudict in progress...done")
      (set-buffer errbuf)
      (if (<= (count-lines (point-min) (point-max)) 1)
	  (progn
	    (message (buffer-substring (point-min) (1- (point-max))))
	    (kill-buffer errbuf))
	(switch-to-buffer-other-window errbuf))) ))
    
(defun king-add-userdict-buffer ()
  "Add CSV data in the current buffer into user dictionary."
  (interactive)
  (king-add-userdict-region (point-min) (point-max)) )

(defun king-add-userdict-file (file)
  "Add CSV file into user dictionary."
  (interactive "fFilename: ")
  (let ((buffer (find-file file)))
    (unwind-protect
	(king-add-userdict-region (point-min) (point-max))
      (kill-buffer buffer))))

(defun king-change-dictionary (dict)
  "Change dictionary.
You can specify comma separated multiple dictionaries (like bus,int,spo)."
  (interactive
   (list (completing-read
	  "Dictionary: "
	  (mapcar 'list (append king-system-dictionary-array
				(make-dgd-fullpath-list  king-user-dictionary-directory)))
	  nil nil)))
  (if (equal dict "")
      (setq king-dictionary nil)
    (setq king-dictionary dict)))

(defun king-version ()
  "Show a version of King of Translation."
  (interactive)
  (message (format "KingTranslation version %s" king-version)))


;;; Support routines:

(defun get-default-word ()
  "Get a default word around the cursor."
  (let (word)
    (save-excursion
      (and (not (looking-at "[a-zA-Z]"))
       (skip-chars-backward "^a-zA-Z"))
      (skip-chars-backward "a-zA-Z")
      (setq word
        (buffer-substring
         (point)
         (progn (skip-chars-forward "a-zA-Z") (point))))
      word)))

(defun trim-region-aux (start end)
  (goto-char start)
  (if (re-search-forward *trim-pattern* end t)
      (let ((p1 (point))
            (p0 (match-beginning 0)))
        (if (eq p0 start)
            (trim-region-aux p1 end)
          (concat (buffer-substring start p0)
                  (trim-region-aux p1 end))))
    (buffer-substring start end)))

(defun trim-region (start end)
  (interactive "r")
  (setq s (trim-region-aux start end))
  (let ((buffer (get-buffer-create "*TEMP*")))
    (save-excursion
      (set-buffer buffer)
      (insert s))))

(defun remove-suffix (filename)
  (substring filename 0 (- (length filename) 4)))

(defun make-dgd-alist (dir)
  (mapcar 'list
	  (mapcar 'remove-suffix
		  (directory-files (expand-file-name dir) nil ".*\\.dgd"))))

(defun make-dgd-fullpath-list (dir)
  (mapcar 'remove-suffix
	  (directory-files (expand-file-name dir) t ".*\\.dgd")))

(if king-mode-map
    nil
  (setq king-mode-map (make-keymap))
  (define-key king-mode-map "q" 'king-quit)
  (define-key king-mode-map "n" 'next-line)
  (define-key king-mode-map "p" 'previous-line)
  )

(defun king-quit ()
  "kill king buffer"
  (interactive)
  (set-window-configuration king-saved-configuration)
  (setq king-saved-configuration nil)
  (kill-buffer king-buf))

(defun king-mode ()
  "Major mode for King of Translation.

Key bindings:
\\{king-mode-map}"
  (interactive)
  (use-local-map king-mode-map)
  (setq mode-name "King")
  (setq major-mode 'king-mode))

;;; king.el ends here
