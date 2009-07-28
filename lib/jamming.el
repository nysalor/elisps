;; Jamming
;; jamming へのインタフェース
;;; thanks to Mr. or Ms. 443=435 @ http://pc.2ch.net/test/read.cgi/mac/1034581863/
(defun sjis-byte-list-escape (lst)
  (cond
   ((null lst) nil)
   ((= (car lst) 92)
    (append (list 92 (car lst)) (sjis-byte-list-escape (cdr lst))))
   (t (cons (car lst) (sjis-byte-list-escape (cdr lst))))))

(defun string-to-sjis-string-with-escape (str)
  "文字列をSJISエンコード文字列に変換してさらに\"\\\"をエスケープ"
  (apply 'string
	 (sjis-byte-list-escape
	  (string-to-list
	   (encode-coding-string str 'sjis)))))

(require 'thingatpt)

(defun jamming-lookup (word)
  (do-applescript
   (concat "tell application \"Jamming\" \r activate \r search \""
	   (string-to-sjis-string-with-escape (read-from-minibuffer "Jamming: " word))
	   "\" \r end tell")))

(defun jamming-lookup-region (start end)
  (interactive "r")
  (jamming-lookup (buffer-substring-no-properties start end)))

(defun jamming-lookup-word ()
  (interactive)
  (jamming-lookup (word-at-point)))
