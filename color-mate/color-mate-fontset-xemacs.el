;; color-mate-fontset-xemacs.el XEmacs 20.x fontset definition file for XEmacs 20.x

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.yokota.ac.jp>
;; Version: 10.6
;; Keywords: color color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.6
;;         by 横田 裕思 (yokota@netlab.is.yokota.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs で、色を使用して見やすい画面にします。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This file is part of Color-Mate

;; $Id: color-mate-fontset-xemacs.el,v 1.3 2002/12/07 17:38:37 elca Exp $

(defvar color-mate:xemacs-fontset-alist
  '(("fontset-12" . ("-misc-fixed-medium-r-normal--12-*-*-*-c-*-iso8859-1"
		     "-misc-fixed-medium-r-normal--12-*-*-*-c-*-jisx0201.1976-0"
		     "-misc-fixed-medium-r-normal--12-*-*-*-c-*-jisx0208.1983-0"
		     "-*-*-medium-r-normal--12-*-*-*-c-*-jisx0212.1990-0"))
    ("fontset-14" . ("-misc-fixed-medium-r-normal--14-*-*-*-c-*-iso8859-1"
		     "-misc-fixed-medium-r-normal--14-*-*-*-c-*-jisx0201.1976-0"
		     "-misc-fixed-medium-r-normal--14-*-*-*-c-*-jisx0208.1983-0"
		     "-*-*-medium-r-normal--14-*-*-*-c-*-jisx0212.1990-0"))
    ("fontset-16" . ("-etl-fixed-medium-r-normal-*-16-*-*-*-c-*-iso8859-1"
		     "-*-fixed-medium-r-normal--16-*-*-*-c-*-jisx0201.1976-0"
		     "-*-fixed-medium-r-normal--16-*-*-*-c-*-jisx0208.1983-0"
		     "-*-fixed-medium-r-normal--16-*-*-*-c-*-jisx0212.1990-0"))
    ("fontset-24" . ("-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-1"
		     "-sony-fixed-medium-r-normal--24-*-*-*-c-*-jisx0201.1976-0"
		     "-jis-fixed-medium-r-normal--24-*-*-*-c-*-jisx0208.1983-0"
		     "-*-*-medium-r-normal--24-*-*-*-c-*-jisx0212.1990-0"))
    ("fontset-12-utf2000" . ("-misc-fixed-medium-r-normal-*-12-*-*-*-c-*-iso8859-1"
			     "-misc-fixed-medium-r-normal--12-*-*-*-c-*-jisx0201.1976-0"
			     "-misc-fixed-medium-r-normal--12-*-*-*-c-*-jisx0208.1983-0"
			     "-wadalab-mincho-medium-r-normal--12-*-*-*-c-*-jisx0212.1990-0"
			     "-munhwa-gothic-*-r-normal--12-*-*-*-c-*-ksc5601.1987-0"
			     "-moe-sung-medium-r-normal--12-*-*-*-c-*-cns11643.1986-1"
			     "-moe-sung-medium-r-normal--12-*-*-*-c-*-cns11643.1986-2"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-101"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-102"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-103"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-104"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-105"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-106"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-107"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-108"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-109"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-110"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-111"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-112"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-113"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-114"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-115"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-116"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-117"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-118"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-119"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-120"
			     "-mojikyo-mincho-medium-r-normal--12-*-*-*-c-*-mojikyopj-121"
			     "-misc-fixed-medium-r-normal--12-*-*-*-c-*-jisx0213.1999-1"
			     "-misc-fixed-medium-r-normal--12-*-*-*-c-*-iso8859-8"
			     "-misc-fixed-medium-r-normal--12-*-*-*-c-*-iso8859-15"
			     "-etl-fixed-medium-r-normal--14-*-*-*-*-*-tis620.2529-1"))
    ("fontset-14-utf2000" . ("-misc-fixed-medium-r-normal-*-14-*-*-*-c-*-iso8859-1"
			     "-misc-fixed-medium-r-normal--14-*-*-*-c-*-jisx0201.1976-0"
			     "-misc-fixed-medium-r-normal--14-*-*-*-c-*-jisx0208.1983-0"
			     "-wadalab-mincho-medium-r-normal--14-*-*-*-c-*-jisx0212.1990-0"
			     "-munhwa-gothic-*-r-normal--14-*-*-*-c-*-ksc5601.1987-0"
			     "-moe-sung-medium-r-normal--14-*-*-*-c-*-cns11643.1986-1"
			     "-moe-sung-medium-r-normal--14-*-*-*-c-*-cns11643.1986-2"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-101"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-102"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-103"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-104"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-105"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-106"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-107"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-108"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-109"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-110"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-111"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-112"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-113"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-114"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-115"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-116"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-117"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-118"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-119"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-120"
			     "-mojikyo-mincho-medium-r-normal--14-*-*-*-c-*-mojikyopj-121"
			     "-misc-fixed-medium-r-normal--14-*-*-*-c-*-jisx0213.1999-1"
			     "-misc-fixed-medium-r-normal--14-*-*-*-c-*-iso8859-8"
			     "-misc-fixed-medium-r-normal--14-*-*-*-c-*-iso8859-15"
			     "-etl-fixed-medium-r-normal--14-*-*-*-*-*-tis620.2529-1"))
    ("fontset-16-utf2000" . ("-etl-fixed-medium-r-normal--16-*-*-*-c-*-iso8859-1"
			     "-sony-fixed-medium-r-normal--16-*-*-*-c-*-jisx0201.1976-0"
			     "-jis-fixed-medium-r-normal--16-*-*-*-c-*-jisx0208.1983-0"
			     "-misc-fixed-medium-r-normal--16-*-*-*-c-*-jisx0212.1990-0"
			     "-daewoo-gothic-medium-r-normal--16-*-*-*-c-*-ksc5601.1987-0"
			     "-moe-sung-medium-r-normal--16-*-*-*-c-*-cns11643.1986-1"
			     "-moe-sung-medium-r-normal--16-*-*-*-c-*-cns11643.1986-2"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-101"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-102"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-103"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-104"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-105"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-106"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-107"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-108"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-109"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-110"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-111"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-112"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-113"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-114"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-115"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-116"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-117"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-118"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-119"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-120"
			     "-mojikyo-mincho-medium-r-normal--16-*-*-*-c-*-mojikyopj-121"
			     "-misc-fixed-medium-r-normal--16-*-*-*-c-*-jisx0213.2000-1"
			     "-etl-fixed-medium-r-normal--16-*-*-*-c-*-iso8859-2"
			     "-etl-fixed-medium-r-normal--16-*-*-*-c-*-iso8859-3"
			     "-etl-fixed-medium-r-normal--16-*-*-*-c-*-iso8859-4"
			     "-etl-fixed-medium-r-normal--16-*-*-*-c-*-iso8859-5"
			     "-etl-fixed-medium-r-normal--16-*-*-*-c-*-iso8859-7"
			     "-etl-fixed-medium-r-normal--16-*-*-*-c-*-iso8859-8"
			     "-etl-fixed-medium-r-normal--16-*-*-*-c-*-iso8859-9"
			     "-etl-fixed-medium-r-normal--16-*-*-*-*-*-tis620.2529-1"
			     "-isas-fangsong ti-medium-r-normal--16-*-*-*-c-*-gb2312.1980-0"
			     "-admas-fixed-medium-r-normal--16-*-*-*-*-*-ethio-0"))
    ("fontset-24-utf2000" . ("-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-1"
			     "-sony-fixed-medium-r-normal--24-*-*-*-c-*-jisx0201.1976-0"
			     "-jis-fixed-medium-r-normal--24-*-*-*-c-*-jisx0208.1983-0"
			     "-wadalab-mincho-medium-r-normal--24-*-*-*-c-*-jisx0212.1990-0"
			     "-daewoo-mincho-medium-r-normal--24-*-*-*-c-*-ksc5601.1987-0"
			     "-moe-sung-medium-r-normal--24-*-*-*-c-*-cns11643.1986-1"
			     "-moe-sung-medium-r-normal--24-*-*-*-c-*-cns11643.1986-2"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-101"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-102"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-103"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-104"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-105"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-106"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-107"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-108"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-109"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-110"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-111"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-112"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-113"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-114"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-115"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-116"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-117"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-118"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-119"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-120"
			     "-mojikyo-mincho-medium-r-normal--24-*-*-*-c-*-mojikyopj-121"
			     "-misc-fixed-medium-r-normal--24-*-*-*-c-*-jisx0213.1999-1"
			     "-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-2"
			     "-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-3"
			     "-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-4"
			     "-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-5"
			     "-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-7"
			     "-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-8"
			     "-etl-fixed-medium-r-normal--24-*-*-*-c-*-iso8859-9"
			     "-etl-fixed-medium-r-normal--24-*-*-*-*-*-tis620.2529-1"
			     "-isas-song ti-medium-r-normal--24-*-*-*-c-*-gb2312.1980-0"))
    )
  "Fontset list for Color-Mate/XEmacs.")


