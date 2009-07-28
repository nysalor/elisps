;;; cm_select.el -- Color-Mate Theme selecter elisp part

;; Author: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 1.0
;; Keywords: color color-mate select
;; Content-Type: text/plain; charset=x-euc-jp

;;; Commentary:
;; [english]
;;  "cm_select.el" is Theme loader. 
;;  This file requires shell script "cm_select.sh"
;;
;;  1. First, edit your .emacs
;;      change this line
;;           (setq color-mate:theme-file "SunnyDay")
;;      to
;;           (load "cm_select")
;;
;; 2. Use "cm_select.sh" to exec emacs with theme.
;;    ex)
;;      cm_select.sh Wine
;;      cm_select.sh GreenTea xemacs
;;      cm_select.sh MyTheme emacs [other emacs options...]
;;
;; [japanese]
;;  cm_select は elisp ファイルと シェルスクリプトを使って、コマンドライン
;; からの指定により、特定の色設定を持った emacs を立ち上げます。
;; これにより、その日の気分に合わせた emacs を実行できます。
;;
;; 使い方
;; 1. ~/.emace にある Color-Mate の設定を書き換えます。
;;       (setq color-mate:theme-file "SunnyDay")
;;    の部分を
;;       (load "cm_select")
;;    にします。
;; 2. シェルスクリプト "cm_select.sh" にオプションを付けて起動し、
;;    emacs を起動して下さい。
;;    例)
;;      cm_select.sh Wine
;;      cm_select.sh GreenTea xemacs
;;      cm_select.sh MyTheme emacs [other emacs options...]

;$Id: cm_select.el,v 1.2 2002/05/11 02:32:13 elca Exp $

(let ((theme (getenv "CM_THEME")))
  (setq color-mate:theme-file
	(if (not theme)
	    "SunnyDay"           ;; default
	  (progn
	    ;; xrdb の設定を解除して他に悪影響が広がらないようにする
	    (if (eq window-system 'x)
		(progn
		  (shell-command "xrdb -remove")
		  ;(shell-command
		  ; (concat "xrdb -merge " (expand-file-name "~/.Xdefaults")))
		  ;(shell-command
		  ; (concat "xrdb -merge " (expand-file-name "~/.Xresources")))
		  ))
		  theme))))

;;; cm_select.el ends here
