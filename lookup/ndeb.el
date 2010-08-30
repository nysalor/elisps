;;; ndeb.el --- Lookup eblook interface
;; Copyright (C) 1999 Lookup Development Team <lookup@ring.gr.jp>

;; Author: Keisuke Nishida <kei@psn.net>
;; Version: $Id: ndeb.el,v 1.29 2004/01/28 00:09:34 kazuhiko Exp $

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

(require 'lookup)

(defconst ndeb-version "1.2")

;;;
;:: Customizable variables
;;;

(defgroup ndeb nil
  "Lookup eblook interface."
  :group 'lookup-agents)

(defcustom ndeb-program-name "eblook"
  "*Program name of eblook."
  :type 'string
  :group 'ndeb)

(defcustom ndeb-program-arguments "-e euc-jp"
  "*Arguments for eblook."
  :type 'string
  :group 'ndeb)

(defcustom ndeb-prompt-string "eblook> "
  "*Prompt string of eblook."
  :type 'string
  :group 'ndeb)

(defcustom ndeb-process-coding-system lookup-process-coding-system
  "*Coding system for eblook process."
  :type 'symbol
  :group 'ndeb)

(defcustom ndeb-max-image-size 1048576
  "*ndeb 検索時に表示する画像の最大サイズ (バイト)。
デフォルトは 1MB。nil を指定すると、無制限になる。"
  :type 'integer
  :group 'ndeb)


;;;
;:: Internal varialbes
;;;

(defvar ndeb-current-agent nil)
(defvar ndeb-current-dictionary nil)
(defvar ndeb-current-process nil)

(defconst ndeb-method-table
  '((exact . "exact") (prefix . "word") (suffix . "endword")))

;;;
;:: types
;;;

;; ndeb agent:
;;
;;   (ndeb DIRECTORY :appendix APPENDIX)
;;
;; DIRECTORY - dictionary directory
;; APPENDIX  - appendix directory
;;
;; [property]
;; ndeb-process - eblook process related with agent
;; ndeb-dict    - last used dictionary
;; ndeb-method  - last used value of search-method
;; ndeb-stop    - last used value of stop-code

(defun ndeb-agent-directory (agent)
  (let ((dir (lookup-agent-location agent)))
    (if dir (expand-file-name dir)
      (error "You should specify a dictionary directory"))))

(defun ndeb-agent-appendix (agent)
  (let ((dir (lookup-agent-option agent ':appendix)))
    (if dir (expand-file-name dir))))

(defun ndeb-agent-coding (agent)
  (or (lookup-agent-option agent ':coding)
      ndeb-process-coding-system))

(require 'ndeb-binary)

(put 'ndeb ':methods '(exact prefix suffix))
(put 'ndeb ':gaiji-regexp "<gaiji=\\([^>]*\\)>")
(put 'ndeb ':reference-pattern '("<reference>\\(→?\\(\\([^<]\\|<gaiji=[^>]*>\\)+\\)\\)</reference=\\([^>]*\\)>" 1 2 4))
(put 'ndeb ':ignore-regexp "\\(</?su[pb]>\\|</?em>\\)")

(put 'ndeb ':headings '(lookup-arrange-gaijis))

(put 'ndeb ':arranges
     '(ndeb-arrange-xbm
       ndeb-arrange-bmp
       ndeb-arrange-jpeg
       ndeb-arrange-ignore
       ndeb-arrange-no-newline
       ndeb-arrange-prev-next
       lookup-arrange-references
       lookup-arrange-gaijis
       lookup-arrange-squeezed-references
       lookup-arrange-default-headings
       ndeb-arrange-fill-lines))

(put 'ndeb ':adjusts
     '(lookup-adjust-show-gaijis
       lookup-adjust-check-references
       lookup-adjust-goto-min))

;; ndeb dictionary:
;;
;; CODE - same as NAME below
;; NAME - given by eblook `list' command
;; 
;; [option]
;; :coding    - process coding system
;; :stop-code - stop-code used by eblook

(defun ndeb-new-dictionary (name title)
  (lookup-new-dictionary ndeb-current-agent name name title))

(defun ndeb-dictionary-coding (dictionary)
  (or (lookup-dictionary-option dictionary ':coding t)
      ndeb-process-coding-system))

(defun ndeb-dictionary-stopcode (dictionary)
  (lookup-dictionary-option dictionary ':stop-code t))

;; ndeb entry:
;;
;; CODE    - entry specific code (e.g. "2c00:340") by eblook `search' command
;; HEADING - given by eblook `search' command

(defun ndeb-make-entry (code heading)
  (lookup-make-entry ndeb-current-dictionary code heading))

;;;
;:: macros
;;;

(put 'ndeb-with-agent 'lisp-indent-function 1)
(defmacro ndeb-with-agent (agent &rest body)
  (` (let ((ndeb-current-agent (, agent))
	   (ndeb-current-process (ndeb-agent-process (, agent))))
       (,@ body))))

(put 'ndeb-with-dictionary 'lisp-indent-function 1)
(defmacro ndeb-with-dictionary (dictionary &rest body)
  (` (ndeb-with-agent (lookup-dictionary-agent (, dictionary))
       (let ((ndeb-current-dictionary (, dictionary)))
	 (unless (eq (, dictionary)
		     (lookup-agent-get-property ndeb-current-agent 'ndeb-dict))
	   ;; 必要なときだけ辞書を select する。
	   ;; 外部プロセスとやりとりするよりこの方が高速だろうし、
	   ;; デバッグのときバッファがごちゃごちゃするのはうざったい。
	   (ndeb-process-require
	    (concat "select " (lookup-dictionary-code (, dictionary))))
	   (lookup-agent-put-property ndeb-current-agent 'ndeb-dict
				      (, dictionary))
	   ;; 辞書毎に文字コードを設定する。
	   (let ((code (ndeb-dictionary-coding (, dictionary))))
	     (when code
	       (set-process-coding-system ndeb-current-process code code))))
	 (,@ body)))))

(defun ndeb-agent-process (agent)
  (let ((process (lookup-agent-get-property agent 'ndeb-process)))
    (unless (and process (eq (process-status process) 'run))
      (if process (lookup-process-kill process))
      (setq process (ndeb-process-open (ndeb-agent-directory agent)
				       (ndeb-agent-appendix agent)))
      ;; 最初に辞書一覧を得るのに文字コードの設定が必要。
      (let ((coding (ndeb-agent-coding agent)))
	(when coding
	  (set-process-coding-system process coding coding)))
      ;; コマンドの実行毎に行なう必要のある処理。
      (let ((ndeb-current-process process))
	(if lookup-max-hits (ndeb-require-set "max-hits" lookup-max-hits))
	(if lookup-max-text (ndeb-require-set "max-text" lookup-max-text)))
      (lookup-agent-put-property agent 'ndeb-process process)
      (lookup-agent-put-property agent 'ndeb-dict nil)
      (lookup-agent-put-property agent 'ndeb-method nil)
      (lookup-agent-put-property agent 'ndeb-stop nil))
    process))

(defun ndeb-agent-kill-process (agent)
  (let ((process (lookup-agent-get-property agent 'ndeb-process)))
    (when process
      (if (eq (process-status process) 'run)
	  (process-send-string process "quit\n"))
      (lookup-process-kill process)
      (lookup-agent-put-property agent 'ndeb-process nil))))


;;;
;:: Interface functions
;;;

(put 'ndeb 'setup 'ndeb-setup)
(defun ndeb-setup (agent)
  (ndeb-with-agent agent
    (ndeb-process-require "list"
      (lambda (process)
	(let (name title dicts)
	  (while (re-search-forward "^[^.]+\\. \\([^\t]+\\)\t\\(.*\\)" nil t)
	    (setq name (match-string 1) title (match-string 2))
	    (setq dicts (cons (ndeb-new-dictionary name title) dicts)))
	  (nreverse dicts))))))

(put 'ndeb 'clear 'ndeb-clear)
(defun ndeb-clear (agent)
  (ndeb-agent-kill-process agent)
  (ndeb-binary-clear agent))

(put 'ndeb 'menu 'ndeb-dictionary-menu)
(defun ndeb-dictionary-menu (dictionary)
  (ndeb-with-dictionary dictionary
    (list (ndeb-make-entry "menu" "[Menu]"))))

(put 'ndeb 'copyright 'ndeb-dictionary-copyright)
(defun ndeb-dictionary-copyright (dictionary)
  (ndeb-with-dictionary dictionary
    (list (ndeb-make-entry "copyright" "[Copyright]"))))

(put 'ndeb 'search 'ndeb-dictionary-search)
(defun ndeb-dictionary-search (dictionary query)
  (ndeb-with-dictionary dictionary
    (let ((method (lookup-query-method query))
	  (last (lookup-agent-get-property ndeb-current-agent 'ndeb-method)))
      (unless (eq method last)
	;; 必要のあるときだけ search-method を設定する。ndeb-dict に同じ。
	(ndeb-require-set "search-method"
			  (lookup-assq-ref ndeb-method-table method))
	(lookup-agent-put-property ndeb-current-agent 'ndeb-method method)))
    (ndeb-process-require (format "search \"%s\"" (lookup-query-string query))
      (lambda (process)
	(let (code heading last-code last-heading entries)
	  (while (re-search-forward "^[^.]+\\. \\([^\t]+\\)\t\\(.*\\)" nil t)
	    (setq code (match-string 1) heading (match-string 2))
	    ;; 同じエントリが連続していないかチェックする。
	    ;; これがけっこうあるんだ・・
	    (when (or (not (string= code last-code))
		      (not (string= heading last-heading)))
	      (setq entries (cons (ndeb-make-entry code heading) entries))
	      (setq last-code code last-heading heading)))
	  (nreverse entries))))))

(put 'ndeb 'content 'ndeb-dictionary-content)
(defun ndeb-dictionary-content (dictionary entry)
  (ndeb-with-dictionary dictionary
    (let ((stop (ndeb-dictionary-stopcode dictionary))
          (last (lookup-agent-get-property ndeb-current-agent 'ndeb-stop)))
      (unless (eq stop last)
        ;; 必要のあるときだけ stop-code を設定する。ndeb-dict に同じ。
        (ndeb-require-set "stop-code" stop)
        (lookup-agent-put-property ndeb-current-agent 'ndeb-stop stop)))
    (let ((code (lookup-entry-code entry)) return)
      (ndeb-require-set "decorate-mode" "on")
      (setq return
	    (cond ((string= code "menu")
		   (ndeb-process-require "menu"))
		  ((string= code "copyright")
		   (ndeb-process-require "copyright"))
		  (t
		   (ndeb-process-require (concat "content "
						 (lookup-entry-code entry))))))
      (ndeb-require-set "decorate-mode" "off")
      return)))
	  

(put 'ndeb 'gaiji 'ndeb-dictionary-gaiji)
(defun ndeb-dictionary-gaiji (dictionary code)
  (ndeb-with-dictionary dictionary
    (let ((xbm (ndeb-process-require (concat "font " code))))
      (if (string-match "default_width" xbm)
	  xbm))))


;;;
;:: Internal functions
;;;

(defun ndeb-require-set (var value)
  (if value
      (ndeb-process-require (format "set %s \"%s\"" var value))
    (ndeb-process-require (format "unset %s" var))))

(defun ndeb-arrange-no-newline (entry)
  (goto-char (point-min))
  (while (search-forward "<no-newline>" nil t)
    (let (start end)
      (replace-match "")
      (setq start (point))
      (search-forward "</no-newline>" nil t)
      (replace-match "")
      (setq end (1+ (point)))
      (put-text-property start end 'read-only t))))

(defun ndeb-arrange-prev-next (entry)
  (goto-char (point-min))
  (while (re-search-forward "\\(<prev>\\|<next>\\)" nil t)
    (if (equal (match-string 0) "<prev>")
	(replace-match "\n(前項目⇒")
      (replace-match "(次項目⇒"))
    (if (re-search-forward "\\(</prev>\\|</next>\\)" nil t)
	(replace-match ")"))))

(defun ndeb-arrange-ignore (entry)
  (let* ((dictionary (lookup-entry-dictionary entry))
         (regexp (lookup-dictionary-option dictionary ':ignore-regexp t)))
    (while (re-search-forward regexp nil t)
      (replace-match ""))))

(defun ndeb-arrange-fill-lines (entry)
  (let ((inhibit-read-only nil)
	(buffer-read-only nil)
	(fill-column (if (integerp lookup-fill-column)
			 lookup-fill-column
		       (round (* (window-width) lookup-fill-column))))
	start)
    (while (not (eobp))
      (setq start (point))
      (end-of-line)
      (when (> (current-column) fill-column)
	;; Emacs 21.3: fill-region may or may not move the point.
	(save-restriction
	  (narrow-to-region start (point))
	  (condition-case nil
	      (fill-region start (point-max))
	    (error nil))
	  (goto-char (point-max))))
      (forward-line))))

;;;
;:: eblook process
;;;

(defun ndeb-process-open (directory appendix)
  (let* ((args (cons "-q"
		     (cons ndeb-program-arguments
			   (cons directory (if appendix (list appendix))))))
	 (buffer (lookup-open-process-buffer (concat " *ndeb+" directory "*")))
	 (process (apply 'start-process "ndeb" buffer ndeb-program-name args)))
    (process-kill-without-query process)
    (accept-process-output process)
    (with-current-buffer (or buffer (lookup-temp-buffer))
      (save-excursion
	(goto-char (point-min))
	(if (search-forward "Warning: invalid book directory" nil t)
	    (error "Invalid dictionary directory: %s" directory))
	(goto-char (point-min))
	(if (search-forward "Warning: invalid appendix directory" nil t)
	    (error "Invalid appendix directory: %s" appendix)))
      (if (not (eq buffer (current-buffer)))
	  (kill-buffer (current-buffer))))
    process))

(put 'ndeb-process-require 'lisp-indent-function 1)
(defun ndeb-process-require (command &optional filter)
  (lookup-process-require ndeb-current-process (concat command "\n")
			  (concat "^" ndeb-prompt-string) filter))

(provide 'ndeb)

;;; ndeb.el ends here
