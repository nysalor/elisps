;; 日本語環境
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'sjis-mac)
(set-file-name-coding-system 'utf-8)

;; terminal.app
(defun mac-open-terminal ()
  (interactive)
  (let ((dir ""))
    (cond
     ((and (local-variable-p 'dired-directory) dired-directory)
      (setq dir dired-directory))
     ((stringp (buffer-file-name))
      (setq dir (file-name-directory (buffer-file-name))))
     )
    (do-applescript
     (format "
tell application \"Terminal\"
  activate
  try
    do script with command \"cd %s\"
  on error
    beep
  end try
end tell" dir))
    ))

;; シェル
(setq shell-file-name "/bin/zsh")

;; ブラウザ
(defun browse-by-safari (url arg)
  (shell-command (format "open \"%s\"" url)))
(setq browse-url-browser-function 'browse-by-safari)

;; pdf-preview
(load "pdf-preview")

;; ガベコレ
(setq gc-cons-threshold 800000)

;; バックスラッシュ
(define-key global-map [2213] nil)
(define-key global-map [67111077] nil)
(define-key global-map [134219941] nil)
(define-key global-map [201328805] nil)
(define-key function-key-map [2213] [?\\])
(define-key function-key-map [67111077] [?\C-\\])
(define-key function-key-map [134219941] [?\M-\\])
(define-key function-key-map [201328805] [?\C-\M-\\])

(define-key global-map [3420] nil)
(define-key global-map [67112284] nil)
(define-key global-map [134221148] nil)
(define-key global-map [201330012] nil)
(define-key function-key-map [3420] [?\\])
(define-key function-key-map [67112284] [?\C-\\])
(define-key function-key-map [134221148] [?\M-\\])
(define-key function-key-map [201330012] [?\C-\M-\\])

;; カーソル加速
(load "~/elisp/lib/cursor.elc")

;; 文字化け対処
(add-hook 'after-init-hook
	  (set-keyboard-coding-system 'sjis-mac))

;; フォント
;;(setq mac-allow-anti-aliasing t)
(if (eq window-system 'mac) (require 'carbon-font))
(fixed-width-set-fontset "osaka" 12)

(setq carbon-font-encode-family-list-courier
      '((ascii . "courier")
	(japanese-jisx0208 . "osaka")
	(katakana-jisx0201 . "osaka")
	(japanese-jisx0212 . "osaka")
	(chinese-gb2312 . "stheiti*")
	(chinese-big5-1 . "lihei pro*")
	(korean-ksc5601 . "applegothic*")))

(carbon-font-create-fontset "courier"
			    carbon-font-defined-sizes
			    carbon-font-encode-family-list-courier)

(global-set-key [?\C-x down]
		(lambda () (interactive) (fixed-width-set-fontset "osaka" 12)))

(global-set-key [?\C-x up]
		(lambda () (interactive) (fixed-width-set-fontset "osaka" 14)))

;; Dictionary.app
(defun dictionary ()
  "dictionary.app"
  (interactive)

  (let ((editable (not buffer-read-only))
        (pt (save-excursion (mouse-set-point last-nonmenu-event)))
        beg end)

    (if (and mark-active
             (<= (region-beginning) pt) (<= pt (region-end)) )
        (setq beg (region-beginning)
              end (region-end))
      (save-excursion
        (goto-char pt)
        (setq end (progn (forward-word) (point)))
        (setq beg (progn (backward-word) (point)))
        ))

    (browse-url
     (concat "dict:///"
             (url-hexify-string (buffer-substring-no-properties beg end))))))
(define-key global-map "\C-cw" 'dictionary)
