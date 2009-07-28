;;; MidNight.el Color-Mate dark color theme -*-emacs-lisp-*-

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
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

;; $Id: MidNight.el,v 1.2 2002/05/11 02:32:26 elca Exp $

(setq color-mate:theme
      '(
	(frame-background-color .    "rgbi:0.01/0.001/0.05")
	(frame-foreground-color .    "white")
	;(frame-height . 40)
	;(frame-width . 80)
	(modeline-background-color . "DarkViolet")
	(modeline-foreground-color . "white")
	;(modeline-underlined . nil)
	(modeline-buffer-id-foreground-color . "cyan2")
	(modeline-mousable-foreground-color . "pink")
	(modeline-mousable-minor-mode-foreground-color . "palegreen")
	;(region-underlined . nil)
	(region-background-color . "white")
	(region-foreground-color . "navy")
	(cursor-background-color . "khaki1")
	(cursor-foreground-color . "orchid")
	(mouse-background-color . "ForestGreen")
	(mouse-foreground-color . "PaleGreen")
	;(menu-bar-lines . 1)
	(font . "fontset-16")
	;(line-space . "1+1")
	(face-type . dark)
	))

;;; MidNight.el ends here
