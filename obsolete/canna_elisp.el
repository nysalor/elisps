(defun canna-katakana ()
  "�������ʤ��Ѵ�"
  (interactive)
  (canna-do-function canna-func-katakana)
)
(defun canna-hiragana ()
  "�Ҥ餬�ʤ��Ѵ�"
  (interactive)
  (canna-do-function canna-func-hiragana)
)
(defun canna-katakana ()
  "canna-katakana"
  (interactive)
  (canna-do-function canna-func-katakana)
  (canna-do-function canna-func-forward)
)
(defun canna-right ()
  "canna-right"
  (interactive)
  (canna-do-function canna-func-forward)
)
(defun canna-left ()
  "canna-left"
  (interactive)
  (canna-do-function canna-func-backward)
)


(global-set-key [f7] 'canna-katakana)

