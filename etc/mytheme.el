;;; SunnyDay.el Color-Mate standard definition file -*-emacs-lisp-*-

;; Copyright (C) HIROSHI Yokota

;; Author: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.0
;; Keywords: color color-mate theme
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.0
;;         by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs/xemacs to more easier and more fun.
;;   mule / emacs / xemacs で、色を使用して見やすい画面にします。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This file is part of Color-Mate

;; $Id: Stone.el,v 10.1 1999/08/05 23:41:23 elca Exp $

(require 'assoc)

(setq color-mate:theme
      '(
        (frame-background-color .          "gray95")
        (frame-foreground-color .         "gray15")
        (frame-height . 48)
;;        (frame-width . 95)
;;        (frame-height . 60)
        (frame-width . 120)
;       (frame-width . 130)
        (modeline-background-color . "SlateGray")
        (modeline-foreground-color . "LightGray")
        ;(modeline-underlined . nil)
        (modeline-buffer-id-foreground-color . "gray2")
        (modeline-mousable-foreground-color . "white")
        (modeline-mousable-minor-mode-foreground-color . "white")
        ;(region-underlined . nil)
        (region-background-color . "RoyalBlue3")
        (region-foreground-color . "gray95")
        (cursor-background-color . "navy")
        (cursor-foreground-color . "gray95")
        (mouse-background-color . "gray95")
        (mouse-foreground-color . "black")
        ;(menu-bar-lines . 1)
        ;(font . "default-fontset")
        ;(line-space . "2+2")
        ))

;; for Emacs20
(if (and (>= (string-to-int emacs-version) 20)
         (not (string-match "XEmacs" emacs-version))
         (eq window-system 'x))
    (aput 'color-mate:theme 'font "fontset-standard"))

;; for XEmacs20
;;(if (and (>= (string-to-int emacs-version) 20)
;;       (string-match "XEmacs" emacs-version))
;;    (aput 'color-mate:theme 'font
;;        '("-microsoft-gothic-medium-r-*-*-12-*-*-*-*-*-iso8859-*"
;;          "-microsoft-gothic-semicondensed-r-*-*-12-*-*-*-*-*-jisx0208.1983-*"
;;          "-microsoft-gothic-semicondensed-r-*-*-12-*-*-*-*-*-jisx0208.1983-*")))

;; for "Mule for Windows"
;(if (eq window-system 'win32)
;    (aput 'color-mate:theme 'font "default"))

;; for Meadow
;(if (featurep 'meadow)
;    (aput 'color-mate:theme 'font "default-fontset"))

;;; SunnyDay.el ends here
