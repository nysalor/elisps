;;; -*- coding: iso-2022-7bit -*-

;; 1. Introduction
;; 1.1. $B$3$N%U%!%$%k$NCf?H(B
;;	$B$3$N%U%!%$%k$O!"(Bcarbon emacs on Mac OSX $B$G!"(B2$B%P%$%HJ8;z$H!"(Bascii$B$r(B
;;	1:2$B$NI}$G(B($B=j0bEyI}(B)$B$G!"I=<($9$k$?$a$N(Bfontset$BDj5A$NNc$r<($7$F$$$^$9!#(B
;;
;;	$BDj5A$7$F$$$k$N$O!"2<5-$N(B4$B<o$NJ8;z%;%C%H$G$9!#(B
;;	    huraginomaru**    Monaco + $B%R%i%.%N4]%4(B
;;	    huraginokaku**    Monaco + $B%R%i%.%N3Q%4(B
;;	    osaka**           Monaco + osaka
;;	    huraginomin**     Courier  + $B%R%i%.%NL@D+(B
;;
;;	**$B$NItJ,$O%5%$%:$G!"(Bascii$BJ8;z$N(Bpoint$B?t$rI=$7$^$9!#$3$N%U%!%$%k$G$O!"(B
;;	    10,12,14
;;	$B$rDj5A$7$F$$$^$9!#$D$^$j!"$3$N%U%!%$%k$G$O!"(B12$B<o$N!"(Bfontset $B$rDj5A(B
;;	$B$7$F$$$k$3$H$K$J$j$^$9!#(B
;;
;;	$B<B:]$N(B fontset$BL>$O!"(Bhiraginomaru14 $BEy$N$h$&$K@.$j$^$9!#(B
;;
;;	$BF1:-$N!"(Bcarbon-font.el $B$+$i!"(B10,12,14 point $B$NItJ,$rH4$-=P$7$?J*$H(B
;;	$B9M$($F$/$@$5$$!#(B
;;	carbon-font.el$B$K%j%M!<%`<c$7$/$O!"%7%s%\%j%C%/%j%s%/$7$F$*;H$$2<$5(B
;;	$B$$!#(B[$B=EMW(B]
;; 
;; 1.2. $BF0:n4D6-(B
;;	carbon emacs $B$O!"(B2004-03-11 $B0J9_$N(BCVS$B$+$iF~<j$7$?J*$r8f;H$$$/$@$5$$!#(B
;;	$B$=$l0JA0$NJ*$O!"(B.emacs$BFI$_9~$_$N;~$K%(%i!<$K$J$k2DG=@-$,$"$j$^$9!#(B
;;
;;	$B<o!9$JCN7C$r<x$1$F$/$@$5$C$?!"(Bmac-emacsen ML $B$d(B 2ch mac-emacsen$B2q5D(B
;;	$B<<$N;22C<T$NJ}!9$K46<U$7$^$9!#(B
;;
;; 2. Usage($B;H$$J}(B)
;; 2.1. normal $B%U%)%s%H$@$1$GNI$$>l9g(B
;;     $B$3$N%U%!%$%k$r!"(B~/$B$KCV$$$F!"(B.emacs$B$K(B   
;;     (if (eq window-system 'mac) (load "~/carbon-font"))
;;     $B$H$7$F$=$N8e$G!"(B
;;     (set-default-font "fontset-hiraginomaru14")
;;     $B$d!"(B
;;     (setq default-frame-alist (append (list
;;				   '(font . "fontset-hiragino14")
;;				   )default-frame-alist))
;;     $BEy$H$7$F$/$@$5$$!#(B
;;
;;     $BKt!"(Bload-path $B$NDL$C$?$H$3$m$KCV$$$F!"(B
;;     (if (eq window-system 'mac) (require 'carbon-font))
;;     $B$H$7$F$b!"%m!<%I$5$l$^$9!#(B
;;
;;     $BCm(B: carbon emacs $B$G!"(Biso-2022-7bit $B8GM-$JJ8;z$r(B kill & yank $B$9$k>l9g(B
;;     $BLdBj$,$"$k$h$&$J$N$G!"(B.emacs$B$K$3$N%U%!%$%k$+$i(B kill & yank $B$9$k$h$j!"(B
;;     $B$3$N%U%!%$%k$r$=$N$^$^$*;H$$$K$J$k$h$&$*4+$a$7$^$9!#(B
;;
;;     $B$b$7!"(Bkill & yank $B$9$k>l9g$O!"0l;~E*$K(B
;;     (set-clipboard-coding-system            'iso-2022-7bit)
;;     $B$7$F$/$@$5$$!#(B
;;
;; 2.2. ascii bold $B$rEyI}$GI=<($9$kJ}K!(B
;;     $B$3$NPV$G$O!"(Bascii bold $B$O!"I}$,B7$$$^$;$s!#(B2$B$D$NJ}K!$,M-$j$^$9!#(B
;;     $B0J2<$K@bL@$7$^$9$,!"(B2$B$D$NJ}K!$O!"F1;~$K$O;H$($^$;$s!#(B
;;
;; 2.2.1. face-font-rescale-alist $B$r@_Dj$9$k(B
;;     .emacs$B$K<!$NMM$K5-=R$7$F$/$@$5$$!#(B
;;     (setq face-font-rescale-alist (append (list
;;				       '(".*-bold.*" . 0.9)
;;				       )face-font-rescale-alist))
;;     $B$H$7$F$/$@$5$$!#(B
;;
;;     $B7gE@(B: Font Size$B$rESCf$GJQ$($?>l9g!"(BBold$B$,$:$l$k$3$H$,M-$k!#(B
;;           Bold$B$N9b$5$,Dc$/$J$k(B
;;     $BH~E@(B: elisp$B$@$1$G<B8=$G$-$k(B
;;
;; 2.2.2. Silk Sytem Preferences $B$r;H$&(B
;;     Silk $B%7%9%F%`4D6-@_Dj$N(B
;;         "Global/Application Settings"$B$N(B
;;             "Quartz Option Enabled" $B$H(B
;;             "Use Quartz Text Metrics" $B$K(Bcheck$B$rF~$l$k!#(B
;;         $B$3$N;~!"(BAdd Application$B$G!"(BEmacs$B$rDI2C$7$F!"(BEmacs$B$N$_$K$3$NB0@-(B
;;         $B$rM?$($?J}$,NI$$$H;W$o$l$k!#(B
;;     
;;     $B7gE@(B: $BM>7W$J%7%9%F%`4D6-@_Dj$rF~$l$kI,MW$,M-$k!#(B
;;           $B7y$$$J?M$K$H$C$F$OCWL?E*(B
;;     $BH~E@(B: Frame$BKh$K(BFont Size$B$rJQ$($F$b!"$-$A$s$HEyI}$K$J$k!#(B
;;           Bold Font$B$b!"(Bnormal Font $B$HF1$89b$5$GI=<($G$-$k!#(B
;;     
;;     silk $B$O2<5-%5%$%H$GF~<j$G$-$^$9!#(B
;;     http://www.unsanity.com/
;;
;; 2.3. Alias $B$,3]$i$J$$>l9g(B
;;     $B>.$5$$%U%)%s%H$N>l9g!"(Baliasing$B$,>e<j$/3]$i$J$$>l9g$,M-$j$^$9!"$=$N;~(B
;;     $B$O!"0J2<$NMM$K$7$F$_$F$/$@$5$$!#(B
;;
;;     (setq default-frame-alist (append (list
;;     				   '(line-spacing . 1) ; $B9T4V$r(B1point$B3+$1$k(B
;;     				   )default-frame-alist))
;;
;; 2.4. $BCf9q8l!"4Z9q8l$r$-$A$s$HI=<($5$;$k(B
;;     (utf-translate-cjk-mode t)
;;     $B$r!"%;%C%H$9$k$H!"$3$N%U%!%$%k$N!"Cf9q8l!"4Z9q8l$N%U%)%s%HL>$b$-$A$s(B
;;     $B$HI=<($5$l$^$9!#(B($BH&$G$9(B)
;;
;; 3. Changelog
;; $B=iHG(B    2004-05-30
;;	    carbon-font.el $B$+$i!"J,N%(B
;;                                                  T.Hiromatsu
;;                                                  matsuan@users.sourceforge.jp

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-hiraginomaru14" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--16-160-75-75-m-160-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--16-160-75-75-m-160-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--16-160-75-75-m-160-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--16-160-75-75-m-160-ksc5601.1989-0" 
   ",ascii:-apple-monaco-medium-r-normal--14-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-medium-r-normal--14-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-hiraginomaru12" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--14-140-75-75-m-140-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--14-140-75-75-m-140-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--14-140-75-75-m-140-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--14-140-75-75-m-140-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--14-140-75-75-m-140-ksc5601.1989-0" 
   ",ascii:-apple-monaco-medium-r-normal--12-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-medium-r-normal--12-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-hiraginomaru10" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--12-120-75-75-m-120-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N4]%4(B pro w4-medium-r-normal--12-120-75-75-m-120-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--12-120-75-75-m-120-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--12-120-75-75-m-120-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--12-120-75-75-m-120-ksc5601.1989-0" 
   ",ascii:-apple-monaco-medium-r-normal--10-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-medium-r-normal--10-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-hiraginokaku14" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--16-160-75-75-m-160-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--16-160-75-75-m-160-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--16-160-75-75-m-160-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--16-160-75-75-m-160-ksc5601.1989-0" 
   ",ascii:-apple-monaco-*-*-normal--14-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-*-*-normal--14-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-hiraginokaku12" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--14-140-75-75-m-140-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--14-140-75-75-m-140-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--14-140-75-75-m-140-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--14-140-75-75-m-140-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--14-140-75-75-m-140-ksc5601.1989-0" 
   ",ascii:-apple-monaco-*-*-normal--12-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-*-*-normal--12-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-hiraginokaku10" 
   ",japanese-jisx0208:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--12-120-75-75-m-120-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%N3Q%4(B pro w3-medium-r-normal--12-120-75-75-m-120-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--12-120-75-75-m-120-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--12-120-75-75-m-120-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--12-120-75-75-m-120-ksc5601.1989-0" 
   ",ascii:-apple-monaco-*-*-normal--10-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-*-*-normal--10-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-hiraginomin14" 
   ",japanese-jisx0208:-apple-$B%R%i%.%NL@D+(B pro w3-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%NL@D+(B pro w3-medium-r-normal--16-160-75-75-m-160-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--16-160-75-75-m-160-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--16-160-75-75-m-160-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--16-160-75-75-m-160-ksc5601.1989-0" 
   ",ascii:-apple-courier-*-*-normal--14-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-courier-*-*-normal--14-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-hiraginomin12" 
   ",japanese-jisx0208:-apple-$B%R%i%.%NL@D+(B pro w3-medium-r-normal--14-140-75-75-m-140-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%NL@D+(B pro w3-medium-r-normal--14-140-75-75-m-140-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--14-140-75-75-m-140-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--14-140-75-75-m-140-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--14-140-75-75-m-140-ksc5601.1989-0" 
   ",ascii:-apple-courier-*-*-normal--12-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-courier-*-*-normal--12-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-hiraginomin10" 
   ",japanese-jisx0208:-apple-$B%R%i%.%NL@D+(B pro w3-medium-r-normal--12-120-75-75-m-120-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-$B%R%i%.%NL@D+(B pro w3-medium-r-normal--12-120-75-75-m-120-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--12-120-75-75-m-120-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--12-120-75-75-m-120-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--12-120-75-75-m-120-ksc5601.1989-0" 
   ",ascii:-apple-courier-*-*-normal--10-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-courier-*-*-normal--10-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-osaka14" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--16-160-75-75-m-160-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--16-160-75-75-m-160-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--16-160-75-75-m-160-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--16-160-75-75-m-160-ksc5601.1989-0" 
   ",ascii:-apple-monaco-medium-r-normal--14-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-medium-r-normal--14-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-fontset-osaka12" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--14-140-75-75-m-140-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--14-140-75-75-m-140-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--14-140-75-75-m-140-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--14-140-75-75-m-140-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--14-140-75-75-m-140-ksc5601.1989-0" 
   ",ascii:-apple-monaco-medium-r-normal--12-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-medium-r-normal--12-*-75-75-m-*-mac-roman"
   ))

(create-fontset-from-fontset-spec
  (concat 
   "-*-fixed-medium-r-normal-*-10-*-*-*-*-*-fontset-osaka10" 
   ",japanese-jisx0208:-apple-osaka-medium-r-normal--12-120-75-75-m-120-jisx0208.1983-sjis" 
   ",katakana-jisx0201:-apple-osaka-medium-r-normal--12-120-75-75-m-120-jisx0201.1976-0"
   ",chinese-gb2312:-apple-$A;*ND:ZLe(B-medium-r-normal--12-120-75-75-m-120-gb2312.1980-0" 
   ",chinese-big5-1:-apple-$(0\cE*(B pro-medium-r-normal--12-120-75-75-m-120-big5-0" 
   ",korean-ksc5601:-apple-applegothic-medium-r-normal--12-120-75-75-m-120-ksc5601.1989-0" 
   ",ascii:-apple-monaco-medium-r-normal--10-*-75-75-m-*-mac-roman"
   ",latin-iso8859-1:-apple-monaco-medium-r-normal--10-*-75-75-m-*-mac-roman"
   ))

(provide 'carbon-font)
