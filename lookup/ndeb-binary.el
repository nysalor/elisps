;;; ndeb-binary.el --- binary data support for ndeb agent
;; Copyright (C) 1999-2002 Lookup Development Team <lookup@ring.gr.jp>

;; Author: Satomi I. <satomi@ring.gr.jp>
;; Version: $Id: ndeb-binary.el,v 1.4 2007/01/30 04:37:16 kazuhiko Exp $

;; This file is part of Lookup.

;; Lookup is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.

;; Lookup is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with Lookup; if not, write to the Free Software Foundation,
;; Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

;;; Code:

;;(require 'cl)
;;(load "cl-seq")

;;;
;;; Customizable variables
;;;

(defgroup ndeb-binary nil
  "Binary data support for ndeb agent."
  :group 'ndeb)

(defcustom ndeb-binary-programs nil
  "A list of programs to play binary data on an ndeb entry.
Each element is like a property list of the following form:

  (TYPE PROGRAM [KEY VALUE ...])

Where TYPE is a symbol that represents the binary type. At this time
`xbm', `bmp' and `jpeg' are recognized.

PROGRAM is eigher a program name or a list of command-line parametrs
to play a binary of this TYPE.

The rest, pairs of KEY and VALUE, are optional properties to control
how to invoke PROGRAM. Valid properties are:

  :directory-separator STRING
      Convert directory separators (/) in the binary filename to
      STRING when constructing the actual command line.

  :disable-sentinel BOOLEAN
      If non-nil, do not use the process sentinel to delete the
      temporary file used by PROGRAM."
  :type '(repeat
	  (list
	   (choice :tag "Type"
		   (const xbm)
		   (const bmp)
		   (const jpeg)
		   symbol)
	   (cons :format "%v"
		 (string :tag "Program")
		 (repeat :tag "Options" string))
	   (set :format "%v" :inline t
		(list :format "%v" :inline t
		      (const :format "" :inline t (:directory-separator))
		      (string :tag "Directory seperator" :value "/"))
		(list :format "%v" :inline t
		      (const :format "" :inline t (:disable-sentinel))
		      (boolean :tag "Disable process sentinel")))))
  :get (lambda (symbol)
	 (mapcar (lambda (elem)
		   (let ((program (nth 1 elem)))
		     (append (list (car elem)
				   (if (stringp program) (list program)
				     program))
			     (cdr (cdr elem)))))
		 (symbol-value symbol)))
  :group 'ndeb-binary)

(defcustom ndeb-binary-extensions
  '((xbm . "xbm")
    (bmp . "bmp")
    (tiff . "tif")
    (jpeg . "jpg"))
  "Alist of binary type vs. filename extension used to create a
temporary file. Each element looks like:

  (TYPE . EXTENSION)

Where TYPE is a symbol that represents the binary type.
EXTENSION is a filename extension without the leading dot."
  :type '(repeat (cons (symbol :tag "Type")
		       (choice :tag "Extension"
			       (const nil)
			       string)))
  :group 'ndeb-binary)