;; Set up "Mojikyo" font set
;(if (featurep 'utf-2000)
;    (progn
;      (set-charset-registry 'mojikyo-pj-1 "mojikyopj-101")
;      (set-charset-registry 'mojikyo-pj-2 "mojikyopj-102")
;      (set-charset-registry 'mojikyo-pj-3 "mojikyopj-103")
;      (set-charset-registry 'mojikyo-pj-4 "mojikyopj-104")
;      (set-charset-registry 'mojikyo-pj-5 "mojikyopj-105")
;      (set-charset-registry 'mojikyo-pj-6 "mojikyopj-106")
;      (set-charset-registry 'mojikyo-pj-7 "mojikyopj-107")
;      (set-charset-registry 'mojikyo-pj-8 "mojikyopj-108")
;      (set-charset-registry 'mojikyo-pj-9 "mojikyopj-109")
;      (set-charset-registry 'mojikyo-pj-10 "mojikyopj-110")
;      (set-charset-registry 'mojikyo-pj-11 "mojikyopj-111")
;      (set-charset-registry 'mojikyo-pj-12 "mojikyopj-112")
;      (set-charset-registry 'mojikyo-pj-13 "mojikyopj-113")
;      (set-charset-registry 'mojikyo-pj-14 "mojikyopj-114")
;      (set-charset-registry 'mojikyo-pj-15 "mojikyopj-115")
;      (set-charset-registry 'mojikyo-pj-16 "mojikyopj-116")
;      (set-charset-registry 'mojikyo-pj-17 "mojikyopj-117")
;      (set-charset-registry 'mojikyo-pj-18 "mojikyopj-118")
;      (set-charset-registry 'mojikyo-pj-19 "mojikyopj-119")
;      (set-charset-registry 'mojikyo-pj-20 "mojikyopj-120")
;      (set-charset-registry 'mojikyo-pj-21 "mojikyopj-121")
;      ;(set-charset-registry 'thai-tis620 "tis620.2529-1")
;      ;(set-charset-registry 'chinese-gb2312 "gb2312.1980-0")
;      ))

(provide 'color-mate-fontset-xemacs)

;;; color-mate-fontset-xemacs.el ends here
