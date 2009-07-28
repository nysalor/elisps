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
;;      本プログラムはフリー・ソフトウェアです。
;;      あなたは、Free Software Foundationが公表したGNU 一般公有使用許諾の
;;      「バージョン２」或いはそれ以降の各バージョンの中からいずれかを選択し、
;;      そのバージョンが定める条項に従って本プログラムを
;;      再頒布または変更することができます。
;;
;;      本プログラムは有用とは思いますが、頒布にあたっては、
;;      市場性及び特定目的適合性についての暗黙の保証を含めて、
;;      いかなる保証も行ないません。
;;      詳細についてはGNU 一般公有使用許諾書をお読みください。
;;
;;      GNU一般公有使用許諾は、　
;;      Free Software Foundation,
;;         59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
;;         http://www.gnu.org/licenses/gpl.html
;;      から入手可能です。
;;
;;----------------------------------------------------------------------
;; ntemacs-font.el 2008-02-20版;;
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
;;      example : IPAゴシック(ipa_gohic) for ascii and Japanese
;;
;;      (setq ntemacs-font-encode-family-list-ipa
;;        '((ascii . "IPAゴシック")
;;          (latin-iso8859-1 . "Lucida Console*")
;;          (japanese-jisx0208 . "IPAゴシック*")
;;          (katakana-jisx0201 . "IPAゴシック*")
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
;; 1.1. このファイルの中身
;;	このファイルは、Emacs on W32 で、bold を等幅で表示するための
;;	fontsetを提供しています。
;;
;;	定義しているのは、下記の2種の文字セットです。
;;          msgothic (Sans Serif)
;;          msmincho (Serif)
;;
;;	    point 7,8,9,10,12,14,16,18,20,24 のサイズ
;;
;;	を定義しています。つまり、このファイルでは、20種の、fontset を定義
;;	していることになります。
;;      defaultのサイズは、12です。
;; 
;; 1.2. 動作環境
;;	emacs on W32 は、22.1 以降をサポートします。
;;
;; 2. Usage(使い方)
;;  2.1. Install
;;      下記2つのファイルをロードパスの通ったところに置いて下さい。
;;          ntemacs-font.el (this file)
;;          fixed-width-fontset.el
;;
;;  2.2. 読み込み
;;      (if (eq window-system 'w32) (require 'ntemacs-font))
;;      としてください。
;;
;;  2.3. フォントセットを設定
;;      `fixed-width-set-fontset' を使います。
;;          Set fontset and size to `default-frame-alist' and `frame-parameter' of
;;          current frame as `font'. if size is nil, default size of fontset will be used.
;;          To get available fontset, use `fontset-list'.
;;
;;      例:
;;          (fixed-width-set-fontset "msgothic" 14)
;;
;;  2.4. recomendation
;;      以下の設定を追加されることを、強くお勧めします。
;;          (setq w32-use-w32-font-dialog nil)
;;          (setq w32-enable-synthesized-fonts t)
;;
;;  2.5. 等幅補正を切りたい場合
;;          (setq fixed-width-rescale nil)
;;      としてください。
;;
;;  3. 別のフォントセットを作りたい場合
;;      別の組合せの fontset を設定したい場合。
;;
;;      (fixed-width-create-fontset fontset size list) を使ってください。
;;          fontset : fontset の名前(striings)
;;          size : 設定したいサイズ、又はサイズのリスト
;;          list : エンコーディングとフォントのファミリーネームの連想リスト
;;         
;;      例えば、IPAゴシック(ipa_gohic) を、アスキーと日本語に使いたい場合、
;;      以下のようにしてください
;;
;;      (setq ntemacs-font-encode-family-list-ipa
;;        '((ascii . "IPAゴシック")
;;          (latin-iso8859-1 . "Lucida Console*")
;;          (japanese-jisx0208 . "IPAゴシック*")
;;          (katakana-jisx0201 . "IPAゴシック*")
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
;;      を評価すれば、7〜24 までのサイズの fontset が、fontset-ipa という名前で
;;      定義されます。
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
;; msgothic = ＭＳ ゴシック + ＭＳ ゴシック
;;

(when (x-list-fonts "*ＭＳ ゴシック*")
  (defvar ntemacs-font-encode-family-list-msgothic
    `((ascii . "ＭＳ ゴシック")
      (japanese-jisx0208 . "ＭＳ ゴシック*")
      (katakana-jisx0201 . "ＭＳ ゴシック*")
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
;; msmincho = ＭＳ 明朝 + ＭＳ 明朝
;;

(when (x-list-fonts "*ＭＳ 明朝*")
  (defvar ntemacs-font-encode-family-list-msmincho
    `((ascii . "ＭＳ 明朝")
      (japanese-jisx0208 . "ＭＳ 明朝*")
      (katakana-jisx0201 . "ＭＳ 明朝*")
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
;;  変数 section
;;

;;  使用するフォントセットを変えた後、自動で、ボールドをリスケールさせる。
;;  ボールドをリスケールする為のファクターの定義

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
  `((,(encode-coding-string ".*ＭＳ.*bold.*iso8859.*" 'emacs-mule) .
     ,fixed-width-scale-alist-ascii-bold)
    (,(encode-coding-string ".*ＭＳ.*bold.*jisx02.*" 'emacs-mule) .
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

;; variable pitch は default で、helv だけど、無いので arial に変更
;; face の attribute で、family を変更

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
;; Window の font 設定メニューではなく、Emacs標準(X-style)のメニューを使う。
;; 下で設定する、fontset-ipa** を shift + click で出てくるメニューから選べる
;; 様になる。
(setq w32-use-w32-font-dialog nil)

;; Non-nil enables selection of artificially italicized and bold fonts.
(setq w32-enable-synthesized-fonts t)

(provide 'ntemacs-font)

;;; ntemacs-font.el ends here