(defcustom ndeb-binary-temporary-directory temporary-file-directory
  "Path to the directory where temporary binary files will be created."
  :type 'directory
  :group 'ndeb-binary)

(defcustom ndeb-image-default-caption "画像"
  "Default string to be used when the caption of an image is empty."
  :type 'string
  :group 'ndeb-binary)

(defcustom ndeb-image-caption-format "〈%s〉"
  "Format string for the caption of an image.
This string is passed to `format' function with the original text."
  :type '(choice (const nil) string)
  :group 'ndeb-binary)

(defface ndeb-image-caption-face
  '((((class color) (background light)) (:foreground "Gray50"))
    (((class color) (background dark)) (:foreground "Gray75")))
  "Face used to highlight the caption of an image."
  :group 'ndeb-binary
  :group 'lookup-faces)

(defface ndeb-image-reference-face
  '((((class color) (background light)) (:foreground "Green4"))
    (((class color) (background dark)) (:foreground "GreenYellow")))
  "Face used to highlight the caption of an image link that invokes the
external program."
  :group 'ndeb-binary
  :group 'lookup-faces)

(defface ndeb-image-mono-face
  '((t (:foreground "Black" :background "White")))
  "Face applied to the monochrome images."
  :group 'ndeb-binary
  :group 'lookup-faces)

;;;
;;; Internal variables
;;;

(defvar ndeb-binary-link-map nil
  "Keymap for binary links.")

(defvar ndeb-binary-processes nil
  "A list of external processes started by executing a link.
Each element looks like: (PROCESS-ID DICTIONARY-ID ENTRY-POSITION)")

(put 'ndeb :xbm-regexp
     '("<img=mono:\\([0-9]+\\)x\\([0-9]+\\)>" . "</img=\\([^>]+\\)>"))
(put 'ndeb :bmp-regexp
     '("<img=bmp>" . "</img=\\([^>]+\\)>"))
(put 'ndeb :jpeg-regexp
     '("<img=jpeg>" . "</img=\\([^>]+\\)>"))

(defconst ndeb-binary-extract-commands
  ;; or should be set as dictionary options...??
  '((xbm . "xbm %s %s %s")
    (bmp . "bmp %s %%s")
    (tiff . "bmp2tiff %s %%s")
    (jpeg . "jpeg %s %%s"))
  "Alist of binary type vs. format string of an eblook command to
extract the target entry.")

(defvar ndeb-binary-glyph-compose-function nil)
(defvar ndeb-binary-glyph-insert-function nil)

;;;
;;; Internal functions
;;;

(defvar ndeb-binary-temporary-subdirectory nil)

(defun ndeb-binary-temporary-subdirectory-initialize ()
  "Initialize temporary subdirectory for ndeb-binary."
  (setq ndeb-binary-temporary-subdirectory
	(make-temp-name (ndeb-binary-expand-file-name
			 "nb" ndeb-binary-temporary-directory)))
  (make-directory ndeb-binary-temporary-subdirectory) ;; error if already exists
  (set-file-modes ndeb-binary-temporary-subdirectory 448) ;; octal 0700
  (add-hook 'kill-emacs-hook 'ndeb-binary-temporary-subdirectory-cleanup))

(defun ndeb-binary-temporary-subdirectory-cleanup ()
  "Cleanup temporary subdirectory for ndeb-binary."
  (remove-hook 'kill-emacs-hook 'ndeb-binary-temporary-subdirectory-cleanup)
  (if (and ndeb-binary-temporary-subdirectory
	   (file-directory-p ndeb-binary-temporary-subdirectory))
      (condition-case nil
	  (let ((files (directory-files ndeb-binary-temporary-subdirectory
					'full "[^.]" 'nosort)))
	    (while files
	      (delete-file (car files))
	      (setq files (cdr files)))
	    (delete-directory ndeb-binary-temporary-subdirectory))
	(error nil)))
  (setq ndeb-binary-temporary-subdirectory nil))

(defun ndeb-binary-initialize ()
  "Initialize ndeb-binary module."
  (ndeb-binary-temporary-subdirectory-initialize)
  (unless ndeb-binary-link-map
    (setq ndeb-binary-link-map (copy-keymap lookup-content-mode-map))
    (define-key ndeb-binary-link-map "\C-m" 'ndeb-binary-follow-link)
    (define-key ndeb-binary-link-map "e" 'ndeb-binary-extract-link)
    (if (featurep 'xemacs)
	(define-key ndeb-binary-link-map 'button2 'ndeb-binary-mouse-follow)
      (define-key ndeb-binary-link-map [mouse-2] 'ndeb-binary-mouse-follow)))
  (when window-system
    (cond ((lookup-inline-image-p 'xbm)
	   (setq ndeb-binary-glyph-compose-function 'lookup-glyph-compose
		 ndeb-binary-glyph-insert-function 'lookup-glyph-insert))
	  ((featurep 'bitmap)
	   (setq ndeb-binary-glyph-compose-function 'lookup-bitmap-compose
		 ndeb-binary-glyph-insert-function 'insert)))))

(defun ndeb-binary-set-link (start end face type target &optional params)
  "Create a link between the range from START to END to play the
binary on the current dictionary.

FACE is a face for the link or `lookup-reference-face' if nil.
TYPE is a symbol that represents the binary type.
TARGET is a string that specifies the binary location.
PARAMS is a list of additional parameters used to format the eblook
command defined in `ndeb-binary-extract-commands'."
  (let ((binary (list (cons 'type type)
		      (cons 'target target))))
    (if params
	(setq binary (append binary
			     (list (append (list 'parameters) params)))))
    (add-text-properties start end
			 (list (if (< emacs-major-version 21) 'local-map
				 'keymap)
			       ndeb-binary-link-map
			       'face (or face 'lookup-reference-face)
			       'mouse-face 'highlight
			       'help-echo (format
					   "[%s] mouse-2: play, e: extract"
					   type)
			       'lookup-tab-stop t
			       'ndeb-binary binary))))

(defun ndeb-binary-get-link (pos)
  "Return the binary link at POS."
  (get-text-property pos 'ndeb-binary))

(defun ndeb-binary-expand-file-name (name &optional dir)
  (let ((directory-sep-char ?/))
    (expand-file-name name dir)))

(defun ndeb-binary-bind-temporary-file (dictionary target type)
  (let* ((files (lookup-dictionary-get-property dictionary 'binary-files))
	 (file (assq target files))
	 name lock)
    (if file
	(setq files (delq file files)
	      name (nth 1 file)
	      lock (1+ (nth 2 file)))
      (let* ((suffix (lookup-assq-ref ndeb-binary-extensions type))
	     (rest 10))
	(setq name (catch 'done
		     (while (< 0 rest)
		       (let ((name (make-temp-name
				    (ndeb-binary-expand-file-name
				     "nb" ndeb-binary-temporary-subdirectory))))
			 (when suffix
			   (setq name (concat name "." suffix)))
			 (unless (file-exists-p name)
			   (throw 'done name)))
		       (setq rest (1- rest))))
	      lock 1)
	(unless name
	  (error "Unable to create unique filename"))))
    (lookup-dictionary-put-property
     dictionary 'binary-files (append files (list (list target name lock))))
    name))

(defun ndeb-binary-unbind-temporary-file (dictionary target)
  (let* ((files (lookup-dictionary-get-property dictionary 'binary-files))
	 (file (assq target files)))
    (when file
      (let ((name (nth 1 file))
	    (lock (1- (nth 2 file))))
	(setq files (delq file files))
	(if (< lock 1)
	    (condition-case nil
		(progn
		  (delete-file name)
		  (message "Deleted %s" name))
	      (error nil))
	  (setq files (append files (list (list target name lock)))))
	(lookup-dictionary-put-property dictionary 'binary-files files)))))

(defun ndeb-binary-extract (dictionary type target params file)
  "Extract the binary into a file named FILE.

DICTIONARY is a dictionary that contains the target binary.
TYPE is a symbol that represents the binary type.
TARGET is a string that specifies the binary location.
PARAMS is a list of additional parameters used to format the eblook
command or nil if not needed.

See `ndeb-binary-extract-commands' for the available binary types and
corresponding eblook commands."
  (let ((case-fold-search nil)
	(command (apply 'format
			(lookup-assq-ref ndeb-binary-extract-commands type)
			(append (list target) params))))
    (ndeb-with-dictionary dictionary
      (save-match-data
	;; if the command still contains "%s", eblook will create the
	;; output file.
	(if (string-match "%s" command)
	    (let (ret)
	      (setq command (replace-match file t t command))
	      (message command)
	      (setq ret (ndeb-process-require command))
	      (unless (string-match "^OK" ret)
		(when (string-match "[ \t\r\n]+$" ret)
		  (setq ret (replace-match "" t t ret)))
		(error ret)))
	  ;; otherwise write the eblook output to a temporary file.
	  ;; TODO: how eblook returns an error in this case?
	  (with-temp-buffer
	    (message command)
	    (buffer-disable-undo)
	    (set-buffer-file-coding-system 'raw-text)
	    (insert (ndeb-process-require command))
	    (let ((out (with-output-to-string (write-file file))))
	      (lookup-proceeding-message out))))))))

;;;
;;; Functions for a link
;;;

(defun ndeb-binary-process-sentinel (process event)
  (let ((pi (assq (process-id process) ndeb-binary-processes)))
    (ndeb-binary-unbind-temporary-file (lookup-get-dictionary (nth 1 pi))
				       (nth 2 pi))
    (setq ndeb-binary-processes (delq pi ndeb-binary-processes))))

(defun ndeb-binary-follow-link ()
  "Play the binary at point."
  (interactive)
  (let ((case-fold-search nil)
	(lookup-proceeding-message "Playing binary")
	(dictionary (lookup-entry-dictionary lookup-content-current-entry))
	link type target file)
    (lookup-proceeding-message nil)
    (setq link (ndeb-binary-get-link (point))
	  type (lookup-assq-ref link 'type)
	  target (lookup-assq-ref link 'target)
	  file (ndeb-binary-bind-temporary-file dictionary target type))
    (if (file-exists-p file)
	(lookup-proceeding-message (concat "Reusing " file))
      (ndeb-binary-extract dictionary type target
			   (lookup-assq-ref link 'parameters) file))
    (condition-case err
	(let* ((program (assq type ndeb-binary-programs))
	       (params (nth 1 program))
	       (sep (plist-get program :directory-separator))
	       process)
	  (if (stringp params)
	      (setq params (list params)))
	  (when sep
	    (save-match-data
	      (while (string-match "/" file)
		(setq file (replace-match sep t t file)))))
	  (setq params (append params (list file)))
	  (message (mapconcat (lambda (x) x) params " "))
	  (setq process (or (apply 'start-process
				   "ndeb-binary"
				   (get-buffer "*Messages*")
				   (car params)
				   (cdr params))
			    (error "Invalid process object")))
	  (sit-for 3)
	  (unless (plist-get program :disable-sentinel)
	    (setq ndeb-binary-processes
		  (append ndeb-binary-processes
			  (list (list (process-id process)
				      (lookup-dictionary-id dictionary)
				      target))))
	    (set-process-sentinel process 'ndeb-binary-process-sentinel))
	  (lookup-proceeding-message t))
      (ndeb-binary-unbind-temporary-file dictionary target)
      (error (message "%s" err)))))

(defun ndeb-binary-mouse-follow (event)
  "Play the binary you click on."
  (interactive "e")
  (mouse-set-point event)
  (ndeb-binary-follow-link))

(defun ndeb-binary-extract-link (link file &optional confirm)
  "Save the binary at LINK into a file FILE.
If the optional argument CONFIRM is non-nil, prompt before
overwriting an existing file.

Interactively, this function obtains the link at point, prompts for
FILE and confirm overwriting if necessary."
  (interactive
   (let ((ref (or (ndeb-binary-get-link (point))
		  (error "No binary at point"))))
     (list ref
	   (read-file-name (format "Save %s into file: "
				   (lookup-assq-ref ref 'type)))
	   t)))
  (setq file (expand-file-name file))
  (and confirm
       (file-exists-p file)
       (or (y-or-n-p (format "File %s exists; overwrite? " file))
	   (error "Canceled")))
  (ndeb-binary-extract (lookup-entry-dictionary lookup-content-current-entry)
		       (lookup-assq-ref link 'type)
		       (lookup-assq-ref link 'target)
		       (lookup-assq-ref link 'parameters)
		       file))

;;;
;;; Functions for constructing the content buffer
;;;

(defun ndeb-binary-format-image-caption (start end type target &rest params)
  "Format the caption of an image."
  (let (caption)
    (goto-char start)
    (if (= start end)
	(setq caption ndeb-image-default-caption)
      (setq caption (buffer-substring start end))
      (delete-region start end))
    (insert (if ndeb-image-caption-format
		(format ndeb-image-caption-format caption)
	      caption))
    (if (assq type ndeb-binary-programs)
	(ndeb-binary-set-link start (point)
			      'ndeb-image-reference-face type target params)
      (put-text-property start (point) 'face 'ndeb-image-caption-face))))

(defun ndeb-binary-insert-mono-image (dictionary target width height)
  "Insert an inline monochrome image."
  (when ndeb-binary-glyph-compose-function
    (let ((command (format "xbm %s %s %s" target width height))
	  xbm glyph start)
      (lookup-proceeding-message command)
      (setq xbm (ndeb-with-dictionary dictionary
		  (ndeb-process-require command)))
      (condition-case nil
	  (setq glyph (funcall ndeb-binary-glyph-compose-function xbm))
	(if (string-match "[ \t\r\n]+$" xbm)
	    (setq xbm (replace-match "" t t xbm)))
	(error xbm))
      (insert ?\n)
      (setq start (point))
      (funcall ndeb-binary-glyph-insert-function glyph)
      (if (featurep 'xemacs)
	  (set-glyph-property glyph 'face 'ndeb-image-mono-face)
	(if (fboundp 'line-beginning-position) ;; just for safe.
	    (save-excursion
	      (while (<= start (point))
		(put-text-property (line-beginning-position) (line-end-position)
				   'face 'ndeb-image-mono-face)
		(forward-line -1)))))
      (unless (= (following-char) ?\n)
	(insert ?\n)))))

(defun ndeb-binary-insert-color-image (dictionary type target)
  "Insert an inline color image of type TYPE."
  (when (lookup-inline-image-p type)
    (let ((file (make-temp-name
		 (ndeb-binary-expand-file-name
		  "nb" ndeb-binary-temporary-subdirectory))))
      (ndeb-binary-extract dictionary type target nil file)
      (insert ?\n)
      (lookup-img-file-insert file type)
      (unless (= (following-char) ?\n)
	(insert ?\n))
      (condition-case nil
	  (delete-file file)
	(error nil))
      t)))

;;;
;;; Arrange functions
;;;

(defun ndeb-arrange-xbm (entry)
  "Arrange monochrome images on an ndeb entry."
  (let* ((dictionary (lookup-entry-dictionary entry))
	 (regexp (lookup-dictionary-option dictionary :xbm-regexp t)))
    (while (re-search-forward (car regexp) nil t)
      (let ((width (match-string 1))
	    (height (match-string 2))
	    (start (match-beginning 0)))
	(replace-match "" t t)
	(condition-case err
	    (let (end target)
	      (re-search-forward (cdr regexp))
	      (setq end (match-beginning 0)
		    target (match-string 1))
	      (replace-match "" t t)
	      (ndeb-binary-format-image-caption start end
						'xbm target width height)
	      (when lookup-inline-image
		(ndeb-binary-insert-mono-image dictionary target width height)))
	  (error (message "%s" err)))))))

(defun ndeb-arrange-bmp (entry)
  "Arrange bmp images on an ndeb entry."
  (let* ((dictionary (lookup-entry-dictionary entry))
	 (regexp (lookup-dictionary-option dictionary :bmp-regexp t)))
    (while (re-search-forward (car regexp) nil t)
      (let ((start (match-beginning 0)))
	(replace-match "" t t)
	(condition-case err
	    (let (end target)
	      (re-search-forward (cdr regexp))
	      (setq end (match-beginning 0)
		    target (match-string 1))
	      (replace-match "" t t)
	      (ndeb-binary-format-image-caption start end 'bmp target)
	      (when lookup-inline-image
		;; use tiff if available to support RLE.
		(or (ndeb-binary-insert-color-image dictionary 'tiff target)
		    (ndeb-binary-insert-color-image dictionary 'bmp target))))
	  (error (message "%s" err)))))))

(defun ndeb-arrange-jpeg (entry)
  "Arrange jpeg images on an ndeb entry."
  (let* ((dictionary (lookup-entry-dictionary entry))
	 (regexp (lookup-dictionary-option dictionary :jpeg-regexp t)))
    (while (re-search-forward (car regexp) nil t)
      (let ((start (match-beginning 0)))
	(replace-match "" t t)
	(condition-case err
	    (let (end target)
	      (re-search-forward (cdr regexp))
	      (setq end (match-beginning 0)
		    target (match-string 1))
	      (replace-match "" t t)
	      (ndeb-binary-format-image-caption start end 'jpeg target)
	      (when lookup-inline-image
		(ndeb-binary-insert-color-image dictionary 'jpeg target)))
	  (error (message "%s" err)))))))

;;;
;;; Setup
;;;

(eval-after-load "lookup-content" '(ndeb-binary-initialize))

;;;
;;; Cleanup
;;;

(defun ndeb-binary-clear-dictionary (dictionary)
  "Clear temporary files for DICTIONARY."
  (lookup-foreach
   (lambda (file)
     (condition-case nil
	 (let ((name (nth 1 file)))
	   (when (file-exists-p name)
	     (let ((lookup-proceeding-message (format "Deleting %s" name)))
	       (lookup-proceeding-message nil)
	       (delete-file name)
	       (lookup-proceeding-message t))))
	   (error nil)))
   (lookup-dictionary-get-property dictionary 'binary-files))
  (lookup-dictionary-put-property dictionary 'binary-files nil))

(defun ndeb-binary-clear (agent)
  "Clear temporary files used by ndeb-binary."
  (let ((dictionaries (append (lookup-agent-dictionaries agent) nil)))
    (lookup-foreach 'ndeb-binary-clear-dictionary dictionaries)))

(provide 'ndeb-binary)
