;; color-mate-fontset-meadow.el fontset definition file for Meadow

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.6.2
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

;; $Id: color-mate-fontset-meadow.el,v 1.3 2002/05/12 16:27:51 elca Exp $


;; This setting requires "MS-Gothic" font.
(create-fontset-from-request
  "fontset-12"
  '((width  . 6)
    (height . 12)
    (fixed  . t)
    (italic . nil))
  '((famiry . "FixedSys")
    (family . "ＭＳ ゴシック")
    (family . "Courier")))

(create-fontset-from-request
  "fontset-14"
  '((width  . 7)
    (height . 14)
    (fixed  . t)
    (italic . nil))
  '((family . "FixedSys")
    (family . "ＭＳ ゴシック")
    (family . "Courier")))

(create-fontset-from-request
  "fontset-16"
  '((width  . 8)
    (height . 16)
    (fixed  . t)
    (italic . nil))
  '((family . "FixedSys")
    (family . "ＭＳ ゴシック")
    (family . "Courier")))

(create-fontset-from-request
  "fontset-24"
  '((width  . 12)
    (height . 24)
    (fixed  . t)
    (italic . nil))
  '((family . "FixedSys")
    (family . "ＭＳ ゴシック")
    (family . "Courier")))

(provide 'color-mate-fontset-meadow)

;; color-mate-fontset-meadow.el ends here
