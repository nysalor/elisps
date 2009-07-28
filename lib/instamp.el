;; -*- Emacs-Lisp -*-
;; instamp.el - Insert TimeStamp on the point
;; $Id: instamp.el,v 1.7 2004/09/08 03:06:43 yuuji Exp $
;; Last modified Wed Sep  8 08:33:19 2004 on balius
;; Update count: 49

;; This file contains Japanese characters.

;;[What's this]
;;
;;	Insert time string at the point.
;;	ポイント位置に時刻を挿入する。
;;
;;[How to use]
;;
;;	M-x instamp   (or certain key stroke you defined in .emacs)
;;
;;	If you don't like that time format, you can switch format by
;;	typing C-p/C-n immediately after M-x instamp.
;;
;;[使い方]
;;	M-x instamp   (それか .emacs で定義したキー)
;;	直後なら書式は C-p/C-n で自由に変えられる。
;;
;;
;;[How to install]
;;
;;	Put the next expressions in your ~/.emacs
;;
;;	(autoload 'instamp "instamp" "Insert TimeStamp on the point" t)
;;	(define-key global-map "\C-cs" 'instamp)
;;	;; "\C-cs" is an example. Choose your favorable key sequence)
;;
;;	上のEmacs-Lispを ~/.emacs に入れよう。"\C-cs" の部分は単なる例で、
;;	好きなキーに変えましょー。
;;
;;[Customization]
;;
;;	You can define the format list of inserted time string by
;;	setting the variable instamp-date-format-list-private.  If you
;;	want to get the time formats "Jan/24/2004" and "01/24/2004", for
;;	example, set like this;
;;
;;	(setq instamp-date-format-list-private
;;	     '("%b/%d/%Y" "%m/%d/%Y"))
;;
;;	↑みたいに定義しておくと、"Jan/24/2004" とか "01/24/2004" みたい
;;	な書式での文字列が挿入候補として追加される。
;;
;;[Other function]
;;
;;	M-x instamp-reset-date-format-list resets the order of format list
;;

(defvar instamp-date-command "date"
  "*date command name(for emacs19 or former.")
(defvar instamp-date-format-list-default
  '("%Y/%m/%d" "%Y/%m/%d(%a)"
    "%Y/%m/%d %H:%M:%S" "%Y/%m/%d(%a) %H:%M:%S"
    "%Y-%m-%d" "%Y-%m-%d(%a)"
    "%Y-%m-%d %H:%M:%S" "%Y-%m-%d(%a) %H:%M:%S"
    "%y/%m/%d" "%y/%m/%d(%a)"
    "%y-%m-%d" "%y-%m-%d(%a)"
    "%m/%d" "%m/%d(%a)"
    "%m-%d" "%m-%d(%a)"
    "%m月%d日(%j)%H時%M分" "%m月%d日(%j)%H時%M分%S秒"
    "%m月%d日(%j)" "%Y年%m月%d日(%j)"
    "%m/%d(%j)" "%Y/%m/%d(%j)")
  "Default Format passed to strftime.
%j は日本語の曜日名に変えられる。")
(defvar instamp-date-format-list-private nil
  "*List of time format string.
See the manpage of strftime(3).
Good example is defined in instamp-date-format-list.")

(defvar instamp-date-format-list nil
  "*List of time format string.
See the documentation of instamp-date-format-list.")

(defvar instamp-remove-preceding-zero t
  "*Non-nil removes preceding zeros")

(defun instamp-reset-date-format-list ()
  "Reset date-format list."
  (interactive)
  (setq instamp-date-format-list
	(append instamp-date-format-list-private
		instamp-date-format-list-default)))
(instamp-reset-date-format-list)

(defun instamp-format-time-string (format)
  (if (string< "19" emacs-version)
      (format-time-string format (current-time))
    (let ((tmpbuf (get-buffer-create " *instamp tmp*"))
	  (cb (current-buffer))
	  (-c (cond
	       ((boundp 'shell-command-option) shell-command-option)
	       ((boundp 'shell-command-switch) shell-command-switch)
	       (t "-c"))))
      (unwind-protect
	  (save-excursion
	    (set-buffer tmpbuf)
	    (erase-buffer)
	    (call-process shell-file-name
			  nil t nil
			  -c
			  (format "%s \"+%s\"" instamp-date-command format))
	    (buffer-string))
	(set-buffer cb)
	(kill-buffer tmpbuf)))))

(defun instamp-japanese-wday (str)
  "Translate %j to Japanese weekday name."
  (let ((new str)
	(wday (instamp-format-time-string "%w"))
	(wtable '("日" "月" "火" "水" "木" "金" "土"))
	p)
    (or (string-match "[0-9]" wday)
	(error "Your system does not have date command."))
    (setq wday (string-to-int wday))
    (while (setq p (string-match "%j" new))
      (setq new (concat (substring new 0 p)
			(nth wday wtable)
			(substring new (+ 2 p)))))
    new))

(defun instamp-remove-zeroprefix (string)
  (let ((ptn "/\\<0\\([0-9]+\\)")
	(new string) p)
    (if (fboundp 'replace-regexp-in-string)
	(replace-regexp-in-string ptn "/\\1" string)
      (while (setq p (string-match ptn new))
	(setq new (concat (substring new 0 (1+ p))
			  (substring new (match-beginning 1)))))
      new)))

(defun instamp (n)
  "Insert TimeStamp on the point.
Define your favorite time format(list) in instamp-date-format-list."
  (interactive "P")
  (let*((len (length instamp-date-format-list))
	(up (car (where-is-internal 'previous-line)))
	(upkey (key-description up))
	(dn (car (where-is-internal 'next-line)))
	(dnkey (key-description dn))
	(p (point)) (mf (buffer-modified-p)) date
	(n (or n 0)) key r fmt
	(msg (format "Continue=SPC up=[%s] down=[%s] quit=q z=zero"
		     upkey dnkey)))
    (if (catch 'done
	  (while t
	    (setq n (% (+ len n) len)
		  fmt (nth n instamp-date-format-list))
	    (if (string-match "%j" fmt)
		(setq fmt (instamp-japanese-wday fmt)))
	    (setq date (instamp-format-time-string fmt))
	    (if instamp-remove-preceding-zero
		(setq date (instamp-remove-zeroprefix date)))
	    (delete-region (point) p)
	    (insert date)
	    (setq key (char-to-string (read-char msg)))
	    (cond
	     ((or (eq (key-binding key) 'previous-line)
		  (string-match "\C-e\\|C-p" key))
	      (setq n (1- n))
	      (delete-region (point) p))
	     ((or (eq (key-binding key) 'next-line)
		  (string-match "\C-x\\|C-n" key))
	      (setq n (1+ n)))
	     ((equal key " ")
	      (throw 'done t))
	     ((equal key "q")
	      (delete-region (point) p)
	      (set-buffer-modified-p mf)
	      (throw 'done nil))
	     ((equal key "z")
	      (setq instamp-remove-preceding-zero
		    (not instamp-remove-preceding-zero)))
	     (t (setq unread-command-char (aref key 0))
		(throw 'done t)))))
	;; date string is inserted, put selected result at the head.
	(setq instamp-date-format-list
	      (cons fmt (delq fmt instamp-date-format-list))))
    (message "")))


; Local variables:
; fill-prefix: ";;	"
; paragraph-start: "^$\\|\\|;;$"
; paragraph-separate: "^$\\|\\|;;$"
; buffer-file-coding-system: euc-jp
; coding: euc-jp
; End:
