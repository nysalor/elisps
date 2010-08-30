; emacsカスタマイズ
; .emacs/.emacs.el/init.elに以下を記述
; (load (expand-file-name "~/path/to/emacs.el") nil t nil)

;;;; load-path
;; 環境ごとに設定すること

(setq load-path
      (append '("~/elisp/"
                "~/elisp/site-lisp/"
                "~/elisp/lib/"
                "~/elisp/elc/"
                "~/elisp/ruby/"
                "~/elisp/rails/"
                "/usr/local/share/emacs/site-lisp"
                "/usr/local/share/emacs"
                "/usr/share/emacs"
                ) load-path))

(setq exec-path
      (append
       (list "~/bin") exec-path))

;;;; OSごとの設定
(load "~/elisp/etc/platform.el")

;;;; 振る舞い

;; 自動折り返し
(setq text-mode-hook '(lambda () (set-fill-column 70)))
(setq text-mode-hool 'turn-on-auto-fill)
;;(setq color-mate-line-space "3+3")

;; 検索で大文字と小文字を区別
(setq-default case-fold-search nil)

;; 自動的に行を追加
(setq next-line-add-newlines nil)

;; 改行も含めてカット
(setq kill-whole-line t)

;; カラム表示
(column-number-mode 1)

;; ビジュアルベル
(setq visible-bell t)

;; カーソル点滅
(blink-cursor-mode 1)

;; shiftを押しながらカーソル移動で選択
(pc-selection-mode t)

;; ミニバッファのリサイズを抑制
(setq resize-mini-windows nil)

;; オートセーブ
;; intervalは打鍵回数、timeoutは秒数
;;(setq auto-save-interval 100)
(setq auto-save-timeout 30)

;; バックアップを作成しない
(setq backup-inhibited t)

;; その他キーバインド
;; 指定行に移動
(global-set-key "\C-xl" 'goto-line)
(global-set-key "\M-g" 'goto-line)
;; 分割したフレームを閉じる
(global-set-key "\M-0" 'delete-window)
(global-set-key "\M-1" 'delete-other-window)
;; ヘルプ
(global-set-key "\M-?" 'help-for-help)
;; バッファの切り替え
(global-set-key [?\C-,] 'bs-cycle-next)
(global-set-key [?\C-.] 'bs-cycle-previous)
(global-set-key "\C-z" nil)
;; 環境によっては必要
;;(global-set-key [delete] 'delete-char)

;; !で対応する括弧に移動
;; !じゃない方がいいかも知れない
(global-set-key "!" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert !."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; 分割フレームの入れ替え
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key "\C-c3" 'swap-screen-with-cursor)

;;;; 外観

;; スプラッシュを消す
(setq inhibit-startup-message t)

;; ツールバーを消す
(tool-bar-mode -1)
;; こっちは古いやり方
;;(custom-set-variables
;; '(load-home-init-file t t)
;; '(toolbar-visible-p nil))

;;;; 追加機能

;; redo
(require 'redo)
(global-set-key "\C-\\" (quote redo))

;; カーソル位置を記録
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/emacs.d/save-places")

;; 行番号表示
;; 23以降では不要になった
;;(require 'wb-line-number)
;;(setq truncate-partial-width-windows nil)
;;(set-scroll-bar-mode nil)
;;(wb-line-number-toggle)
;;(setq wb-line-number-scroll-bar t)
;;(global-set-key [f1] 'wb-line-number-toggle)
;;(line-number-mode 0)

;; 最近使ったファイルリストを保存
(require 'recentf)
(recentf-mode 1)

;; ファイルオープン・バッファ切り替え支援
(require 'ido)
(ido-mode t)

;; color-moccur
(require 'color-moccur)
(global-set-key "\C-c\C-f" 'moccur-grep-find)
(global-set-key "\C-c\C-g" 'moccur)

;; emacs-nav
;; ファイルリストを表示する
;;(require 'nav)
;;(global-set-key [f2] 'nav-toggle)

;; timestamp挿入
(autoload 'instamp "instamp" "Insert TimeStamp on the point" t)
(define-key global-map "\C-cs" 'instamp)

;; zen-encoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

;;;; 各種設定

;; シェル
(load "~/elisp/etc/shell.el")

;; 辞書
(load "~/elisp/etc/dict.el")

;; c/migemo
(load "~/elisp/etc/migemo.el")

;;;; アプリケーション

;; tabbar
(load "~/elisp/etc/tabbar.el")

;; revive
;;(load "~/elisp/revive.el")

;; color-mate
(load "~/elisp/etc/emacs-color.el")

;; navi2ch
(load "~/elisp/etc/2ch.el")

;; ibuffer
(load "~/elisp/etc/buffer.el")

;;;; 開発関係

;; cperl-mode
(load "~/elisp/etc/perl.el")

;; ruby-mode
(load "~/elisp/etc/ruby.el")

;; php-mode
(load "~/elisp/etc/php.el")

;; git-emacs
(load "~/elisp/etc/git.el")

;; ECB
;;(load "~/elisp/etc/ecb.el")
