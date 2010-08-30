;; フォント設定
;; cocoa emacs用
;; バッドノウハウの塊なので注意

;; emacs23以降のみ適用
(when (>= emacs-major-version 23)

  ;; 基本設定
  (setq fixed-width-use-QuickDraw-for-ascii t)
  (setq mac-allow-anti-aliasing t)
  ;; (set-default-font "Consolas-16")

  ;; デフォルトをConsolasに
  (set-face-attribute 'default nil
		      :family "Consolas"
		      :height 170)
  ;;    		     :family "monaco"
  ;;    		     :family "outline-consolas"
  ;;                     :height 140)

  ;; フォントセットの作成
  (set-fontset-font
   (frame-parameter nil 'font)
   'mule-unicode-0100-24ff
   '("Consolas" . "iso10646-1"))
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0208
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))
  (set-fontset-font
   (frame-parameter nil 'font)
   'japanese-jisx0212
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))
  (set-fontset-font
   (frame-parameter nil 'font)
   'katakana-jisx0201
   '("Hiragino Maru Gothic Pro" . "iso10646-1"))


  ;; 作成したフォントセットを設定
  (setq face-font-rescale-alist
	;;       '(("^-apple-hiragino.*" . 1.2)
	'(("^-apple-hiragino.*" . 0.9)
	  (".*osaka-bold.*" . 1.2)
	  (".*osaka-medium.*" . 1.2)
	  (".*courier-bold-.*-mac-roman" . 1.0)
	  (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	  (".*monaco-bold-.*-mac-roman" . 0.9)
	  ;;         (".*Consolas.*" . 1.1)
	  ("-cdac$" . 1.3))))
