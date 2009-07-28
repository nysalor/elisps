;; ntemacs-font-sample.el ; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-

;; 2005-09-14 Takashi Hiromatsu 

(require 'ntemacs-font)

;; ＭＳゴシックの、Anti Alias 版を、MS gothic として登録しているので
;; これを使ってみる。

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

;; "IPAゴシック" の iso8859-1 には、latin-1 分のフォントが含まれてないので、
;; lucida console に変更。取り敢えず、私としては、Germany、Spanish、
;; Swedeishが表示できればOK。

(defvar ntemacs-font-encode-family-list-ipa
  '((ascii . "IPAゴシック")
    (latin-iso8859-1 . "Lucida Console*")
    (japanese-jisx0208 . "IPAゴシック*")
    (katakana-jisx0201 . "IPAゴシック*")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "ipa"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-ipa)

;; Ｙ．ＯｚＦｏｎｔ を使ってみる
;; http://yozvox.web.infoseek.co.jp/

(defvar ntemacs-font-encode-family-list-yozn
  '((ascii . "Ｙ．ＯｚＦｏｎｔＮ")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "YOZN"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-yozn)

(defvar ntemacs-font-encode-family-list-yozb
  '((ascii . "Ｙ．ＯｚＦｏｎｔＢ")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "YOZB"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-yozb)

;; 私は、小さい文字でも読みやすくて、一番好き。
;; http://osakattf.hp.infoseek.co.jp/
;; だけど、著作権は？

(defvar ntemacs-font-encode-family-list-osaka
  '((ascii . "Osaka−等幅")
    (latin-iso8859-1 . "Lucida Console*")
    (japanese-jisx0208 . "Osaka−等幅*")
    (katakana-jisx0201 . "Osaka−等幅*")
    (chinese-gb2312 . "Arial Unicode MS*")
    (chinese-big5-1 . "Arial Unicode MS*")
    (korean-ksc5601 . "Arial Unicode MS*")
    (mule-unicode-0100-24ff . "Arial Unicode MS*")
    (mule-unicode-e000-ffff . "Arial Unicode MS*")))

(fixed-width-create-fontset "osaka"
                             ntemacs-font-defined-sizes
                             ntemacs-font-encode-family-list-osaka)
