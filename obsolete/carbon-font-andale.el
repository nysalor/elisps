;;; -*- coding: iso-2022-7bit -*-

;; 1. Introduction
;; $B$3$N%U%!%$%k$O!"(Bcarbon emacs on Mac OSX $B$G!"(B2$B%P%$%HJ8;z$H!"(Bascii$B$r(B1:2$B$N(B
;; $BI}$G(B($B=j0bEyI}(B)$B$G!"I=<($9$k$?$a$N(Bfontset$BDj5A$NNc$r<($7$F$$$^$9!#(B
;; carbon-font.el $B$N!"(Bmonaco(ayuthaya)$B$r!"(Bandale mono $B$KCV$-49$($?$b$N$G$9!#(B
;; carbon-font.el $B$K%j%M!<%`$7$F$*;H$$$/$@$5$$!#(B
;; $B;H$$J}$O!"(Bcarbon-font.el $B$r$4Mw$/$@$5$$!#(B
;;
;;                                                  T.Hiromatsu
;;                                                  matsuan@users.sourceforge.jp

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-24-*-*-*-*-*-fontset-hiraginomaru24" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--28-288-75-75-m-288-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--28-288-75-75-m-288-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--28-288-75-75-m-288-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--28-288-75-75-m-288-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--28-288-75-75-m-288-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--24-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--24-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-20-*-*-*-*-*-fontset-hiraginomaru20" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--24-240-75-75-m-240-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--24-240-75-75-m-240-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--24-240-75-75-m-240-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--24-240-75-75-m-240-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--24-240-75-75-m-240-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--20-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--20-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-18-*-*-*-*-*-fontset-hiraginomaru18" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--22-216-75-75-m-216-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--22-216-75-75-m-216-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--22-216-75-75-m-216-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--22-216-75-75-m-216-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--22-216-75-75-m-216-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--18-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--18-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-hiraginomaru16" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--20-200-75-75-m-200-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--20-200-75-75-m-200-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--20-200-75-75-m-200-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--20-200-75-75-m-200-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--20-200-75-75-m-200-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--16-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--16-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-hiraginomaru14" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--16-160-75-75-m-160-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--16-160-75-75-m-160-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--16-160-75-75-m-160-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--16-160-75-75-m-160-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--14-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--14-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-hiraginomaru12" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--14-140-75-75-m-140-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--14-140-75-75-m-140-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--14-140-75-75-m-140-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--14-140-75-75-m-140-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--14-140-75-75-m-140-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--12-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--12-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-hiraginomaru10" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--12-120-75-75-m-120-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--12-120-75-75-m-120-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--12-120-75-75-m-120-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--12-120-75-75-m-120-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--12-120-75-75-m-120-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--10-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--10-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-9-*-*-*-*-*-fontset-hiraginomaru09" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--10-100-75-75-m-100-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--10-100-75-75-m-100-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--10-100-75-75-m-100-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--10-100-75-75-m-100-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--10-100-75-75-m-100-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--9-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--9-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-8-*-*-*-*-*-fontset-hiraginomaru08" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--10-100-75-75-m-100-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--10-100-75-75-m-100-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--10-100-75-75-m-100-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--10-100-75-75-m-100-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--10-100-75-75-m-100-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--8-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--8-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-7-*-*-*-*-*-fontset-hiraginomaru07" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--8-80-75-75-m-80-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--8-80-75-75-m-80-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--8-80-75-75-m-80-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--8-80-75-75-m-80-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--8-80-75-75-m-80-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--7-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--7-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-24-*-*-*-*-*-fontset-hiraginokaku24" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--28-288-75-75-m-288-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--28-288-75-75-m-288-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--28-288-75-75-m-288-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--28-288-75-75-m-288-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--28-288-75-75-m-288-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-*-*-normal--24-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-*-*-normal--24-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-20-*-*-*-*-*-fontset-hiraginokaku20" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--24-240-75-75-m-240-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--24-240-75-75-m-240-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--24-240-75-75-m-240-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--24-240-75-75-m-240-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--24-240-75-75-m-240-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-*-*-normal--20-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-*-*-normal--20-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-18-*-*-*-*-*-fontset-hiraginokaku18" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--22-216-75-75-m-216-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--22-216-75-75-m-216-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--22-216-75-75-m-216-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--22-216-75-75-m-216-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--22-216-75-75-m-216-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-*-*-normal--18-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-*-*-normal--18-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-hiraginokaku16" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--20-200-75-75-m-200-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--20-200-75-75-m-200-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--20-200-75-75-m-200-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--20-200-75-75-m-200-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--20-200-75-75-m-200-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-*-*-normal--16-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-*-*-normal--16-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-hiraginokaku14" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--16-160-75-75-m-160-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--16-160-75-75-m-160-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--16-160-75-75-m-160-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--16-160-75-75-m-160-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-*-*-normal--14-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-*-*-normal--14-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-hiraginokaku12" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--14-140-75-75-m-140-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--14-140-75-75-m-140-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--14-140-75-75-m-140-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--14-140-75-75-m-140-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--14-140-75-75-m-140-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-*-*-normal--12-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-*-*-normal--12-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-hiraginokaku10" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--12-120-75-75-m-120-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--12-120-75-75-m-120-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--12-120-75-75-m-120-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--12-120-75-75-m-120-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--12-120-75-75-m-120-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-*-*-normal--10-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-*-*-normal--10-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-9-*-*-*-*-*-fontset-hiraginokaku09" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--10-100-75-75-m-100-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--10-100-75-75-m-100-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--10-100-75-75-m-100-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--10-100-75-75-m-100-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--10-100-75-75-m-100-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-*-*-normal--9-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-*-*-normal--9-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-8-*-*-*-*-*-fontset-hiraginokaku08" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--10-100-75-75-m-100-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--10-100-75-75-m-100-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--10-100-75-75-m-100-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--10-100-75-75-m-100-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--10-100-75-75-m-100-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--8-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--8-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-7-*-*-*-*-*-fontset-hiraginokaku07" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--8-80-75-75-m-80-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--8-80-75-75-m-80-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--8-80-75-75-m-80-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--8-80-75-75-m-80-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--8-80-75-75-m-80-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--7-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--7-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-24-*-*-*-*-*-fontset-osaka24" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--28-288-75-75-m-288-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--28-288-75-75-m-288-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--28-288-75-75-m-288-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--28-288-75-75-m-288-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--28-288-75-75-m-288-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--24-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--24-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-20-*-*-*-*-*-fontset-osaka20" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--24-240-75-75-m-240-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--24-240-75-75-m-240-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--24-240-75-75-m-240-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--24-240-75-75-m-240-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--24-240-75-75-m-240-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--20-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--20-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-18-*-*-*-*-*-fontset-osaka18" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--22-216-75-75-m-216-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--22-216-75-75-m-216-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--22-216-75-75-m-216-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--22-216-75-75-m-216-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--22-216-75-75-m-216-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--18-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--18-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-osaka16" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--20-200-75-75-m-200-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--20-200-75-75-m-200-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--20-200-75-75-m-200-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--20-200-75-75-m-200-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--20-200-75-75-m-200-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--16-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--16-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-osaka14" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--16-160-75-75-m-160-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--16-160-75-75-m-160-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--16-160-75-75-m-160-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--16-160-75-75-m-160-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--14-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--14-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-osaka12" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--14-140-75-75-m-140-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--14-140-75-75-m-140-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--14-140-75-75-m-140-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--14-140-75-75-m-140-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--14-140-75-75-m-140-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--12-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--12-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-osaka10" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--12-120-75-75-m-120-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--12-120-75-75-m-120-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--12-120-75-75-m-120-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--12-120-75-75-m-120-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--12-120-75-75-m-120-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--10-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--10-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-9-*-*-*-*-*-fontset-osaka09" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--10-100-75-75-m-100-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--10-100-75-75-m-100-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--10-100-75-75-m-100-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--10-100-75-75-m-100-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--10-100-75-75-m-100-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--9-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--9-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-8-*-*-*-*-*-fontset-osaka08" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--10-100-75-75-m-100-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--10-100-75-75-m-100-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--10-100-75-75-m-100-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--10-100-75-75-m-100-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--10-100-75-75-m-100-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--8-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--8-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-7-*-*-*-*-*-fontset-osaka07" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--8-80-75-75-m-80-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--8-80-75-75-m-80-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--8-80-75-75-m-80-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--8-80-75-75-m-80-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--8-80-75-75-m-80-ksc5601.1989-0" 
   ",ascii:-apple-andale mono-medium-r-normal--7-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-andale mono-medium-r-normal--7-*-75-75-m-*-mac-roman"
   ))

(provide 'carbon-font)
