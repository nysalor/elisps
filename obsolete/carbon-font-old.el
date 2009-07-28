;;; carbon-font.el -- fontsets for Carbon Emacs -*- coding: iso-2022-7bit -*-

;; Copyright (C) 2004-2005 by T. Hiromatsu <matsuan@users.sourceforge.jp>
;; Version 1_4_0

;;; Commentary:

;; This package defines fixed-width multilingual fontsets for Carbon Emacs
;; on Mac OS X. Comments, questions and feedback will be sent to an english
;; list <http://lists.sourceforge.jp/mailman/listinfo/macemacsjp-english>
;; of MacEmacs JP project <http://macemacsjp.sourceforge.jp/en/>.
;;----------------------------------------------------------------------
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; The GNU General Public License can be gotten from
;; the Free Software Foundation, Inc.,
;;     59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
;;     http://www.gnu.org/licenses/gpl.html
;;
;;----------------------------------------------------------------------
;;      $BK\%W%m%0%i%`$O%U%j!<!&%=%U%H%&%'%"$G$9!#(B
;;      $B$"$J$?$O!"(BFree Software Foundation$B$,8xI=$7$?(BGNU $B0lHL8xM-;HMQ5vBz$N(B
;;      $B!V%P!<%8%g%s#2!W0?$$$O$=$l0J9_$N3F%P!<%8%g%s$NCf$+$i$$$:$l$+$rA*Br$7!"(B
;;      $B$=$N%P!<%8%g%s$,Dj$a$k>r9`$K=>$C$FK\%W%m%0%i%`$r(B
;;      $B:FHRI[$^$?$OJQ99$9$k$3$H$,$G$-$^$9!#(B
;;
;;      $BK\%W%m%0%i%`$OM-MQ$H$O;W$$$^$9$,!"HRI[$K$"$?$C$F$O!"(B
;;      $B;T>l@-5Z$SFCDjL\E*E,9g@-$K$D$$$F$N0EL[$NJ]>Z$r4^$a$F!"(B
;;      $B$$$+$J$kJ]>Z$b9T$J$$$^$;$s!#(B
;;      $B>\:Y$K$D$$$F$O(BGNU $B0lHL8xM-;HMQ5vBz=q$r$*FI$_$/$@$5$$!#(B
;;
;;      GNU$B0lHL8xM-;HMQ5vBz$O!"!!(B
;;      Free Software Foundation,
;;         59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
;;         http://www.gnu.org/licenses/gpl.html
;;      $B$+$iF~<j2DG=$G$9!#(B
;;
;;----------------------------------------------------------------------
;; carbon-font.el 2005-07-27$BHG(B
;;
;; 1. Introduction
;; 1.1. $B$3$N%U%!%$%k$NCf?H(B
;;	$B$3$N%U%!%$%k$O!"(Bcarbon emacs on Mac OSX $B$G!"(B2$B%P%$%HJ8;z$H!"(Bascii$B$r(B
;;	1:2$B$NI}$G(B($B=j0bEyI}(B)$B$G!"I=<($9$k$?$a$N(Bfontset$BDj5A$NNc$r<($7$F$$$^$9!#(B
;;
;;	$BDj5A$7$F$$$k$N$O!"2<5-$N(B4$B<o$NJ8;z%;%C%H$G$9!#(B
;;	    hiraginomaru    Monaco(Ayuthaya) + $B%R%i%.%N4]%4(B
;;	    hiraginokaku    Monaco(Ayuthaya) + $B%R%i%.%N3Q%4(B
;;	    osaka           Monaco(Ayuthaya) + osaka
;;	    hiraginomin     Courier  + $B%R%i%.%NL@D+(B
;;
;;	    point 07,08,09,10,12,14,16,18,20,24 $B$N%5%$%:(B
;;	$B$rDj5A$7$F$$$^$9!#$D$^$j!"$3$N%U%!%$%k$G$O!"(B40$B<o$N!"(Bfontset $B$rDj5A(B
;;	$B$7$F$$$k$3$H$K$J$j$^$9!#(B
;;      default$B$N%5%$%:$O!"(B12$B$G$9!#(B
;; 
;;      $B$3$N%P!<%8%g%s$+$i!"=>Mh$N(B carbon-font $B$G$O=PMh$J$+$C$?!"F|K\8l%U%)(B
;;      $B%s%H$N(Bface-font$BBP1~$7$F$$$^$9!#(B
;;      $BJ?$?$/1>$($P!"(Binfo$BEy$G!"Bg$-$J;z$K%j%9%1!<%k$7$?$j!"%\!<%k%I$d!"%9(B
;;      $B%i%s%H%U%'!<%9$K$9$k0Y$NJ*$G$9!#(B
;;
;; 1.2. $BF0:n4D6-(B
;;	carbon emacs $B$O!"(B2005-06-01 $B0J9_$N(BCVS$B$+$iF~<j$7$?J*$r8f;H$$$/$@$5$$!#(B
;;	$B$=$l0JA0$NJ*$O!"(B.emacs$BFI$_9~$_$N;~$K%(%i!<$K$J$k2DG=@-$,$"$j$^$9!#(B
;;
;;	$B<o!9$JCN7C$r<x$1$F$/$@$5$C$?!"(Bmac-emacsen ML $B$d(B 2ch mac de emacs$B2q5D(B
;;	$B<<$NJ}!9$K46<U$7$^$9!#(B
;;
;; 2. Usage($B;H$$J}(B)
;; 2.0. $BCm0UE@(B
;;     $B0JA0!"(B
;;	   face-font-rescale-alist
;;     $B$N@_Dj$,I,MW$G$7$?$,!"8=:_$OITMW$G$9!#<+F0$GJQ99$5$l$^$9!#(B
;;     $B$h$C$F!"$J$K$b$7$J$/$F$b!"(Bbold$B$H!"(Bmedium$B$NI}$OF1$8$K$J$j$^$9!#(B
;;     
;; 2.1. $BFI$_9~$_J}(B
;;     $B$3$N%U%!%$%k$r!"(B~/$B$KCV$$$F!"(B.emacs$B$K(B   
;;          (if (eq window-system 'mac) (load "~/carbon-font"))
;;     $B$H$7$F$=$N8e$G!";H$&(Bfontset $B$N0Y$K(B
;;          (set-default-font "fontset-hiraginomaru")
;;     $BEy$H!"@_Dj$7$F$/$@$5$$!#$3$N>l9g!"%5%$%:$O(Bdefault$B$N(B12$B$H$J$j$^$9!#(B
;;     $BJL$N%5%$%:$r;XDj$7$?$$>l9g$O!"(B
;;          (set-default-font
;;                 "-*-*-medium-r-normal--8-*-*-*-*-*-fontset-hiraginomaru")
;;     $BEy$H%U%k%M!<%`$G;XDj$7$F$/$@$5$$!#(B
;;
;;     $BKt!"(Bload-path $B$NDL$C$?$H$3$m$KCV$$$F!"(B
;;          (if (eq window-system 'mac) (require 'carbon-font))
;;     $B$H$7$F$b!"%m!<%I$5$l$^$9!#(B
;;
;;     $B:G=i$O!"(Bfontset$B$N;XDj$r$7$J$$$G!"(Bshift + click $B$G=P$F$/$k!"(Bfontset
;;     menu $B$+$i!"$*9%$_$NJ*$rC5$9J}$,NI$$$+$b$7$l$^$;$s!#(B
;;
;; 2.2. ascii bold $B$rEyI}$GI=<($9$k(B
;;
;;      Bold$B$bF1$8$K$J$k$h$&!"(Bfont $B$NBg$-$5$r!"(Bface-font-rescale-alist $B$G!"(B
;;      $BD4@0$7$F$$$^$9!#(B
;;
;;     $BESCf$G!"(Bfontset-menu$B$+$i(Bfontset$B$rA*$s$@>l9g$b!"<+F0$GJQ99$5$l$^$9!#(B
;;     $B7gE@(B: Bold$B$N9b$5$,Dc$/$J$k(B
;;     $BH~E@(B: elisp$B$@$1$G<B8=$G$-$k(B
;;
;; 2.3. Alias $B$,3]$i$J$$>l9g(B
;;     $B>.$5$$%U%)%s%H$N>l9g!"(Baliasing$B$,>e<j$/3]$i$J$$>l9g$,M-$j$^$9!"$=$N;~(B
;;     $B$O!"0J2<$NMM$K$7$F$_$F$/$@$5$$!#(B
;;     (setq mac-allow-anti-aliasing t)
;;
;; 2.4. $BCf9q8l!"4Z9q8l$r$-$A$s$HI=<($5$;$k(B
;;     (utf-translate-cjk-mode t)
;;     $B$r!"%;%C%H$9$k$H!"$3$N%U%!%$%k$N!"Cf9q8l!"4Z9q8l$N%U%)%s%HL>$b$-$A$s(B
;;     $B$HI=<($5$l$^$9!#(B($BH&$G$9(B)
;;
;; 3. Changelog
;; 1_4_0   2005-07-27
;;         $B;3K\$5$s(B(Mew)$B$K4X?t$r=q$-49$($F$$$?$@$-$^$7$?!#(B
;;         $B$3$NJQ99$K$h$j!"(Bfontset$B$N;XDjJ}K!$,JQ$o$j$^$7$?!#(B
;;         silk $B%5%]!<%H$rCf;_$7$^$7$?!#(B
;;         $BL@D+$K$"$o$;$F!"(Bgb2312$B!"(Bbig5$B!"(Bksc5601$B$N%U%)%s%H$rJQ99(B
;;
;; 1_3_0   2005-07-04 face $BBP1~$rA4(Bfontset$B$K(B
;;         ascii font $B$N@_Dj$r(B create-fontset-from-mac-roman-font $B$KJQ99(B
;;         $B;3K\$5$s(B(emacs-devel)$B$N=u8@$K$h$jJQ99$7$^$7$?!#(B
;;
;; 1_2_2   2005-05-21 Tiger$BBP:v(B
;;         monaco $B$,I=<($G$-$J$$%5%$%:$N(Balternative$B$H$7$F!"(Bayuthaya $B8GDj$G$O$J$/(B
;;         $B?7$?$K!"JQ?t(B carbon-font-monaco-alternative $B$r@_$1$F!"%G%U%)%k%H$K(B
;;         "lucida sans typewriter" $B$r@_Dj!#(B
;; 1_2_1 2005-04-17 $B0J2<$rDI2C(B
;;         mac-roman-lower, mac-roman-upper,
;;         mule-unicode-0100-24ff, mule-unicode-2500-33ff,
;;         mule-unicode-e000-ffff, iso10646-1
;;
;; 1_2_0   2005-03-27 $BAjED$5$s$NJQ99$r<h$j9~$_(B
;;         fontset $B@_Dj$N4X?t2=(B
;;         iso8859-15 $B$rDI2C(B
;;         
;; 1_1_1   2005-02-27
;;         centraleurope$B!"(Bcyrillic $B$N(BFont$B$rD4@0(B
;; 1_1_0   2005-01-30   
;;         centraleurope$B!"(Bcyrillic $B$K(B $BBP1~(B
;;         osaka$B$N0lIt$K!"(Bfont-face $BBP1~(B
;;
;; 1_0_2   2005-01-16
;;         courier new $B$NB8:_$r<+F0H=JL$9$k$h$&$KJQ99(B
;; 1_0_1   2004-12-12
;;         ayuthaya font $B$N(Bencode$BL>$,!"(Bcyrillic$B$K@.$C$?$N$KH<$$!"1S$_(B
;;         $B9~$a$J$/$J$C$?$N$G!"(BFIX$B!#(B
;; 1_0_0   2000-11-14 $BHG$r!"(B1_0_0 $B$H$9$k!#(B
;;
;; 3.2$BHG(B   2004-11-14
;;         $B%^%$%J!<%P%0%U%#%C%/%9(B & $B4X?tL>@0M}(B
;;          Doc. $B@0M}!"G[I[>r7oJQ99(B
;; 3.1$BHG(B   2004-10-11
;;	   ayuthaya $B$N<+F0H=DjJ}K!JQ99(B
;;         hiraginomin07,09,10,16$B%Q%i%a!<%?JQ99(B
;;	   hiraginomin07,16$B$K!"(Bcourier new $B;HMQ(B
;; 3  $BHG(B   2004-10-10
;;	   face-font-rescale-alist $B$r<+F0@_Dj2=(B
;;
;; 2.3$BHG(B   2004-10-09
;;	   carbon-font-sub$B<h$j9~$_(B
;; 2.2$BHG(B   2004-05-30
;;	   $B@bL@DI2C(B
;;         bug$B=$@5(B
;; 2.1$BHG(B   2004-05-12
;;         bug$B=$@5(B
;;         Osaka$BDI2C(B
;;
;; 2  $BHG(B   2004-05-04
;;         Apple $BM3Mh$N(BFont$B$@$1$K$9$k$?$a!"(BAndale mono $B$r!"(BAuthaya $B$KJQ99(B
;;         $B%R%i%.%N3Q%4!"%R%i%.%NL@D+$rDI2C(B
;;         07,08 point $B$rDI2C(B
;; 
;; $B=iHG(B    2004-03-16
;;                                                  T.Hiromatsu
;;                                                  matsuan@users.sourceforge.jp

;;
;; fontset section
;;

(defvar carbon-font-defined-sizes '(12 7 8 9 10 14 16 18 20 24))

(defun carbon-font-create-fontset
  (fontset ascii-font gb-font big5-font japanese-font korean-font size-list)
  (let (size)
    (while size-list
      (setq size (car size-list))
      (setq size-list (cdr size-list))
      (setq font-name
            (format "-*-*-medium-r-normal--%d-*-*-*-*-*-fontset-%s" size fontset))
      (create-fontset-from-mac-roman-font
       (format
        "-apple-%s-medium-r-normal--%d-*-*-*-*-*-mac-roman" ascii-font size)
       nil
       fontset)
      (set-fontset-font font-name
                        'japanese-jisx0208 (cons japanese-font "jisx0208.*"))
      (set-fontset-font font-name
                        'katakana-jisx0201 (cons japanese-font "jisx0201.*"))
      (set-fontset-font font-name
                        'chinese-gb2312 (cons gb-font "gb2312.*"))
      (set-fontset-font font-name
                        'chinese-big5-1 (cons big5-font "big5-*"))
      (set-fontset-font font-name
                        'korean-ksc5601 (cons korean-font "ksc5601.*")))))

;;
;; hiraginomaru** = $B%R%i%.%N4]%4(B + monaco(alternative) 
;;

(carbon-font-create-fontset
 "hiraginomaru" "monaco"
 "$A;*ND:ZLe(B*"
 (if (x-list-fonts "*apple ligothic medium*") "apple ligothic medium*" "$(0\cE*(B*")
 "$B%R%i%.%N4]%4(B*" "applegothic*"
 carbon-font-defined-sizes)

;;
;; hiraginokaku** = $B%R%i%.%N3Q%4(B + monaco(alternative) 
;;

(carbon-font-create-fontset
 "hiraginokaku" "monaco"
 (if (x-list-fonts "*$A;*NDO8:Z(B*") "$A;*NDO8:Z(B*" "$A;*ND:ZLe(B*")
 "$(0\cE*(B*"
 "$B%R%i%.%N3Q%4(B*" "applegothic*"
 carbon-font-defined-sizes)

;;
;; hiraginomin** = $B%R%i%.%NL@D+(B + courier 
;;

(carbon-font-create-fontset
 "hiraginomin" "courier"
 (if (x-list-fonts "*$A;*NDKNLe(B*") "$A;*NDKNLe(B*" "$A;*ND:ZLe(B*")
 (if (x-list-fonts "*$(0\c+{(B*") "$(0\c+{(B*" "$(0\cE*(B*")
 "$B%R%i%.%NL@D+(B*"
 (if (x-list-fonts "*applemyungjo*") "applemyungjo*" "applegothic*")
 carbon-font-defined-sizes)

;;
;; osaka** = osaka + monaco(alternative) 
;;

(carbon-font-create-fontset
 "osaka" "monaco"
 "$A;*ND:ZLe(B*" "$(0\cE*(B*" "osaka*" "applegothic*"
 carbon-font-defined-sizes)

;;
;;  $BJQ?t(B section
;;

;;  $B;HMQ$9$k%U%)%s%H%;%C%H$rJQ$($?8e!"<+F0$G!"%\!<%k%I$r%j%9%1!<%k$5$;$k!#(B
;;  $B$b$7!"(BSilk$B$r;H$&>l9g$O!"(Bnil$B$K%;%C%H(B

;; (defvar carbon-font-auto-rescale-enable t
;;   "Enable auto set face-font-rescale-alist after changing font.")

;;  $B%\!<%k%I$r%j%9%1!<%k$9$k0Y$N%U%!%/%?!<$NDj5A(B

;; (defvar carbon-font-scale-alist-without-silk
(defvar carbon-font-get-scale-alist
  '(("monaco-bold" . (    ( "7" . 0.8)
                          ( "8" . 0.95)
                          ( "9" . 0.90)
                          ("10" . 0.8)
                          ("12" . 0.9)
                          ("14" . 0.9)
                          ("16" . 0.95)
                          ("18" . 0.9)
                          ("20" . 0.95)
                          ("24" . 0.92)))
    ("courier-bold" . (   ( "7" . 1.0)
                          ( "9" . 0.9)
                          ("10" . 0.9)))
    ("courier-medium" . ( ( "7" . 1.0)
                          ("20" . 1.1)))
    ("osaka-medium" . (   ( "7" . 1.15)
                          ( "8" . 1.25)
                          ( "9" . 1.35)
                          ("10" . 1.2)
                          ("12" . 1.2)
                          ("14" . 1.2)
                          ("16" . 1.25)
                          ("18" . 1.25)
                          ("20" . 1.2)
                          ("24" . 1.2)))
    ("osaka-bold" . (     ( "8" . 1.2)
                          ( "9" . 1.25)
                          ("10" . 1.10)
                          ("12" . 1.2)
                          ("14" . 1.2)
                          ("16" . 1.20)
                          ("18" . 1.20)
                          ("20" . 1.15)
                          ("24" . 1.2)))
    ("pro w4-medium" . (  ( "7" . 1.15)
                          ( "8" . 1.3)
                          ( "9" . 1.35)
                          ("10" . 1.2)
                          ("12" . 1.2)
                          ("14" . 1.2)
                          ("16" . 1.25)
                          ("18" . 1.25)
                          ("20" . 1.2)
                          ("24" . 1.2)))
    ("pro w4-bold" . (    ( "7" . 1.15)
                          ( "8" . 1.3)
                          ( "9" . 1.35)
                          ("10" . 1.2)
                          ("12" . 1.2)
                          ("14" . 1.2)
                          ("16" . 1.25)
                          ("18" . 1.25)
                          ("20" . 1.2)
                          ("24" . 1.2)))
    ("pro w3-medium" . (  ( "7" . 1.15)
                          ( "8" . 1.3)
                          ( "9" . 1.35)
                          ("10" . 1.2)
                          ("12" . 1.2)
                          ("14" . 1.2)
                          ("16" . 1.25)
                          ("18" . 1.25)
                          ("20" . 1.2)
                          ("24" . 1.2)))
    ("pro w3-bold" . (    ( "7" . 1.15)
                          ( "8" . 1.3)
                          ( "9" . 1.35)
                          ("10" . 1.2)
                          ("12" . 1.2)
                          ("14" . 1.2)
                          ("16" . 1.25)
                          ("18" . 1.25)
                          ("20" . 1.2)
                          ("24" . 1.2)))
    ("medium-.*-gb2312" . (("7" . 1.15)
                          ( "8" . 1.25)
                          ( "9" . 1.35)
                          ("10" . 1.2)
                          ("12" . 1.2)
                          ("16" . 1.25)
                          ("18" . 1.25)
                          ("20" . 1.2)))
    ("bold-.*-gb2312" .  (( "8" . 1.2)
                          ( "9" . 1.3)
                          ("10" . 1.10)
                          ("12" . 1.2)
                          ("16" . 1.20)
                          ("18" . 1.20)
                          ("20" . 1.15)))
    ("medium-.*-big5" .  (( "7" . 1.15)
                          ( "8" . 1.25)
                          ( "9" . 1.35)
                          ("10" . 1.2)
                          ("12" . 1.2)
                          ("16" . 1.25)
                          ("18" . 1.25)
                          ("20" . 1.2)))
    ("bold-.*-big5" .    (( "8" . 1.2)
                          ( "9" . 1.3)
                          ("10" . 1.10)
                          ("12" . 1.2)
                          ("16" . 1.20)
                          ("18" . 1.20)
                          ("20" . 1.15)))
    ("medium-.*-ksc5601" . (("7" . 1.15)
                          ( "8" . 1.25)
                          ( "9" . 1.35)
                          ("10" . 1.2)
                          ("12" . 1.2)
                          ("16" . 1.25)
                          ("18" . 1.25)
                          ("20" . 1.2)))
    ("bold-.*-ksc5601" . (( "8" . 1.2)
                          ( "9" . 1.3)
                          ("10" . 1.10)
                          ("12" . 1.2)
                          ("16" . 1.20)
                          ("18" . 1.20)
                          ("20" . 1.15))))
  "ReScale factor alist for each fonts and size.")
;;   "ReScale factor alist for each fonts and size without silk.")

;; (defvar carbon-font-scale-alist-with-silk
;;   '(("ayuthaya-medium" . (("20". 1.1)
;;                           ("24". 1.1)))
;;     ("courier-medium" . ( ("20". 1.1)))
;;     ("osaka-medium" . (   ( "8". 1.2)
;;                           ( "9". 1.2)
;;                           ("10". 1.2)
;;                           ("12". 1.2)
;;                           ("15". 1.2)
;;                           ("20". 1.2)))
;;     ("osaka-bold" . (     ( "8". 1.3)
;;                           ( "9". 1.3)
;;                           ("10". 1.3)
;;                           ("12". 1.3)
;;                           ("15". 1.2)
;;                           ("20". 1.3))))
;;   "ReScale factor alist for each fonts and size with silk.")

;;  $B4X?tDj5A(B

;; (defun carbon-font-get-scale-alist ()
;;   (if carbon-font-auto-rescale-enable
;;       carbon-font-scale-alist-without-silk
;;     carbon-font-scale-alist-with-silk))

;;  $B%+%l%s%H%U%l!<%`$G;H$o$l$F$$$k%U%)%s%H$N!"%j%9%1!<%k%U%!%/%?!<$r!"(B
;;  carbon-font-scale-alist $B$+$i!"<hF@$9$k!#(B

(defun carbon-font-get-scale (font-name)
  "current frame $B$G!"(Bfont-name $B$N!"(Brescale parameter $B$rJV$9(B"
  (let* ((font (cdr (assoc 'font (frame-parameters))))
	 (xlfd-fields (x-decompose-font-name font))
	 (size (aref xlfd-fields xlfd-regexp-pixelsize-subnum))
	 (font-scales (assoc font-name carbon-font-get-scale-alist))
	 (scale (cdr (assoc size font-scales))))
    (or scale 1.0)))

;;  $B<hF@$7$?%j%9%1!<%k%U%!%/%?!<$G!"(Bface-font-rescale-alist$B$r=q$-49$($k!#(B

(defun carbon-font-append-factor ()
  (let ((scale-list carbon-font-get-scale-alist)
	ent font new old key)
    (while scale-list
      (setq ent (car scale-list))
      (setq scale-list (cdr scale-list))
      (setq font (car ent))
      (setq key (format ".*%s.*" font))
      (setq new (cons key (carbon-font-get-scale font)))
      (setq old (assoc key face-font-rescale-alist))
      (setq face-font-rescale-alist (delete old face-font-rescale-alist))
      (setq face-font-rescale-alist (cons new face-font-rescale-alist)))))

;;  $B%U%)%s%H$,JQ99$5$l$?>l9g$K%U%C%/$r$+$1$F!"(B
;;  carbon-font-append-factor $B$r5/F0$9$k!#(B

(add-hook 'after-setting-font-hook 'carbon-font-append-factor)

(provide 'carbon-font)

;;; carbon-font.el ends here
