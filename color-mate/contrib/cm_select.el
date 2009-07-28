;;; cm_select.el -- Color-Mate Theme selecter elisp part

;; Author: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 1.0
;; Keywords: color color-mate select
;; Content-Type: text/plain; charset=x-euc-jp

;;; Commentary:
;; [english]
;;  "cm_select.el" is Theme loader. 
;;  This file requires shell script "cm_select.sh"
;;
;;  1. First, edit your .emacs
;;      change this line
;;           (setq color-mate:theme-file "SunnyDay")
;;      to
;;           (load "cm_select")
;;
;; 2. Use "cm_select.sh" to exec emacs with theme.
;;    ex)
;;      cm_select.sh Wine
;;      cm_select.sh GreenTea xemacs
;;      cm_select.sh MyTheme emacs [other emacs options...]
;;
;; [japanese]
;;  cm_select �� elisp �ե������ �����륹����ץȤ�Ȥäơ����ޥ�ɥ饤��
;; ����λ���ˤ�ꡢ����ο��������ä� emacs ��Ω���夲�ޤ���
;; ����ˤ�ꡢ�������ε�ʬ�˹�碌�� emacs ��¹ԤǤ��ޤ���
;;
;; �Ȥ���
;; 1. ~/.emace �ˤ��� Color-Mate �������񤭴����ޤ���
;;       (setq color-mate:theme-file "SunnyDay")
;;    ����ʬ��
;;       (load "cm_select")
;;    �ˤ��ޤ���
;; 2. �����륹����ץ� "cm_select.sh" �˥��ץ������դ��Ƶ�ư����
;;    emacs ��ư���Ʋ�������
;;    ��)
;;      cm_select.sh Wine
;;      cm_select.sh GreenTea xemacs
;;      cm_select.sh MyTheme emacs [other emacs options...]

;$Id: cm_select.el,v 1.2 2002/05/11 02:32:13 elca Exp $

(let ((theme (getenv "CM_THEME")))
  (setq color-mate:theme-file
	(if (not theme)
	    "SunnyDay"           ;; default
	  (progn
	    ;; xrdb �������������¾�˰��ƶ���������ʤ��褦�ˤ���
	    (if (eq window-system 'x)
		(progn
		  (shell-command "xrdb -remove")
		  ;(shell-command
		  ; (concat "xrdb -merge " (expand-file-name "~/.Xdefaults")))
		  ;(shell-command
		  ; (concat "xrdb -merge " (expand-file-name "~/.Xresources")))
		  ))
		  theme))))

;;; cm_select.el ends here
