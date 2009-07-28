;; color-mate-fontset-mule-win32.el fontset definition file for "Mule for win32"

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.4
;; Keywords: color color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.4
;;         by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs で、色を使用して見やすい画面にします。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This file is part of Color-Mate

;; $Id: color-mate-fontset-mule-win32.el,v 1.2 2002/05/11 02:32:02 elca Exp $

(mapcar
 (lambda (x)
   (let* ((font                (nth 0 x))
	  (encoding            (nth 1 x))
	  (name                (nth 2 x))
	  (height              (nth 3 x))
	  (logfont             (list font 0 (- height) 400 0 nil nil encoding 1 3 49))
	  (logfont-bold        (list font 0 (- height) 700 0 nil nil encoding 1 3 49))
	  (logfont-italic      (list font 0 (- height) 400 0 t   nil encoding 1 3 49))
	  (logfont-italic-bold (list font 0 (- height) 700 0 t   nil encoding 1 3 49)))

    (win32-add-fontset name 0 height 0 0)
    (win32-add-font "default" *sjis* name)

    (win32-change-font-property "default" 0 logfont             name)
    (win32-change-font-property "default" 1 logfont-bold        name)
    (win32-change-font-property "default" 2 logfont-italic      name)
    (win32-change-font-property "default" 3 logfont-italic-bold name)

    (apply 'win32-change-fontset-attribute
	   (append (win32-get-font-metric "default" 3 name)
		   (list name)))))

 '(("ＭＳ ゴシック" 128 "fontset-12" 12)
   ("ＭＳ ゴシック" 128 "fontset-14" 14)
   ("ＭＳ ゴシック" 128 "fontset-16" 16)
   ("ＭＳ ゴシック" 128 "fontset-24" 24)))

(provide 'color-mate-fontset-mule-win32)

;; color-mate-fontset-mule-win32.el ends here
