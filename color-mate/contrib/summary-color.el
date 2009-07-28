;; summary-color.el --- Coloring mew summary buffers and mh-e folder buffers

;; Copyright (C) 1997 Masatake YAMATO.

;; Author: Masatake (jet) YAMATO <masata-y@is.aist-nara.ac.jp>
;; Created: Tue May 13 18:14:21 1997
;; Proposer : Hirokazu TAGAITO <hiroka-t@aist-nara.ac.jp>
;; Maintainer: Masatake (jet) YAMATO <masata-y@is.aist-nara.ac.jp>
;;	       Hiroshi YOKOTA <yokota@netlab.is.tsukuba.ac.jp>
;; Content-Type: text/plain; charset=x-euc-jp
;; Version: 1.0

;; Keywords: mail, mh-e, mew

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.	If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;; [English]
;; This program is painting "Mew"(http://www.mew.org/) summary mode or "mh-e"
;; folder mode. It's useful for ordering your mails.
;;
;; [Japanese]
;; このプログラムは、MewのサマリモードあるいはMH-Eのフォルダモードにおいて
;; 特定のサブジェクトあるいは差出し人のメールに色を付けます。
;; (作者のように)inboxを整理せずにほったらかしている人がメールをさがす
;; ときにメールの見分けが付きやすく便利だと思います。

;; Install:
;; [English]
;; [1] Mew or MH
;;   Which do you want to use?
;;
;;   "Mew"  => (setq summary-color-mailer 'mew)
;;   "mh-e" => (setq summary-color-mailer 'mh-e)
;;
;; [2]Colors
;;   Set up paint pattern. Background color is opptional.
;;
;;  (setq summary-color-list
;;    '((*regexp1* *foreground-color1* *background-color1*)
;;	(*regexp2* *foreground-color2*)
;;	(*regexp3* *foreground-color3* *background-color3*)
;;	... ))
;;
;;  Example:
;;   (setq summary-color-list
;;	'(("GYVE"  "Yellow" "black") ; foreground:yellow, background: black
;;	  ("foo@bar\\.com" "Red")    ; foreground:red, background: same as default
;;	  ("{mew,mhe}" "Gray")))     ; foreground:gray, background: same as default
;;
;; [3]Do "require"
;;   (require 'summary-color)
;;
;;
;; Install:
;; [1] Mew or MH
;; まずあなたがmh-eかmew, どちらを使っているか教えて下さい. 
;; 
;; mewを使っている人:
;; (setq summary-color-mailer 'mew)
;; mh-eを使っている人:
;; (setq summary-color-mailer 'mh-e)
;;
;; [2]Colors
;; 次に色を設定します.	
;; 特定のサブジェクトあるいは差出し人を指定する正規表現, foreground color
;; background colorの組を用いて色の設定を行ないます.
;; 
;; 次の形式で一つの組を定義します。
;; (*正規表現* *foreground-color* *background-color*)
;; *background-color*は省略できます。
;; 省略したときのbackground colorは summary-default-background-color で
;; 与えられている色になります。デフォルトはフレームのbackground colorです。
;; そしてこの組をリスト summary-color-listに加えて登録します.
;;
;; [3]Require
;; 最後にこのファイルを読むための指示を加えます.
;; (require 'summary-color)
;;
;; [4] Example 
;; (setq summary-color-mailer 'mew)		  ; Mewを使っています.
;; (setq summary-color-list 
;;		     '(("GYVE"	"Yellow" "black") ; 文字:黄色,	背景: 黒
;;		       ("Geena" "Red")		  ; 文字:赤,  背景: 変えない.
;;		       ("Renny" "Gray")))	  ; 文字:灰色,	背景: 変えない.
;; (require 'summary-color)
;;
;; [5] Warning
;; 森山 高明さん(taka@airlab.cs.ritsumei.ac.jp)のmew-diredを使っている方は、
;; このファイルがmew-diredより先にload/requireされるようにして下さい。

;;; Known bugs, todo and excuses:
;; summary-color-listをemacs/muleの利用中に変更(setq)しても色付けがか
;; わりません. 変更後, M-x summary-color-build-faces-interactive 
;; して下さい. またrequireのかわりにautoloadを使うようにしたいですが, 
;; このサイズのプログラムのためにそこまでしなくてもいいでしょう. 
;;
;; 筆者はMewを使っているのでMHではあまりテストしてません. 
;; もし問題があってかつ, あなたがelispがわかるなら, このプログラムの
;; 後半にあるhookのところを見て下さい. 適当なhookをmh-*.elのコード
;; から探して, summary-coloringを呼びます.  hookがなければ, defadviceを
;; 使う必要があるでしょう. 同様にすれば, 他のメイラーにも適用できるかも
;; しれません. 

;;
;; X-一次配布先:
;;				     Sun Jun 22 16:37:32 1997 --- jet
;;
;; 研究会発表準備中, 色々わがまま聞いていただきありがとうございました. 
;;
;; {mizuho-i, hiroka-t, chihok-s, ryuuta-t, tooru-t, kazuh-fu, takes-sa, fumita-m}
;; @is.aist-nara.ac.jp
;;
;; rikiya@airlab.cs.ritsumei.ac.jp, 
;; hayakawa@cv.cs.ritsumei.ac.jp, satosh-k
;;

;; X-Working-song:
;; 1st (Sarah Crackenll, lisplide, downtown)
;; 2nd (PAPERMOON, Luch's eyes(live))


;;; History:
;; summary-color.el for Color-Mate Ver.1.0.2
;;  o 引越しをしたのでメールアドレスを書き換える。
;; summary-color.el for Color-Mate Ver.1.0.1
;;  o History のプログラム提供者の名前が間違っているのを正す。
;; summary-color.el for Color-Mate Ver.1.0
;;  o Masatake (jet) YAMATO <masata-y@is.aist-nara.ac.jp>氏 より color-mate 用
;;    にとプログラムの提供を受ける。
;;  o 英語の説明を追加
;; Sun Jul 27 04:09:52 1997 Masatake YAMATO <masata-y@is.aist-nara.ac.jp>
;;	* とりあえずMH-Eでも動くようにした. 
;;	* とりあえずmandara-miscに投稿

;; $Id: summary-color.el,v 1.2 2002/05/11 02:32:13 elca Exp $

;;; Codes:

;;
;; --- User Options ---
;;

;; Select for your own mailer.
(defvar summary-color-mailer (cond ((fboundp 'mew) 'mew)
				  ((fboundp 'mh-e) 'mh-e)
				  (t (error 
				      "%s"
				      "summary-color runs on mew or mh-e!")
				     nil))
  "*mailerの指定. シンボル mew か シンボル mh-eを指定する. ")

;; Set colors
(defvar summary-color-list nil
  "*各要素が\(正規表現	foreground-color background-color\)というリスト
Mewのsummaryバッファに色を付けるのに使う. ")
;;
(defvar summary-default-background-color (cdr (assoc 'background-color
						     (frame-parameters
						      (selected-frame))))
  "*summary-color-listでbackground-colorが省略された要素に対して適用される色
もしnilであれば, mewのサマリバッファのフレームの背景色をそのまま使う. ")

;; Select folders to be colored.
(defvar summary-folders-to-be-colored t
  "*色を付けるfolderの指定. 
o tであれば+inboxでのみ色を付ける. 
o 文字列を要素とするリストであれば, そのメンバーの名前に対応するフォルダに色を
  付ける. . 例:
(setq summary-folders-to-be-colored '(\"+inbox\" \"+Backup\" \"+drafts/\"))

o nilであればすべてのバッファに色を付ける. ")

;;
;; --- Internal Vars ---
;;

;; Regexp -> face
(defvar summary-face-alist nil)		

;; Face names
(defconst summary-face-symbol-prefix "summary-face") 


;;
;; --- Functions ---
;;

;; Checking the duplication of faces.
(defun summary-check-face-dup (sym)
  (let ((list (face-list))
	elt
	r)
    (while list
      (setq elt (car list)
	    list (cdr list))
      (if (string= (symbol-name sym) (symbol-name elt))
	  (setq r elt)))
    r))

;;
(defun summary-color-generate-face-name (prefix foreground background)
  (format "%s-fg:%s-bg:%s" 
	  prefix foreground background))

;; (PREFIX for face names)
(defun summary-color-build-faces (prefix list)
  (setq summary-face-alist nil)		; Reset the variable
  (let ((tmplist list)
	name 
	fcolor 
	bcolor
	face 
	sym)
    (while tmplist
      (setq name (car (car tmplist))
	    fcolor (car (cdr (car tmplist)))
	    bcolor (car (cdr (cdr (car tmplist)))))
      (if (not bcolor) (setq bcolor summary-default-background-color))
      (if (not bcolor) (setq bcolor (cdr (assoc 'background-color
							 (frame-parameters
							  (selected-frame))))))
      (setq sym (make-symbol (summary-color-generate-face-name prefix 
							       fcolor bcolor))
	    face (summary-check-face-dup sym))
      (if (not face)
	  (setq face (make-face sym)))
      (set-face-foreground face fcolor)
      (set-face-background face bcolor)
      (setq summary-face-alist (cons 
				(cons name face) 
				summary-face-alist)
	    tmplist (cdr tmplist)))))

;; 
(defun summary-strmember (elt list)
  "Assoc using string= instead of equal."
  (let (r 
	target 
	(list2 list))
    (while list
      (setq target (car list))
      (if (string= elt target)
	  (setq r list2))
      (setq list (cdr list)))
    r))

;; 
(defun summary-coloring ()
"Mew の サマリバッファあるいはmh-eのfoldersバッファにを色付けするための関数。"
(cond
 ((eq summary-folders-to-be-colored t) ; inbox only
  (if (string= (buffer-name) "+inbox")
	(summary-coloring-core)))
 ((eq summary-folders-to-be-colored nil) ; any folder 
  (summary-coloring-core))
 ((summary-strmember (buffer-name) summary-folders-to-be-colored)
  (summary-coloring-core))))

;;	 
(defun summary-coloring-core ()
  (save-excursion
    (let (name 
	  face (tail summary-face-alist)
	  b 
	  e
	  (buffer-read-only nil))
      (while tail
	(setq name (car (car tail))
	      face (cdr (car tail))
	      tail (cdr tail))
	(goto-char (point-min))
	(while (re-search-forward name nil t)
	  (beginning-of-line) (setq b (point))
	  (end-of-line) (setq e (point))
	  (put-text-property b e
			     'face face))
	)
      ;; 安全?
      ;; (set-buffer-modified-p nil)
      ;;
      )))

;;
;; --- Adding functions on the hooks ---
;;
(cond ( ;; MEW
       (eq summary-color-mailer 'mew)
       (add-hook 'mew-summary-inc-sentinel-hook
		 (function summary-coloring))
       (add-hook 'mew-summary-scan-sentinel-hook
		 (function summary-coloring))
       (add-hook 'mew-summary-mode-hook
		 (function summary-coloring)) ;???必要なんかなぁ...
       )
      ( ;; MH-E
       (eq summary-color-mailer 'mh-e)
       ;; 適当なhookがない! (after scanning)
       (defadvice mh-scan-folder (after add-summary-color:mh-folder first activate)
	 (summary-coloring))
       ;;
       (add-hook 'mh-inc-folder-hook
		 (function summary-coloring))
       ;; 必要?
       (add-hook 'mh-refile-msg-hook
		 (function summary-coloring))	    
       ))
;;
;; Building faces...
;; 
(defun summary-color-build-faces-interactive ()
  (interactive)
  (summary-color-build-faces summary-face-symbol-prefix 
			     summary-color-list))
(summary-color-build-faces-interactive)


(provide 'summary-color)
;; summary-color.el ends here.
