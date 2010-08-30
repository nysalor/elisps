;; ibuffer
;; 便利なバッファリスト
;; http://www.bookshelf.jp/soft/meadow_28.html#SEC361

(require 'ibuffer)

(setq ibuffer-formats
      '((mark modified read-only " " (name 30 30)
              " " (size 6 -1) " " (mode 16 16) " " filename)
        (mark " " (name 30 -1) " " filename)))

;; リストに表示しないバッファ
(setq ibuffer-never-show-regexps '("messages" "navi2ch"))

(setq ibuffer-directory-abbrev-alist
      '(("~/src/rails/" . "")))

(defun Buffer-menu-grep-delete (str)
  (interactive "sregexp:")
  (save-excursion
    (goto-char (point-min))
    (forward-line 2)
    (while (re-search-forward str nil t)
      (save-excursion
        (ibuffer-mark-for-delete nil)
        )
      (end-of-line))))

(define-key ibuffer-mode-map "R" 'Buffer-menu-grep-delete)
