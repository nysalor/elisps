;; ntemacs-font-sample.el ; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-

;; 2005-09-14 Takashi Hiromatsu 

(require 'ntemacs-font)

;; $B#M#S%4%7%C%/$N!"(BAnti Alias $BHG$r!"(BMS gothic $B$H$7$FEPO?$7$F$$$k$N$G(B
;; $B$3$l$r;H$C$F$_$k!#(B

(defvar ntemacs-font-encode-family-list-myms
  '((ascii . "MS gothic")
    (japanese-jisx0208 . "MS gothic*")
    (katakana-jisx0201 . "MS gothic*")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "mymsgothic"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-myms)

;; "IPA$B%4%7%C%/(B" $B$N(B iso8859-1 $B$K$O!"(Blatin-1 $BJ,$N%U%)%s%H$,4^$^$l$F$J$$$N$G!"(B
;; lucida console $B$KJQ99!#<h$j4:$($:!";d$H$7$F$O!"(BGermany$B!"(BSpanish$B!"(B
;; Swedeish$B$,I=<($G$-$l$P(BOK$B!#(B

(defvar ntemacs-font-encode-family-list-ipa
  '((ascii . "IPA$B%4%7%C%/(B")
    (latin-iso8859-1 . "Lucida Console*")
    (japanese-jisx0208 . "IPA$B%4%7%C%/(B*")
    (katakana-jisx0201 . "IPA$B%4%7%C%/(B*")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "ipa"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-ipa)

;; $B#Y!%#O#z#F#o#n#t(B $B$r;H$C$F$_$k(B
;; http://yozvox.web.infoseek.co.jp/

(defvar ntemacs-font-encode-family-list-yozn
  '((ascii . "$B#Y!%#O#z#F#o#n#t#N(B")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "YOZN"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-yozn)

(defvar ntemacs-font-encode-family-list-yozb
  '((ascii . "$B#Y!%#O#z#F#o#n#t#B(B")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "YOZB"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-yozb)

;; $B;d$O!">.$5$$J8;z$G$bFI$_$d$9$/$F!"0lHV9%$-!#(B
;; http://osakattf.hp.infoseek.co.jp/
;; $B$@$1$I!"Cx:n8"$O!)(B

(defvar ntemacs-font-encode-family-list-osaka
  '((ascii . "Osaka$B!]EyI}(B")
    (latin-iso8859-1 . "Lucida Console*")
    (japanese-jisx0208 . "Osaka$B!]EyI}(B*")
    (katakana-jisx0201 . "Osaka$B!]EyI}(B*")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "osaka"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-osaka)
