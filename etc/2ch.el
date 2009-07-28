;; navi2ch関係
(setq load-path
      (cons
       (expand-file-name
	"/usr/local/share/emacs/21.3.50/site-lisp/navi2ch") load-path))

;;初期設定
(autoload 'navi2ch "navi2ch" "Navigator for 2ch" t)
(setq navi2ch-article-decode-character-references nil)
;;(setq navi2ch-net-http-proxy "localhost:8080")

;; バッファ数上限
(setq navi2ch-article-max-buffers 20)
(setq navi2ch-article-auto-expunge t)

;; ウィンドウタイトル
(defun my-navi2ch-article-set-frame-title ()
  (make-local-variable 'frame-title-format)
  (setq frame-title-format
        (navi2ch-replace-string
         "%" "%%"
         (format "navi2ch: %s: %s"
                 (cdr (assq 'name navi2ch-article-current-board))
                 (cdr (assq 'subject navi2ch-article-current-article)))
         t)))
(when (featurep 'frame)
  (add-hook 'navi2ch-article-mode-hook
            'my-navi2ch-article-set-frame-title))

;;(setq navi2ch-mona-enable t)

(setq navi2ch-list-bbstable-url "http://menu.2ch.net/bbsmenu.html")

;;自動巡回
(defvar my-navi2ch-junkai-list '("auto:ro" "auto:etc"))
(defun my-navi2ch-junkai ()
  (interactive)
  (let ((alist (mapcar (lambda (x) (cons (cdr (assq 'id x)) x))
                       navi2ch-list-board-name-list)))
    (dolist (x my-navi2ch-junkai-list)
      (navi2ch-list-select-board
       (cdr (assoc x alist)))
      (navi2ch-bm-fetch-maybe-new-articles)
      (navi2ch-bm-exit))))

;;(defun navi2ch-auto-cruise ()
;;  (navi2ch-bm-mark-all)
;;  (navi2ch-bm-fetch-mark-article)
;;  )

;;(define-key navi2ch-bookmark-mode-map "C" 'navi2ch-auto-cruise)
