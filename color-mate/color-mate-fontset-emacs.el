;; color-mate-fontset-emacs.el fontset definition file for Emacs 20.x

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

;; $Id: color-mate-fontset-emacs.el,v 1.3 2002/12/07 17:38:37 elca Exp $

;; 12 dot
(create-fontset-from-fontset-spec
 "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-12,
  chinese-gb2312:-*-medium-r-normal-*-12-*-gb2312*-*,
  korean-ksc5601:-*-medium-r-normal-*-12-*-ksc5601*-*,
  chinese-cns11643-1:-*-medium-r-normal-*-12-*-cns11643*-1,
  chinese-cns11643-2:-*-medium-r-normal-*-12-*-cns11643*-2,
  chinese-cns11643-3:-*-medium-r-normal-*-12-*-cns11643*-3,
  chinese-cns11643-4:-*-medium-r-normal-*-12-*-cns11643*-4,
  chinese-cns11643-5:-*-medium-r-normal-*-12-*-cns11643*-5,
  chinese-cns11643-6:-*-medium-r-normal-*-12-*-cns11643*-6,
  chinese-cns11643-7:-*-medium-r-normal-*-12-*-cns11643*-7"
 t 'noerror)

;; 14 dot
(create-fontset-from-fontset-spec
 "-misc-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-14,
  chinese-gb2312:-*-medium-r-normal-*-14-*-gb2312*-*,
  korean-ksc5601:-*-medium-r-normal-*-14-*-ksc5601*-*,
  chinese-cns11643-1:-*-medium-r-normal-*-14-*-cns11643*-1,
  chinese-cns11643-2:-*-medium-r-normal-*-14-*-cns11643*-2,
  chinese-cns11643-3:-*-medium-r-normal-*-14-*-cns11643*-3,
  chinese-cns11643-4:-*-medium-r-normal-*-14-*-cns11643*-4,
  chinese-cns11643-5:-*-medium-r-normal-*-14-*-cns11643*-5,
  chinese-cns11643-6:-*-medium-r-normal-*-14-*-cns11643*-6,
  chinese-cns11643-7:-*-medium-r-normal-*-14-*-cns11643*-7"
 t 'noerror)

;; 16 dot
(create-fontset-from-fontset-spec
 "-*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-16,
  chinese-gb2312:-*-medium-r-normal-*-16-*-gb2312*-*,
  korean-ksc5601:-*-medium-r-normal-*-16-*-ksc5601*-*,
  chinese-cns11643-1:-*-medium-r-normal-*-16-*-cns11643*-1,
  chinese-cns11643-2:-*-medium-r-normal-*-16-*-cns11643*-2,
  chinese-cns11643-3:-*-medium-r-normal-*-16-*-cns11643*-3,
  chinese-cns11643-4:-*-medium-r-normal-*-16-*-cns11643*-4,
  chinese-cns11643-5:-*-medium-r-normal-*-16-*-cns11643*-5,
  chinese-cns11643-6:-*-medium-r-normal-*-16-*-cns11643*-6,
  chinese-cns11643-7:-*-medium-r-normal-*-16-*-cns11643*-7"
 t 'noerror)

;; 24 dot
(create-fontset-from-fontset-spec
 "-*-fixed-medium-r-normal-*-24-*-*-*-*-*-fontset-24,
  chinese-gb2312:-*-medium-r-normal-*-24-*-gb2312*-*,
  korean-ksc5601:-*-medium-r-normal-*-24-*-ksc5601*-*,
  chinese-cns11643-1:-*-medium-r-normal-*-24-*-cns11643*-1,
  chinese-cns11643-2:-*-medium-r-normal-*-24-*-cns11643*-2,
  chinese-cns11643-3:-*-medium-r-normal-*-24-*-cns11643*-3,
  chinese-cns11643-4:-*-medium-r-normal-*-24-*-cns11643*-4,
  chinese-cns11643-5:-*-medium-r-normal-*-24-*-cns11643*-5,
  chinese-cns11643-6:-*-medium-r-normal-*-24-*-cns11643*-6,
  chinese-cns11643-7:-*-medium-r-normal-*-24-*-cns11643*-7"
 t 'noerror)

(provide 'color-mate-fontset-emacs)

;; color-mate-fontset-emacs.el ends here
