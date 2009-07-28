;;; color-mate-face.el -- Coloring mule/emacs to more easier and more fun.

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.6
;; Keywords: color hilit19 font-lock color-mate paren
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.6
;;         by ���� ͵�� (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs �ǡ�������Ѥ��Ƹ��䤹�����̤ˤ��ޤ���
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;; (1) This Library require hilit19.el and font-lock.el.
;; (2) Write these lines to your ~/.emacs
;;        (if (and (>= (string-to-int emacs-version) 19)
;;	           window-system )
;;            (progn
;;               (require 'color-mate-face)
;;               (color-mate-face)
;;               ))
;;     or Add "color-mate.emacs.add"'s contents to your ~/.emacs
;;
;;  If you use mule, and you want to more, see skk-cursor.el, egg-cursor.el,
;; canna-cursor.el and sj3-cursor.el

;$Id: color-mate-face.el,v 1.3 2003/09/19 14:48:24 elca Exp $

;; -*-mode: emacs-lisp-*-

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          ʸ���ؤ��忧
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; hilit19 �� font-lock ��Ȥä�ʸ�����忧���롣
;; Canna ��ȤäƤ���ʤ顢 Canna ���忧��ǽ��ͭ���ˤ��롣
;;

;; hilit19, font-lock �Ѥ��ɲ����ꡣ (mule FAQ ���)

; Color-Mate �� hilit19 �� font-lock ��Ʊ���˻��Ѥ��Ƥ���Τǡ�
; �����δ֤Ǥ�Ĵ���Τ����ʸ���Υ��顼�򾡼�˽񤭴����Ƥ��ޤ���
; �⤷���ʤ������� hilit19 �� font-lock ��ȤäƤ���ʤ顢���꤬�Ѥ�ä�
; ���ޤ����줬����ޤ������λ��� .emacs �˵��Ҥ��줿
;
;   (require 'color-mate-face)
;   (color-mate:face)
;
; �������Ƥ��ε�ǽ��Ȥ�ʤ��褦�ˤ��Ʋ�������


;----------------------------------------------------------------------;
;                         Color-Mate ���ѿ�
;----------------------------------------------------------------------;
(defvar color-mate:theme '() "Color-Mate color settings")
(defvar color-mate:theme-file "SunnyDay"
  "Color-Mate definition file name")

(require 'assoc)
(require 'color-mate-util)

(defvar color-mate:face:before-hooks nil)
(defvar color-mate:face:after-hooks nil)
(defun color-mate:face ()
  "Color-Mate's face utility routine. This routine use with Color-Mate."
  (interactive)
  (progn
    (message "Loading Color-Mate face utility...")

    (if (not color-mate:theme)
	(load color-mate:theme-file))

    ;; hooks
    (let ((hook (aget color-mate:theme 'face-type)))
      (cond ((eq hook 'light)  ; ���뤤���
	     (progn
	       (add-hook 'color-mate:face:before-hooks
			 '(lambda () (color-mate:face:hook:before-light)))
	       (add-hook 'color-mate:face:after-hooks
			 '(lambda () (color-mate:face:hook:after-light)))))
	    ((eq hook 'dark)       ; �Ť����
	     (progn
	       (add-hook 'color-mate:face:before-hooks
			 '(lambda () (color-mate:face:hook:before-dark)))
	       (add-hook 'color-mate:face:after-hooks
			 '(lambda () (color-mate:face:hook:after-dark)))))
	    ((or (eq hook 'none)
		 (eq hook nil))    ; �����̵����
	     nil)
	    (t
	     (error "color-mate:face: face-type must be light, dark or none"))
	    ))

    ; xxx: ???
    (if (and (featurep 'xemacs)
	     (eq (aget color-mate:theme 'face-type) 'dark))
	(color-mate:face:xemacs-dark-face))

    (run-hooks 'color-mate:face:before-hooks)

    ;; xemacs �Ǥ� hilit19.el �ϻȤ��ʤ��褦����
    ;(if (not (featurep 'xemacs))
	;(color-mate:face:hilight19))
    (color-mate:face:font-lock)

    (color-mate:face:paren)
    ;(color-mate:face:region)
    (color-mate:face:kanakan)

    (run-hooks 'color-mate:face:after-hooks)

    ;; ��ư��λ��å�����
    (message "Loading Color-Mate face utility...done")
    ))

;---------------------------------------------------------------------------;

;;----------------;
;; hilit19 ������
;;----------------;
;;
;; hilit19 ���ɲ��忧
;;
;; hilit-translate �ϴؿ��ǤϤʤ��ޥ���Ǥ���ΤǥХ��ȥ���ѥ������
;; emacs/mule �˥ޥ���Ǥ������ǧ��������ɬ�פ����롣
;; �ܤ����� color-mate-compile.el �򻲾ȡ�
;;
(defun color-mate:face:hilight19 ()
  "Set up \"hilit19.el\""
  (progn
    (require 'hilit19)
    ))

;---------------------------------------------------------------------------;

;;------------------;
;; font-lock ������
;;------------------;
(defun color-mate:face:font-lock ()
  "Set up \"font-lock.el\""
  (progn
    (require 'font-lock)

    ;; �Ť� emacs/mule ����°���Ƥ��� font-lock.el �ˤ� font-lock-mode ��
    ;; ��ư�ƤӤ����롼���󤬤ʤ��Τ��ɲä��롣
    (if (string< emacs-version "19.29")
	(defun turn-on-font-lock ()
	  "Hook routine for font-lock. (By color-mate-face.el)"
	  (font-lock-mode 1)))

    ;; font-lock.el �ˤ��ʸ�����忧��ư��
    (if (fboundp 'global-font-lock-mode)
	(global-font-lock-mode t)
      (add-hook 'find-file-hooks 'turn-on-font-lock))
     ))

;; hilit19 �������Ʊ���ˤʤ�褦�ˤ���
(defun color-mate:face:font-lock:mule-face ()
  (progn
    ;; �ø���ˤ����� define ���ѿ�̾�ʤ�
    (make-face           'keyword-face)
    (set-face-foreground 'keyword-face "purple")
    (set-face-bold-p     'keyword-face t)

    ;; ������
    (make-face           'comment-face)
    (set-face-foreground 'comment-face "firebrick")

    ;; ʸ����
    (make-face            'string-face)
    (set-face-foreground  'string-face "grey40")
    (set-face-underline-p 'string-face t)

    ;; �ؿ�̾
    (make-face           'function-face)
    (set-face-foreground 'function-face "blue")
    (set-face-bold-p     'function-face t)

    ;; �ѿ���
    (make-face           'c-type-face)
    (set-face-foreground 'c-type-face "RoyalBlue")

    (add-hook 'font-lock-mode-hook
	      '(lambda ()
		 (setq font-lock-keyword-face 'keyword-face)
		 (setq font-lock-comment-face 'comment-face)
		 (setq font-lock-string-face 'string-face)
		 (setq font-lock-function-name-face 'function-face)
		 (setq font-lock-type-face 'c-type-face)
		 ))))

(defun color-mate:face:font-lock:emacs-face ()
  (progn
    ;; �ե���Ⱥ���
    ;; C����ˤ����� define ���ѿ�̾�ʤ�
    (make-face            'keyword-face)
    (set-face-foreground  'keyword-face "purple")
    (make-face-bold       'keyword-face)

    ;; ������
    (make-face            'comment-face)
    (set-face-foreground  'comment-face "firebrick")

    ;; ʸ����
    (make-face            'string-face)
    (set-face-foreground  'string-face "grey40")
    (set-face-underline-p 'string-face t)

    ;; �ؿ�̾
    (make-face            'function-face)
    (set-face-foreground  'function-face "blue")
    (make-face-bold       'function-face)

    ;; �ѿ���
    (make-face            'c-type-face)
    (set-face-foreground  'c-type-face "RoyalBlue")

    ;; ����
    (add-hook 'font-lock-mode-hook
	      '(lambda ()
		 (setq font-lock-keyword-face       'keyword-face)
		 (setq font-lock-comment-face       'comment-face)
		 (setq font-lock-string-face        'string-face)
		 (setq font-lock-function-name-face 'function-face)
		 (setq font-lock-type-face          'c-type-face)
		 ))))

(defun color-mate:face:font-lock:xemacs-face ()
  (progn
    ;; override bug
    (if (eq (aget color-mate:theme 'face-type) 'dark)
	(progn
	  (make-face            'font-lock-comment-face)
	  (set-face-foreground  'font-lock-comment-face "gray80")

	  (make-face            'font-lock-string-face)
	  (set-face-foreground  'font-lock-string-face "light coral")

	  (make-face            'font-lock-keyword-face)
	  (set-face-foreground  'font-lock-keyword-face "cyan")

	  (make-face            'font-lock-function-name-face)
	  (set-face-foreground  'font-lock-function-name-face "aquamarine")

	  (make-face            'font-lock-variable-name-face)
	  (set-face-foreground  'font-lock-variable-name-face "cyan3")

	  (make-face            'font-lock-type-face)
	  (set-face-foreground  'font-lock-type-face "wheat")

	  (make-face            'font-lock-reference-face)
	  (set-face-foreground  'font-lock-reference-face "cadetblue2")

	  (make-face            'font-lock-preprocessor-face)
	  (set-face-foreground  'font-lock-preprocessor-face "steelblue1")

	))))

;; override xemacs lisp bug
(defun color-mate:face:xemacs-dark-face ()
  (progn
    (set-face-foreground  'highlight           "black")
    (set-face-foreground  'isearch             "black")
    (set-face-background  'isearch             "CadetBlue")
    (set-face-foreground  'secondary-selection "black")
    (set-face-background  'secondary-selection "CadetBlue")

    (make-face            'paren-match)
    (set-face-foreground  'paren-match "black")
    ))

;-------------------------------------------------------------------------;

;;--------------;;
;; paren ������
;;--------------;;
(defun color-mate:face:paren ()
  "Set up \"paren.el\""
  (progn
    (require 'paren)
    (if (featurep 'xemacs)
	(paren-set-mode 'sexp))  ; xemacs
    (if (and (>= (color-mate:emacs-version) 20) ; emacs 20
	     (not (featurep 'xemacs)))
	(custom-set-variables
	 '(show-paren-style 'mixed)
	 '(show-paren-mode t nil (paren))))
    ))

;---------------------------------------------------------------------------;

;;------------------------;
;; �꡼������Ļ벽����
;;------------------------;
(defun color-mate:face:region ()
  "Visualize region"
  (progn
    (setq transient-mark-mode t)))

;---------------------------------------------------------------------------;

;;------------------------;
;; ��̾�����Ѵ��ΰ���忧
;;------------------------;
(defun color-mate:face:kanakan ()
  "Set up Kana-Kanji conversion region"
  (progn
    ;; face ���Ѱ�
    (color-mate:face:kanakan:make-face)

    ;; canna
    ;; canna ���忧��ǽ��ͭ���ˤ��롣
    ;; Canna �� mule �Ǥ� canna.el �����ˤ˥��ɤ���Ƥ���Τ�
    ;; (featurep 'canna) �Ǥ� (canna) ��¹Ԥ�����ʬ����ʤ���
    ;; �����Ǥ�������������ɤ�����ʬ����ʤ����� canna-empty-info
    ;; �Ȥ����ѿ������� Canna ��ư����� t �ˤʤ�������Ѥ���
    ;; �桼������ Canna ��ȤäƤ��뤫(���˵�ư���Ƥ��뤫)��Ƚ�ꤹ�롣
    ;;
    ;; mule
    (if (and (boundp 'MULE)
	     (featurep 'canna)
	     (boundp 'CANNA)
	     (boundp 'canna-empty-info)
	     canna-empty-info)
	(progn
	  (setq canna-use-color t)
	  (cond
	   ((boundp 'egg-version)
	    (require 'can-n-egg)
	    (can-n-egg))
	   (t
	    (require 'canna)
	    (canna))
	   )))

    ;; emacs20 / xemacs20 (leim)
    (if (>= (color-mate:emacs-version) 20)
	(progn
	  (setq canna-use-color t)
	  (setq input-method-highlight-flag t)
	  ;(setq input-method-verbose-flag t)

	  (color-mate:face:kanakan:wnn)
	  (color-mate:face:kanakan:anthy)

	  (if (not (featurep 'xemacs))
	      (color-mate:face:kanakan:skk-emacs20))
	  ))

    ;; skk
    (if (or (fboundp 'skk-mode)
	    (featurep 'xemacs))
	(color-mate:face:kanakan:skk))

    ;; Wnn
    (if (boundp 'WNN)
	(color-mate:face:kanakan:wnn))

    ;; Sj3
    (if (boundp 'SJ3)
	  (color-mate:face:kanakan:sj3))
    ))

(defun color-mate:face:kanakan:make-face ()
  (progn
    ;; �Ѵ��ΰ�
    (make-face           'color-mate:firebrick1)
    (set-face-foreground 'color-mate:firebrick1 "firebrick1")
    ;; ���ܤ���ñ��
    (make-face           'color-mate:RoyalBlue2-lavender)
    (set-face-foreground 'color-mate:RoyalBlue2-lavender "RoyalBlue2")
    (set-face-background 'color-mate:RoyalBlue2-lavender "lavender")))


;; skk ���忧��ǽ (mule/xemacs)
;; �Ѵ�����ʸ���ο� canna ��Ʊ���ˤ���
(defun color-mate:face:kanakan:skk ()
  (progn
    (setq skk-use-face t)
    (setq skk-henkan-face 'color-mate:RoyalBlue2-lavender)))

;; skk 9.6 �ξ��Ϥ�����������ɤ���
;    (if (fboundp 'skk-mode)
;	(progn
;	  (require 'skk-e19)
;	  (skk-make-face 'RoyalBlue2/lavender)
;	  (setq skk-henkan-face 'RoyalBlue2/lavender)))

;; emacs 20 �� skk �⡼��
(defun color-mate:face:kanakan:skk-emacs20 ()
  (progn
    (setq kkc-overlay-head (make-overlay 0 0 nil nil t))
    (overlay-put kkc-overlay-head 'face 'color-mate:RoyalBlue2-lavender)
    (delete-overlay kkc-overlay-head)
    (setq quail-conv-overlay (make-overlay 0 0 nil nil t))
    (overlay-put quail-conv-overlay  'face 'color-mate:firebrick1)
    (delete-overlay quail-conv-overlay)))


;; wnn ���忧��ǽ
;; canna ���忧��Ʊ���褦�ˤ���
(defun color-mate:face:kanakan:wnn ()
  (progn
    ;; EGG Ver3
    (setq egg:*fence-face*         'color-mate:firebrick1)
    (setq egg:*henkan-face*        'color-mate:firebrick1)
    (setq egg:*fence-face-in-cont* 'color-mate:RoyalBlue2-lavender)
    (setq egg:*dai-bunsetu-face*   'color-mate:RoyalBlue2-lavender)
    (setq egg:*sho-bunsetu-face*   'color-mate:RoyalBlue2-lavender)

    ;; EGG Ver4
    (setq its-fence-face           'color-mate:firebrick1)
    (setq egg-conversion-face      'color-mate:RoyalBlue2-lavender)
    ))

;; sj3 ���忧��ǽ
;; canna ���忧��Ʊ���褦�ˤ���
;; ���ޤ������Ĥ��ʤ�
(defun color-mate:face:kanakan:sj3 ()
  (progn
    (setq egg:*fence-face*         'color-mate:firebrick1)
    (setq egg:*henkan-face*        'color-mate:firebrick1)
    (setq egg:*fence-face-in-cont* 'color-mate:RoyalBlue2-lavender)))

;; anthy ���忧��ǽ
;; canna ���忧��Ʊ���褦�ˤ���
(defun color-mate:face:kanakan:anthy ()
  (progn
    (setq anthy-fence-face  'color-mate:firebrick1)
    (setq anthy-henkan-face 'color-mate:RoyalBlue2-lavender)))

;-----------------------------------------------------------------------;

(defun color-mate:face:hook:before-light ()
  (progn
    ;; hilit19
    ;(setq hilit-background-mode 'light)
    ;; font-lock
    ;(setq font-lock-display-type 'color)
    ;(setq font-lock-background-mode 'dark)
    ))

(defun color-mate:face:hook:after-light ()
  (progn
    ;; hilit19
    (if (and (not (featurep 'xemacs))
	     (featurep 'hilit19))
        (hilit-translate type 'RoyalBlue))
    ;; font-lock
    (if (not (featurep 'xemacs))
	(if (boundp 'MULE)
	    (color-mate:face:font-lock:mule-face)
	  (color-mate:face:font-lock:emacs-face)))
    ))

(defun color-mate:face:hook:before-dark ()
  (progn
    ;; hilit19
    (setq hilit-background-mode 'dark)
    ;; font-lock
    (setq font-lock-background-mode 'dark) ; emacs
    (setq frame-background-mode     'dark) ; xemacs
    ))

(defun color-mate:face:hook:after-dark ()
    (progn
      (if (featurep 'xemacs)
	  (color-mate:face:font-lock:xemacs-face))
      ))

(provide 'color-mate-face)

;;; color-mate-face.el ends here
