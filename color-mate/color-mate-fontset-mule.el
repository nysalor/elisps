;; color-mate-fontset-mule.el fontset difinition file for mule

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.yokota.ac.jp>
;; Version: 10.1
;; Keywords: color color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.3
;;         by 横田 裕思 (yokota@netlab.is.yokota.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs で、色を使用して見やすい画面にします。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This file is part of Color-Mate

;; $Id: color-mate-fontset-mule.el,v 1.2 2002/05/11 02:32:02 elca Exp $

(if (and window-system (not noninteractive) (eq window-system 'x)
	 (fboundp 'fontset-string-to-vector))
    (let ((buf (get-buffer-create " color-mate:*temp")))
      (save-excursion
	(set-buffer buf)
	;; 12 dot
	(if (not (fontsetp "fontset-12"))
	    (new-fontset "fontset-12"
			 (fontset-string-to-vector
			  "-*-fixed-medium-r-*--12-*-*-*-*-*-iso8859-1,
                           -*-*-medium-r-*--12-*-*-*-*-*-gb2312.1980-*,
                           -*-fixed-medium-r-*--12-*-*-*-*-*-jisx0208.1983-*,
                           -*-mincho-medium-r-*--12-*-*-*-*-*-ksc5601.1987-*,
                           -*-fixed-medium-r-*-*-12-*-*-*-*-*-jisx0201.1976-*,
                           -*-*-*-*-*-*-12-*-*-*-*-*-jisx0212.1990-*,
                           -*-*-*-*-*-*-12-*-*-*-*-*-*-*"
			  (make-vector 128 nil) )))
	;; 14 dot
	(if (not (fontsetp "fontset-14"))
	    (new-fontset "fontset-14"
			 (fontset-string-to-vector
			  "-*-fixed-medium-r-*--14-*-*-*-*-*-iso8859-1,
                           -*-*-medium-r-*--14-*-*-*-*-*-gb2312.1980-*,
                           -*-fixed-medium-r-*--14-*-*-*-*-*-jisx0208.1983-*,
                           -*-mincho-medium-r-*--14-*-*-*-*-*-ksc5601.1987-*,
                           -*-fixed-medium-r-*-*-14-*-*-*-*-*-jisx0201.1976-*,
                           -*-*-*-*-*-*-14-*-*-*-*-*-jisx0212.1990-*,
                           -*-*-*-*-*-*-14-*-*-*-*-*-*-*"
			  (make-vector 128 nil) )))
	;; 16 dot
	(if (not (fontsetp "fontset-16"))
	    (new-fontset "fontset-16"
			 (fontset-string-to-vector
			  "-*-fixed-medium-r-*--16-*-*-*-*-*-iso8859-1,
                           -*-*-medium-r-*--16-*-*-*-*-*-gb2312.1980-*,
                           -*-fixed-medium-r-*--16-*-*-*-*-*-jisx0208.1983-*,
                           -*-mincho-medium-r-*--16-*-*-*-*-*-ksc5601.1987-*,
                           -*-fixed-medium-r-*-*-16-*-*-*-*-*-jisx0201.1976-*,
                           -*-*-*-*-*-*-16-*-*-*-*-*-jisx0212.1990-*,
                           -*-*-*-*-*-*-16-*-*-*-*-*-*-*"
			  (make-vector 128 nil) )))
	;; 24 dot
	(if (not (fontsetp "fontset-24"))
	    (new-fontset "fontset-24"
			 (fontset-string-to-vector
			  "-*-fixed-medium-r-*--24-*-*-*-*-*-iso8859-1,
                           -*-*-medium-r-*--24-*-*-*-*-*-gb2312.1980-*,
                           -*-fixed-medium-r-*--24-*-*-*-*-*-jisx0208.1983-*,
                           -*-mincho-medium-r-*--24-*-*-*-*-*-ksc5601.1987-*,
                           -*-fixed-medium-r-*-*-24-*-*-*-*-*-jisx0201.1976-*,
                           -*-*-*-r-*-*-24-*-*-*-*-*-jisx0212.1990-*,
                           -*-*-*-r-*-*-24-*-*-*-*-*-*-*"
			  (make-vector 128 nil) ))) )
      (kill-buffer buf)
      ))

(provide 'color-mate-fontset-mule)

;; color-mate-fontset-mule.el ends here
