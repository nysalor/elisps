;; color-mate設定

;; color-mateにロードパスを通す
(setq load-path
      (cons
       (expand-file-name
	"~/elisp/color-mate") load-path))

;; XEmacsなんて使ってる人いるのかな？
(if (string-match "XEmacs" emacs-version)
  (setq color-mate:base-path "/usr/lib/xemacs/site-packages/lisp/color-mate")
  (setq color-mate:base-path "/usr/share/emacs/site-lisp/color-mate")
)
(setq load-path
      (append
       (list color-mate:base-path
	     (concat color-mate:base-path "/theme")
	     (concat color-mate:base-path "/contrib")
	     (concat color-mate:base-path "/kanakan-cursor"))
       load-path))

;; フォントサイズ
;; 基本的に無効
;(setq default-fontset "fontset-14")

;; テーマ
;; 自作のテーマを読み込ませている
;theme file name (default "SunnyDay")
(setq color-mate:theme-file "~/elisp/etc/mytheme.el")

;; start Color-Mate
(if (and (>= (string-to-int emacs-version) 19)
	 window-system )
    (progn
      (require 'color-mate)
      (color-mate)
      (require 'color-mate-face)
      (color-mate:face)
      ))
