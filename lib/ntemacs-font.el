;;; ntemacs-font.el -- fontsets for Emacs on Windows -*- coding: iso-2022-7bit -*-

;; Copyright (C) 2004-2008 by T. Hiromatsu <matsuan@users.sourceforge.jp>
;; Version 1_0_12
;; 2008-03-27

;;; Commentary:

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
;; ntemacs-font.el 2008-02-20$BHG(B;;
;;
;;  1. Introduction
;;  1.1. idea
;;      ntemacs-font provides font-width-compensation for fixed-width
;;      fontset for Emacs on W32. The reasons are:
;;          bold fonts has different width from normal font.
;;
;;      Defined fontset names are
;;          lucida (Sans Serif)
;;          msgothic (Sans Serif)
;;          msmincho (Serif)
;;
;;      Defined sizes are
;;          point 7,8,9,10,12,14,16,18,20,24
;;
;;      then totally 20 fontsets were defined.
;;
;;  1.2. Emacs version
;;      ntemacs-font supports after 22.1.
;;
;;  2. Usage
;;  2.1. Installation
;;      Please put two files in the folder on load-path.
;;          ntemacs-font.el (this file)
;;          fixed-width-fontset.el
;;
;;  2.2. load package
;;      (if (eq window-system 'mac) (require 'carbon-font))
;;
;;  2.3. set fontset
;;      Use `fixed-width-set-fontset'.
;;          Set fontset and size to `default-frame-alist' and `frame-parameter' of
;;          current frame as `font'. if size is nil, default size of fontset will be used.
;;          To get available fontset, use `fontset-list'.
;;
;;      example:
;;          (fixed-width-set-fontset "msgothic" 14)
;;
;;  2.4. recommendation
;;      I strongly recommend to set like as below.
;;          (setq w32-use-w32-font-dialog nil)
;;          (setq w32-enable-synthesized-fonts t)
;;
;;  3. create your own fontset
;;      If you want to create another fontset, please use  new function
;;          (fixed-width-create-fontset fontset size list)
;;              fontset : fontset name(striings)
;;              size : size or list of size that you want to create
;;              list : alist of encodings and font family name
;;    
;;      example : IPA$B%4%7%C%/(B(ipa_gohic) for ascii and Japanese
;;
;;      (setq ntemacs-font-encode-family-list-ipa
;;        '((ascii . "IPA$B%4%7%C%/(B")
;;          (latin-iso8859-1 . "Lucida Console*")
;;          (japanese-jisx0208 . "IPA$B%4%7%C%/(B*")
;;          (katakana-jisx0201 . "IPA$B%4%7%C%/(B*")
;;          (chinese-gb2312 . "Arial Unicode MS*")
;;          (chinese-big5-1 . "Arial Unicode MS*")
;;          (korean-ksc5601 . "Arial Unicode MS*")
;;          (mule-unicode-0100-24ff . "Arial Unicode MS*")
;;          (mule-unicode-e000-ffff . "Arial Unicode MS*")))
;; 
;;      (fixed-width-create-fontset "ipa"
;;                                  ntemacs-font-defined-sizes
;;                                  ntemacs-font-encode-family-list-ipa)
;;
;;      Then, you can get new fontsets "fontset-ipa", that have sizes
;;      from 7 to 24 point.
;;
;;----------------------------------------------------------------------
;;
;; 1. Introduction
;; 1.1. $B$3$N%U%!%$%k$NCf?H(B
;;	$B$3$N%U%!%$%k$O!"(BEmacs on W32 $B$G!"(Bbold $B$rEyI}$GI=<($9$k$?$a$N(B
;;	fontset$B$rDs6!$7$F$$$^$9!#(B
;;
;;	$BDj5A$7$F$$$k$N$O!"2<5-$N(B2$B<o$NJ8;z%;%C%H$G$9!#(B
;;          msgothic (Sans Serif)
;;          msmincho (Serif)
;;
;;	    point 7,8,9,10,12,14,16,18,20,24 $B$N%5%$%:(B
;;
;;	$B$rDj5A$7$F$$$^$9!#$D$^$j!"$3$N%U%!%$%k$G$O!"(B20$B<o$N!"(Bfontset $B$rDj5A(B
;;	$B$7$F$$$k$3$H$K$J$j$^$9!#(B
;;      default$B$N%5%$%:$O!"(B12$B$G$9!#(B
;; 
;; 1.2. $BF0:n4D6-(B
;;	emacs on W32 $B$O!"(B22.1 $B0J9_$r%5%]!<%H$7$^$9!#(B
;;
;; 2. Usage($B;H$$J}(B)
;;  2.1. Install
;;      $B2<5-(B2$B$D$N%U%!%$%k$r%m!<%I%Q%9$NDL$C$?$H$3$m$KCV$$$F2<$5$$!#(B
;;          ntemacs-font.el (this file)
;;          fixed-width-fontset.el
;;
;;  2.2. $BFI$_9~$_(B
;;      (if (eq window-system 'w32) (require 'ntemacs-font))
;;      $B$H$7$F$/$@$5$$!#(B
;;
;;  2.3. $B%U%)%s%H%;%C%H$r@_Dj(B
;;      `fixed-width-set-fontset' $B$r;H$$$^$9!#(B
;;          Set fontset and size to `default-frame-alist' and `frame-parameter' of
;;          current frame as `font'. if size is nil, default size of fontset will be used.
;;          To get available fontset, use `fontset-list'.
;;
;;      $BNc(B:
;;          (fixed-width-set-fontset "msgothic" 14)
;;
;;  2.4. recomendation
;;      $B0J2<$N@_Dj$rDI2C$5$l$k$3$H$r!"6/$/$*4+$a$7$^$9!#(B
;;          (setq w32-use-w32-font-dialog nil)
;;          (setq w32-enable-synthesized-fonts t)
;;
;;  2.5. $BEyI}Jd@5$r@Z$j$?$$>l9g(B
;;          (setq fixed-width-rescale nil)
;;      $B$H$7$F$/$@$5$$!#(B
;;
;;  3. $BJL$N%U%)%s%H%;%C%H$r:n$j$?$$>l9g(B
;;      $BJL$NAH9g$;$N(B fontset $B$r@_Dj$7$?$$>l9g!#(B
;;
;;      (fixed-width-create-fontset fontset size list) $B$r;H$C$F$/$@$5$$!#(B
;;          fontset : fontset $B$NL>A0(B(striings)
;;          size : $B@_Dj$7$?$$%5%$%:!"Kt$O%5%$%:$N%j%9%H(B
;;          list : $B%(%s%3!<%G%#%s%0$H%U%)%s%H$N%U%!%_%j!<%M!<%`$NO"A[%j%9%H(B
;;         
;;      $BNc$($P!"(BIPA$B%4%7%C%/(B(ipa_gohic) $B$r!"%"%9%-!<$HF|K\8l$K;H$$$?$$>l9g!"(B
;;      $B0J2<$N$h$&$K$7$F$/$@$5$$(B
;;
;;      (setq ntemacs-font-encode-family-list-ipa
;;        '((ascii . "IPA$B%4%7%C%/(B")
;;          (latin-iso8859-1 . "Lucida Console*")
;;          (japanese-jisx0208 . "IPA$B%4%7%C%/(B*")
;;          (katakana-jisx0201 . "IPA$B%4%7%C%/(B*")
;;          (chinese-gb2312 . "Arial Unicode MS*")
;;          (chinese-big5-1 . "Arial Unicode MS*")
;;          (korean-ksc5601 . "Arial Unicode MS*")
;;          (mule-unicode-0100-24ff . "Arial Unicode MS*")
;;          (mule-unicode-e000-ffff . "Arial Unicode MS*")))
;; 
;;      (fixed-width-create-fontset "ipa"
;;                                  ntemacs-font-defined-sizes
;;                                  ntemacs-font-encode-family-list-ipa)
;;
;;      $B$rI>2A$9$l$P!"(B7$B!A(B24 $B$^$G$N%5%$%:$N(B fontset $B$,!"(Bfontset-ipa $B$H$$$&L>A0$G(B
;;      $BDj5A$5$l$^$9!#(B
;;
;;                                                  T.Hiromatsu
;;                                                  matsuan@users.sourceforge.jp

(require 'fixed-width-fontset)

;;
;; emacs version check
;;

(setq ntemacs-version
      (cond
       ((string-match "22\.1\.90\." (eval emacs-version)) 1)
       ((string-match "22\.1\.9[1-9]\." (eval emacs-version)) 2)
       ((string-match "22\.2\." (eval emacs-version)) 2)
       (t 0)))

;;
;; fontset section
;;

(defvar fixed-width-encode-reg-alist
  `((latin-iso8859-1 . "iso8859*")
    (latin-iso8859-2 . "iso8859-2")
    (latin-iso8859-3 . "iso10646-1")
    (latin-iso8859-4 . "iso8859-4")
    (thai-tis620 . ,(if (= ntemacs-version 1) "tis620-1" "tis620"))
    (greek-iso8859-7 . "iso10646-1")
    (arabic-iso8859-6 . "iso8859-6")
    (hebrew-iso8859-8 . "iso8859-8")
    (katakana-jisx0201 . "jisx0201-katakana")
    (latin-jisx0201 . "jisx0201-latin")
    (cyrillic-iso8859-5 . "iso10646-1")
    (latin-iso8859-9 . "iso8859-9")
    (japanese-jisx0208-1978 . "jisx0208.1978")
    (chinese-gb2312 . ,(cond ((= ntemacs-version 0) "gb2312")
                             ((= ntemacs-version 1) "gb2312.1980-1")
                             ((= ntemacs-version 2) "gb2312.1980")))
    (japanese-jisx0208 . "jisx0208-sjis")
    (korean-ksc5601 . ,(cond ((= ntemacs-version 0) "ksc5601.1987")
                             ((= ntemacs-version 1) "ksc5601.1989-1")
                             ((= ntemacs-version 2) "ksc5601.1989")))
    (japanese-jisx0212 . "jisx0212")
    (chinese-cns11643-1 . "cns11643.1992-1")
    (chinese-cns11643-2 . "cns11643.1992-2")
    (chinese-cns11643-3 . "cns11643.1992-3")
    (chinese-cns11643-4 . "cns11643.1992-4")
    (chinese-cns11643-5 . "cns11643.1992-5")
    (chinese-cns11643-6 . "cns11643.1992-6")
    (chinese-cns11643-7 . "cns11643.1992-7")
    (chinese-big5-1 . ,(if (= ntemacs-version 1) "big5-1" "big5"))
    (chinese-big5-2 . ,(if (= ntemacs-version 1) "big5-1" "big5"))
    (chinese-sisheng . "sisheng_cwnn")
    (vietnamese-viscii-lower . "iso10646-1")
    (vietnamese-viscii-upper . "iso10646-1")
    (arabic-digit . "mulearabic*")
    (arabic-1-column . "*-#178")
    (arabic-2-column . "*-#178")
    (ipa . "iso10646-1")
    (ethiopic . "iso10646-1")
    (ascii-right-to-left . "iso8859*")
    (indian-is13194 . "is13194-devanagari")
    (indian-2-column . "muleindian*")
    (lao . "iso10646-1")
    (tibetan . "iso10646-1")
    (tibetan-1-column . "iso10646-1")
    (latin-iso8859-14 . "iso8859*")
    (latin-iso8859-15 . "iso8859*")
    (mule-unicode-0100-24ff . "iso10646-1")
    (mule-unicode-2500-33ff . "iso10646-1")
    (mule-unicode-e000-ffff . "iso10646-1")
    (japanese-jisx0213-1 . "jisx0213.2000*")
    (japanese-jisx0213-2 . "jisx0213.2000*")
    ((,(decode-char 'ucs #x2800) . ,(decode-char 'ucs #x28ff)) . "iso10646-1") ;; Braille
    ((,(decode-char 'ucs #x0900) . ,(decode-char 'ucs #x097F)) . "ISO10646.indian-1")
    (,(indian-font-char-range 'cdac:dv-ttsurekh) . "iso10646-1")
    (,(indian-font-char-range 'cdac:sd-ttsurekh) . "iso10646-1")
    (,(indian-font-char-range 'cdac:bn-ttdurga) . "iso10646-1")
    (,(indian-font-char-range 'cdac:as-ttdurga) . "iso10646-1")
    (,(indian-font-char-range 'cdac:pn-ttamar) . "iso10646-1")
    (,(indian-font-char-range 'cdac:gj-ttavantika) . "iso10646-1")
    (,(indian-font-char-range 'cdac:or-ttsarala) . "iso10646-1")
    (,(indian-font-char-range 'cdac:tm-ttvalluvar) . "iso10646-1")
    (,(indian-font-char-range 'cdac:tl-tthemalatha) . "iso10646-1")
    (,(indian-font-char-range 'cdac:kn-ttuma) . "iso10646-1")
    (,(indian-font-char-range 'cdac:ml-ttkarthika) . "iso10646-1")
    (,(indian-font-char-range 'akruti:dev) . "iso10646-1")
    (,(indian-font-char-range 'akruti:bng) . "iso10646-1")
    (,(indian-font-char-range 'akruti:pnj) . "iso10646-1")
    (,(indian-font-char-range 'akruti:guj) . "iso10646-1")
    (,(indian-font-char-range 'akruti:ori) . "iso10646-1")
    (,(indian-font-char-range 'akruti:tml) . "iso10646-1")
    (,(indian-font-char-range 'akruti:tlg) . "iso10646-1")
    (,(indian-font-char-range 'akruti:knd) . "iso10646-1")
    (,(indian-font-char-range 'akruti:mal) . "iso10646-1")))

(defvar fixed-width-xlfd-template
  "-outline-%s-normal-r-normal-normal-%d-*-*-*-*-*-iso8859-1")

(defvar fixed-width-fontset-template
  "-*-*-normal-r-normal-normal-%d-*-*-*-*-*-fontset-%s")

(defalias 'fixed-width-create-fontset-func 'create-fontset-from-ascii-font)

;;
;; Setting for International language
;;

(set-fontset-font "fontset-default"
                  'japanese-jisx0208
                  '("Arial Unicode MS*" . "jisx0208-sjis"))

(set-fontset-font "fontset-default"
                  'katakana-jisx0201
                  '("Arial Unicode MS*" . "jisx0201-katakana"))

(set-fontset-font "fontset-default"
                  'chinese-gb2312
                  `("Arial Unicode MS*" .
                    ,(cond ((= ntemacs-version 0) "gb2312")
                           ((= ntemacs-version 1) "gb2312.1980-1")
                           ((= ntemacs-version 2) "gb2312.1980"))))

(set-fontset-font "fontset-default"
                  'chinese-big5-1
                  `("Arial Unicode MS*" .
                    ,(if (= ntemacs-version 1) "big5-1" "big5")))

(set-fontset-font "fontset-default"
                  'korean-ksc5601
                  `("Arial Unicode MS*" .
                    ,(cond ((= ntemacs-version 0) "ksc5601.1987")
                           ((= ntemacs-version 1) "ksc5601.1989-1")
                           ((= ntemacs-version 2) "ksc5601.1989")))) 

(set-fontset-font "fontset-default"
                  'thai-tis620
                  `("Arial Unicode MS*" .
                    ,(if (= ntemacs-version 1) "tis620-1" "tis620")))

(set-fontset-font "fontset-default"
                  'mule-unicode-0100-24ff
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'latin-iso8859-3
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'cyrillic-iso8859-5
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'greek-iso8859-7
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'vietnamese-viscii-lower
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'vietnamese-viscii-upper
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'tibetan
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'lao
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'ipa
                  '("Arial Unicode MS*" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  'arabic-1-column
                  '("Arial Unicode MS*" . "*-#178"))

(set-fontset-font "fontset-default"
                  'arabic-2-column
                  '("Arial Unicode MS*" . "*-#178"))

;; additional font

(set-fontset-font "fontset-default"
                  'ethiopic
                  '("Ethiopia Jiret" . "iso10646-1"))

(set-fontset-font "fontset-default"
                  `(,(decode-char 'ucs #x2800) . ,(decode-char 'ucs #x28ff))
                  '("Braille*" . "iso10646-1")) ; Braille Patterns

;;
;; fontset definition section
;;

(defvar ntemacs-font-defined-sizes '(12 7 8 9 10 11 14 16 18 20 24))

;;
;; Lucida console
;;

(when (x-list-fonts "*Lucida Console*")
  (defvar ntemacs-font-encode-family-list-lucida
    `((ascii . "Lucida Console")
      (japanese-jisx0208 . "Arial Unicode MS*")
      (katakana-jisx0201 . "Arial Unicode MS*")
      (chinese-gb2312 . "Arial Unicode MS*")
      (chinese-big5-1 . "Arial Unicode MS*")
      (korean-ksc5601 . "Arial Unicode MS*")
      (thai-tis620 . "Arial Unicode MS*")
      (latin-iso8859-3 . "Arial Unicode MS*")
      (cyrillic-iso8859-5 . "Arial Unicode MS*")
      (greek-iso8859-7 . "Arial Unicode MS*")
      (hebrew-iso8859-8 . "Arial Unicode MS*")
      (latin-iso8859-9 . "Arial Unicode MS*")
      (latin-iso8859-15 . "Arial Unicode MS*")
      (ipa . "Arial Unicode MS*")
      (ethiopic . "Ethiopia Jiret")
      (vietnamese-viscii-lower . "Arial Unicode MS*")
      (vietnamese-viscii-upper . "Arial Unicode MS*")
      (lao . "Arial Unicode MS*")
      (tibetan . "Arial Unicode MS*")
      (tibetan-1-column . "Arial Unicode MS*")
      (arabic-1-column . "Arial Unicode MS*")
      (arabic-2-column . "Arial Unicode MS*")
      ((,(decode-char 'ucs #x2800) . ,(decode-char 'ucs #x28ff)) . "Braille*") ;; Braille
      (mule-unicode-0100-24ff . "Arial Unicode MS*")
      (mule-unicode-e000-ffff . "Arial Unicode MS*")))

  (fixed-width-create-fontset "lucida"
                              ntemacs-font-defined-sizes
                              ntemacs-font-encode-family-list-lucida))

;;
;; msgothic = $B#M#S(B $B%4%7%C%/(B + $B#M#S(B $B%4%7%C%/(B
;;

(when (x-list-fonts "*$B#M#S(B $B%4%7%C%/(B*")
  (defvar ntemacs-font-encode-family-list-msgothic
    `((ascii . "$B#M#S(B $B%4%7%C%/(B")
      (japanese-jisx0208 . "$B#M#S(B $B%4%7%C%/(B*")
      (katakana-jisx0201 . "$B#M#S(B $B%4%7%C%/(B*")
      (chinese-gb2312 . "Arial Unicode MS*")
      (chinese-big5-1 . "Arial Unicode MS*")
      (korean-ksc5601 . "Arial Unicode MS*")
      (thai-tis620 . "Arial Unicode MS*")
      (latin-iso8859-3 . "Arial Unicode MS*")
      (cyrillic-iso8859-5 . "Arial Unicode MS*")
      (greek-iso8859-7 . "Arial Unicode MS*")
      (hebrew-iso8859-8 . "Arial Unicode MS*")
      (latin-iso8859-9 . "Arial Unicode MS*")
      (latin-iso8859-15 . "Arial Unicode MS*")
      (ipa . "Arial Unicode MS*")
      (ethiopic . "Ethiopia Jiret")
      (vietnamese-viscii-lower . "Arial Unicode MS*")
      (vietnamese-viscii-upper . "Arial Unicode MS*")
      (lao . "Arial Unicode MS*")
      (tibetan . "Arial Unicode MS*")
      (tibetan-1-column . "Arial Unicode MS*")
      (arabic-1-column . "Arial Unicode MS*")
      (arabic-2-column . "Arial Unicode MS*")
      ((,(decode-char 'ucs #x2800) . ,(decode-char 'ucs #x28ff)) . "Braille*") ;; Braille
      (mule-unicode-0100-24ff . "Arial Unicode MS*")
      (mule-unicode-e000-ffff . "Arial Unicode MS*")))

  (fixed-width-create-fontset "msgothic"
                              ntemacs-font-defined-sizes
                              ntemacs-font-encode-family-list-msgothic))

;;
;; msmincho = $B#M#S(B $BL@D+(B + $B#M#S(B $BL@D+(B
;;

(when (x-list-fonts "*$B#M#S(B $BL@D+(B*")
  (defvar ntemacs-font-encode-family-list-msmincho
    `((ascii . "$B#M#S(B $BL@D+(B")
      (japanese-jisx0208 . "$B#M#S(B $BL@D+(B*")
      (katakana-jisx0201 . "$B#M#S(B $BL@D+(B*")
      (chinese-gb2312 . "Arial Unicode MS*")
      (chinese-big5-1 . "Arial Unicode MS*")
      (korean-ksc5601 . "Arial Unicode MS*")
      (thai-tis620 . "Arial Unicode MS*")
      (latin-iso8859-3 . "Arial Unicode MS*")
      (cyrillic-iso8859-5 . "Arial Unicode MS*")
      (greek-iso8859-7 . "Arial Unicode MS*")
      (hebrew-iso8859-8 . "Arial Unicode MS*")
      (latin-iso8859-9 . "Arial Unicode MS*")
      (latin-iso8859-15 . "Arial Unicode MS*")
      (ipa . "Arial Unicode MS*")
      (ethiopic . "Ethiopia Jiret")
      (vietnamese-viscii-lower . "Arial Unicode MS*")
      (vietnamese-viscii-upper . "Arial Unicode MS*")
      (lao . "Arial Unicode MS*")
      (tibetan . "Arial Unicode MS*")
      (tibetan-1-column . "Arial Unicode MS*")
      (arabic-1-column . "Arial Unicode MS*")
      (arabic-2-column . "Arial Unicode MS*")
      ((,(decode-char 'ucs #x2800) . ,(decode-char 'ucs #x28ff)) . "Braille*") ;; Braille
      (mule-unicode-0100-24ff . "Arial Unicode MS*")
      (mule-unicode-e000-ffff . "Arial Unicode MS*")))

  (fixed-width-create-fontset "msmincho"
                              ntemacs-font-defined-sizes
                              ntemacs-font-encode-family-list-msmincho))

;;
;;  $BJQ?t(B section
;;

;;  $B;HMQ$9$k%U%)%s%H%;%C%H$rJQ$($?8e!"<+F0$G!"%\!<%k%I$r%j%9%1!<%k$5$;$k!#(B
;;  $B%\!<%k%I$r%j%9%1!<%k$9$k0Y$N%U%!%/%?!<$NDj5A(B

(defvar fixed-width-scale-alist-ascii-bold
  '(("7" . 0.8) ("8" . 0.8) ("9" . 0.9) ("10" . 0.8) ("11" . 0.9) ("12" . 0.9)
    ("14" . 0.9) ("16" . 0.9) ("18" . 0.9) ("20" . 0.9) ("24" . 0.95)))

(defvar fixed-width-scale-alist-jis-bold
  '(("7" . 0.9) ("8" . 0.9) ("9" . 0.9) ("10" . 0.9) ("11" . 0.95) ("12" . 0.95)
    ("14" . 0.95) ("16" . 0.95) ("18" . 0.95) ("20" . 0.98) ("24" . 0.98)))

(defvar fixed-width-scale-alist-braille
  '(("7" . 1.2) ("8" . 1.2) ("9" . 1.2) ("10" . 1.2) ("11" . 1.2) ("12" . 1.2)
    ("14" . 1.2) ("16" . 1.2) ("18" . 1.2) ("20" . 1.2) ("24" . 1.2)))

(defvar fixed-width-scale-alist-arial-normal
  '(("7" . 1.15) ("8" . 1.35) ("9" . 1.35) ("10" . 1.2) ("11" . 1.1) ("12" . 1.2)
    ("14" . 1.2) ("16" . 1.25) ("18" . 1.25) ("20" . 1.2) ("24" . 1.2)))

(defvar fixed-width-scale-alist-arial-bold
  '(("8" . 1.2) ("9" . 1.25) ("10" . 1.1) ("11" . 1.0) ("12" . 1.15)
    ("14" . 1.1) ("16" . 1.2) ("18" . 1.2) ("20" . 1.15) ("24" . 1.15)))

(defvar fixed-width-scale-alist-lucida-bold
  '(("7" . 0.8) ("8" . 0.8) ("9" . 0.9) ("10" . 0.9) ("11" . 0.9) ("12" . 0.9)
    ("14" . 0.9) ("16" . 0.9) ("18" . 0.9) ("20" . 0.9) ("24" . 0.95)))

(defvar fixed-width-get-scale-alist
  `((,(encode-coding-string ".*$B#M#S(B.*bold.*iso8859.*" 'emacs-mule) .
     ,fixed-width-scale-alist-ascii-bold)
    (,(encode-coding-string ".*$B#M#S(B.*bold.*jisx02.*" 'emacs-mule) .
     ,fixed-width-scale-alist-jis-bold)
    (".*Lucida Console.*bold.*" .
     ,fixed-width-scale-alist-lucida-bold)
    (".*Arial Unicode MS.*normal.*jisx02.*" .
     ,fixed-width-scale-alist-arial-normal)
    (".*Arial Unicode MS.*bold.*jisx02.*" .
     ,fixed-width-scale-alist-arial-bold)
    (".*Arial Unicode MS.*normal.*gb2312.*" .
     ,fixed-width-scale-alist-arial-normal)
    (".*Arial Unicode MS.*bold.*gb2312.*" .
     ,fixed-width-scale-alist-arial-bold)
    (".*Arial Unicode MS.*normal.*big5.*" .
     ,fixed-width-scale-alist-arial-normal)
    (".*Arial Unicode MS.*bold.*big5.*" .
     ,fixed-width-scale-alist-arial-bold)
    (".*Arial Unicode MS.*normal.*ksc5601.*" .
     ,fixed-width-scale-alist-arial-normal)
    (".*Arial Unicode MS.*bold.*ksc5601.*" .
     ,fixed-width-scale-alist-arial-bold)
    (".*braille.*" . ,fixed-width-scale-alist-braille)
    (".*Ethiopia Jiret.*" . ,fixed-width-scale-alist-braille))
  "ReScale factor alist for each fonts and size.")

;; variable pitch $B$O(B default $B$G!"(Bhelv $B$@$1$I!"L5$$$N$G(B arial $B$KJQ99(B
;; face $B$N(B attribute $B$G!"(Bfamily $B$rJQ99(B

(set-face-attribute 'variable-pitch nil
                    :family "arial"
                    :slant 'normal
                    :weight 'normal)

(set-face-attribute 'fixed-pitch nil
                    :family "lucida"
                    :slant 'normal
                    :weight 'normal)

;; *Use the standard font dialog.
;; If nil, pop up a menu of a fixed set of fonts including fontsets, like
;; X does.  See `w32-fixed-font-alist' for the font menu definition.
;; Window $B$N(B font $B@_Dj%a%K%e!<$G$O$J$/!"(BEmacs$BI8=`(B(X-style)$B$N%a%K%e!<$r;H$&!#(B
;; $B2<$G@_Dj$9$k!"(Bfontset-ipa** $B$r(B shift + click $B$G=P$F$/$k%a%K%e!<$+$iA*$Y$k(B
;; $BMM$K$J$k!#(B
(setq w32-use-w32-font-dialog nil)

;; Non-nil enables selection of artificially italicized and bold fonts.
(setq w32-enable-synthesized-fonts t)

(provide 'ntemacs-font)

;;; ntemacs-font.el ends here
