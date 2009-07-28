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
;; ���Υץ����ϡ�Mew�Υ��ޥ�⡼�ɤ��뤤��MH-E�Υե�����⡼�ɤˤ�����
;; ����Υ��֥������Ȥ��뤤�Ϻ��Ф��ͤΥ᡼��˿����դ��ޤ���
;; (��ԤΤ褦��)inbox�����������ˤۤä��餫���Ƥ���ͤ��᡼��򤵤���
;; �Ȥ��˥᡼��θ�ʬ�����դ��䤹���������Ȼפ��ޤ���

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
;; �ޤ����ʤ���mh-e��mew, �ɤ����ȤäƤ��뤫�����Ʋ�����. 
;; 
;; mew��ȤäƤ����:
;; (setq summary-color-mailer 'mew)
;; mh-e��ȤäƤ����:
;; (setq summary-color-mailer 'mh-e)
;;
;; [2]Colors
;; ���˿������ꤷ�ޤ�.	
;; ����Υ��֥������Ȥ��뤤�Ϻ��Ф��ͤ���ꤹ������ɽ��, foreground color
;; background color���Ȥ��Ѥ��ƿ��������Ԥʤ��ޤ�.
;; 
;; ���η����ǰ�Ĥ��Ȥ�������ޤ���
;; (*����ɽ��* *foreground-color* *background-color*)
;; *background-color*�Ͼ�ά�Ǥ��ޤ���
;; ��ά�����Ȥ���background color�� summary-default-background-color ��
;; Ϳ�����Ƥ��뿧�ˤʤ�ޤ����ǥե���Ȥϥե졼���background color�Ǥ���
;; �����Ƥ����Ȥ�ꥹ�� summary-color-list�˲ä�����Ͽ���ޤ�.
;;
;; [3]Require
;; �Ǹ�ˤ��Υե�������ɤि��λؼ���ä��ޤ�.
;; (require 'summary-color)
;;
;; [4] Example 
;; (setq summary-color-mailer 'mew)		  ; Mew��ȤäƤ��ޤ�.
;; (setq summary-color-list 
;;		     '(("GYVE"	"Yellow" "black") ; ʸ��:����,	�ط�: ��
;;		       ("Geena" "Red")		  ; ʸ��:��,  �ط�: �Ѥ��ʤ�.
;;		       ("Renny" "Gray")))	  ; ʸ��:����,	�ط�: �Ѥ��ʤ�.
;; (require 'summary-color)
;;
;; [5] Warning
;; ���� ��������(taka@airlab.cs.ritsumei.ac.jp)��mew-dired��ȤäƤ������ϡ�
;; ���Υե����뤬mew-dired������load/require�����褦�ˤ��Ʋ�������

;;; Known bugs, todo and excuses:
;; summary-color-list��emacs/mule����������ѹ�(setq)���Ƥ⿧�դ�����
;; ���ޤ���. �ѹ���, M-x summary-color-build-faces-interactive 
;; ���Ʋ�����. �ޤ�require�Τ�����autoload��Ȥ��褦�ˤ������Ǥ���, 
;; ���Υ������Υץ����Τ���ˤ����ޤǤ��ʤ��Ƥ⤤���Ǥ��礦. 
;;
;; ɮ�Ԥ�Mew��ȤäƤ���Τ�MH�ǤϤ��ޤ�ƥ��Ȥ��Ƥޤ���. 
;; �⤷���꤬���äƤ���, ���ʤ���elisp���狼��ʤ�, ���Υץ�����
;; ��Ⱦ�ˤ���hook�ΤȤ���򸫤Ʋ�����. Ŭ����hook��mh-*.el�Υ�����
;; ����õ����, summary-coloring��ƤӤޤ�.  hook���ʤ����, defadvice��
;; �Ȥ�ɬ�פ�����Ǥ��礦. Ʊ�ͤˤ����, ¾�Υᥤ�顼�ˤ�Ŭ�ѤǤ��뤫��
;; ����ޤ���. 

;;
;; X-�켡������:
;;				     Sun Jun 22 16:37:32 1997 --- jet
;;
;; �����ȯɽ������, �����郎�ޤ�ʹ���Ƥ����������꤬�Ȥ��������ޤ���. 
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
;;  o ���ۤ��򤷤��Τǥ᡼�륢�ɥ쥹��񤭴����롣
;; summary-color.el for Color-Mate Ver.1.0.1
;;  o History �Υץ�����󶡼Ԥ�̾�����ְ�äƤ���Τ�������
;; summary-color.el for Color-Mate Ver.1.0
;;  o Masatake (jet) YAMATO <masata-y@is.aist-nara.ac.jp>�� ��� color-mate ��
;;    �ˤȥץ������󶡤�����롣
;;  o �Ѹ���������ɲ�
;; Sun Jul 27 04:09:52 1997 Masatake YAMATO <masata-y@is.aist-nara.ac.jp>
;;	* �Ȥꤢ����MH-E�Ǥ�ư���褦�ˤ���. 
;;	* �Ȥꤢ����mandara-misc�����

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
  "*mailer�λ���. ����ܥ� mew �� ����ܥ� mh-e����ꤹ��. ")

;; Set colors
(defvar summary-color-list nil
  "*�����Ǥ�\(����ɽ��	foreground-color background-color\)�Ȥ����ꥹ��
Mew��summary�Хåե��˿����դ���Τ˻Ȥ�. ")
;;
(defvar summary-default-background-color (cdr (assoc 'background-color
						     (frame-parameters
						      (selected-frame))))
  "*summary-color-list��background-color����ά���줿���Ǥ��Ф���Ŭ�Ѥ���뿧
�⤷nil�Ǥ����, mew�Υ��ޥ�Хåե��Υե졼����طʿ��򤽤Τޤ޻Ȥ�. ")

;; Select folders to be colored.
(defvar summary-folders-to-be-colored t
  "*�����դ���folder�λ���. 
o t�Ǥ����+inbox�ǤΤ߿����դ���. 
o ʸ��������ǤȤ���ꥹ�ȤǤ����, ���Υ��С���̾�����б�����ե�����˿���
  �դ���. . ��:
(setq summary-folders-to-be-colored '(\"+inbox\" \"+Backup\" \"+drafts/\"))

o nil�Ǥ���Ф��٤ƤΥХåե��˿����դ���. ")

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
"Mew �� ���ޥ�Хåե����뤤��mh-e��folders�Хåե��ˤ��դ����뤿��δؿ���"
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
      ;; ����?
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
		 (function summary-coloring)) ;???ɬ�פʤ󤫤ʤ�...
       )
      ( ;; MH-E
       (eq summary-color-mailer 'mh-e)
       ;; Ŭ����hook���ʤ�! (after scanning)
       (defadvice mh-scan-folder (after add-summary-color:mh-folder first activate)
	 (summary-coloring))
       ;;
       (add-hook 'mh-inc-folder-hook
		 (function summary-coloring))
       ;; ɬ��?
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
