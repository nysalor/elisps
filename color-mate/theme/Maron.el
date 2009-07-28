;;; Maron.el Color-Mate standard definition file -*-emacs-lisp-*-

;; Copyright (C) HIROSHI Yokota

;; Author: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.4
;; Keywords: color color-mate theme
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.4
;;         by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs/xemacs to more easier and more fun.
;;   mule / emacs / xemacs で、色を使用して見やすい画面にします。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This file is part of Color-Mate

;; $Id: Maron.el,v 1.2 2002/05/11 02:32:26 elca Exp $

(setq color-mate:theme
      '(
	(frame-background-color .          "moccasin")
	;(frame-foreground-color .         "black")
	;(frame-height . 40)
	;(frame-width . 80)
	(modeline-background-color . "tomato1")
	(modeline-foreground-color . "white")
	;(modeline-underlined . nil)
	(modeline-buffer-id-foreground-color . "MediumBlue")
	(modeline-mousable-foreground-color . "khaki1")
	(modeline-mousable-minor-mode-foreground-color . "DarkRed")
	;(region-underlined . nil)
	(region-background-color . "white")
	(region-foreground-color . "navy")
	(cursor-background-color . "white")
	(mouse-background-color . "white")
	(mouse-foreground-color . "red")
	;(menu-bar-lines . 1)
	(font . "fontset-16")
	;(line-space . "1+1")
	(face-type . light)
	))

;;; Maron.el ends here
