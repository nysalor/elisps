;; cocoa emacs用設定

;; IM設定
;; IMごとにモードラインの表示を変えられる
(setq default-input-method "MacOSX")
(mac-set-input-method-parameter "com.justsystems.inputmethod.atok21.Japanese" `title "あ")
(mac-set-input-method-parameter "com.justsystems.inputmethod.atok21.Japanese" `cursor-type 'box)
(mac-set-input-method-parameter "com.justsystems.inputmethod.atok21.Japanese" `cursor-color "red")
(mac-add-key-passed-to-system 'shift)

;; 日本語環境
(set-language-environment "Japanese")

;; 文字コード
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'sjis-mac)
(set-file-name-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8-unix)
;;(mac-add-ignore-shortcut '(control))

;; デフォルトをutfに
(set-default-coding-systems 'utf-8)

;; フォント設定
(load "~/elisp/etc/cocoa-font.el")

;; シェル
;; macportsで入れたzshに
(setq shell-file-name "/opt/local/bin/zsh")

;; 実行パス
;; macports優先にする
(setq exec-path (append '("/opt/local/bin" "/opt/local/sbin" "/usr/sbin" "/sbin" "/usr/local/bin") exec-path))

;; urlをブラウザで開く
(defun browse-by-safari (url arg)
  (shell-command (format "open \"%s\"" url)))
(setq browse-url-browser-function 'browse-by-safari)

;; optionキーをmetaキーとして扱う
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; ドラッグ＆ドロップでファイルを開く
(define-key global-map [ns-drag-file] 'ns-find-file)

;; スクロールバーを消す
(set-scroll-bar-mode nil)

;; 行番号表示
;; ソースコードの場合のみ表示させる
(dolist (hook (list
              'c-mode-hook
              'emacs-lisp-mode-hook
              'lisp-interaction-mode-hook
              'lisp-mode-hook
              'java-mode-hook
              'sh-mode-hook
	      'ruby-mode-hook
	      'rhtml-mode-hook
              ))
(add-hook hook (lambda () (linum-mode t))))

;; ビジュアルベル無効
;; emacs23のビジュアルベルが変なので
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; 選択範囲の色
;;(set-face-background 'region  "RoyalBlue3")
(set-face-background 'region  "brown")

;; 透過
(set-frame-parameter nil 'alpha 85)
(add-to-list 'default-frame-alist '(alpha . (0.85 0.75)))

;; ウィンドウサイズ変更
;; 外部モニタを繋いだときに大きく表示したい

;; フレーム拡大
(defun enlarge-frame ()
  "enlarge window"
  (interactive)
;;  (set-default-font my-font-large)
  (set-frame-height (selected-frame) 50)
  (set-frame-width (selected-frame) 160)
  )

;; フレーム縮小
(defun shrink-frame ()
  "shrink window"
  (interactive)
;;  (set-default-font my-font-small)
  (set-frame-height (selected-frame) 42)
  (set-frame-width (selected-frame) 90)
  )

;; キーに割り当てる
(define-key global-map "\C-c\C-l" 'enlarge-frame)
(define-key global-map "\C-c\C-s" 'shrink-frame)

;; その他キーバインド
(define-key global-map [?¥] [?\\])
(define-key global-map [?\C-¥] [?\C-\\])
(define-key global-map [?\M-¥] [?\M-\\])
(define-key global-map [?\C-\M-¥] [?\C-\M-\\])
