;; 日本語環境
(load "~/elisp/japanese-init")
;;(set-language-environment 'Japanese)
(set-default-coding-systems 'euc-jp-unix)
;;(set-buffer-file-coding-system 'euc-jp-unix)
(set-clipboard-coding-system 'sjis-mac)
;;(utf-translate-cjk-mode 1)
(set-file-name-coding-system 'utf-8)
;(if window-system
;;    (set-keyboard-coding-system 'sjis-mac)
;;  (progn
;;    (set-keyboard-coding-system 'utf-8)
;;    (set-terminal-coding-system 'utf-8)))
;;(setq default-input-method "MacOSX-IM-JP")
;;(mac-setup-inline-input-method)

;; inline patch(new)
;;(define-key global-map [kana-shift] 'mac-toggle-input-method)
;;(define-key global-map [eisu-shift] 'mac-toggle-input-method)
;;(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
;;(add-hook 'navi2ch-board-mode-hook 'mac-change-language-to-us)
;;(add-hook 'navi2ch-bm-mode-hook 'mac-change-language-to-us)
;;(add-hook 'navi2ch-article-mode-hook 'mac-change-language-to-us)

;;(setq default-input-method "MacOSX-IM-JP")
;;(global-set-key [eisu-shift]
;;   (lambda () (interactive) (inactivate-input-method)))
;;(global-set-key [kana-shift]
;;   (lambda () (interactive) (activate-input-method
;;default-input-method)))
;;(load "~/elisp/mac-im-jis.el")

;; フォント
;(load "~/elisp/font.el")
(load "~/elisp/carbon-font")
;;(set-default-font "fontset-hiraginomaru")
(set-default-font "fontset-hiraginokaku")
(setq default-frame-alist
      (append (list
              '(font . "fontset-hiraginokaku")
               )
              default-frame-alist))
(setq mac-allow-anti-aliasing t)

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

;; ブラウザ
(defun browse-by-safari (url arg)
  (shell-command (format "open \"%s\"" url)))
(setq browse-url-browser-function 'browse-by-safari)

;; isearch
;;(add-hook 'isearch-mode-hook 'mac-im-isearch-mode-setup)
;;(add-hook 'isearch-mode-end-hook 'mac-im-isearch-mode-cleanup)
;;(global-set-key "\C-\\" 'mac-im-toggle-input-method)

;; ガベコレ
(setq gc-cons-threshold 800000)

;; 再描画
;;(setq redisplay-dont-pause t)

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
