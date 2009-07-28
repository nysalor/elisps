;;; color-mate.el -- Coloring mule/emacs to more easier and more fun.

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.6.2
;; Keywords: color hilit19 font-lock color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.6.2
;;         by ���� ͵�� (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs/xemacs to more easier and more fun.
;;   mule / emacs / xemacs �ǡ�������Ѥ��Ƹ��䤹�����̤ˤ��ޤ���
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;; (1) Add one of "theme/*.X"'s contents to your ~/.Xdefaults.
;; (2) Make color-mate-rgb.el. This file make from rgb.txt and rgb2el.pl
;;     (Perl script).
;; (3) Write these lines to your ~/.emacs
;;        (if (and (>= (string-to-int emacs-version) 19)
;;	           window-system )
;;            (progn
;;               (require 'color-mate)
;;               (color-mate)
;;               ))
;;     or Add "color-mate.emacs.add"'s contents to your ~/.emacs.
;;
;;  If you want to more, see color-mate-face.el.
;;

;$Id: color-mate.el,v 1.3 2002/05/12 16:27:51 elca Exp $

;; -*-mode: emacs-lisp-*-

;;; Code:

;;
;; Color-Mate.el
;;

;----------------;
; �С������ɽ��
;----------------;
(defconst color-mate:version-string "Color-Mate Ver.10.6.2 based on mule 2.3(emacs 19.34.1) / emacs 20.7.2/21.2.1 / xemacs 21.4/21.2b35+utf2000 0.17 / Mule for Win32 1.22 / Meadow 1.14 : color-mate.el 2002/Mar/08")

(require 'assoc)
(require 'color-mate-util)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                       �С������ɽ���Ѵؿ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun color-mate:version ()
  "Show Color-Mate version."
  (interactive)
  (message
   (concat
    (substring color-mate:version-string 0 (- (frame-width) 4)) " ...")))

;----------------------------------------------------------------------;
;                         Color-Mate ���ѿ�
;----------------------------------------------------------------------;
(defvar color-mate:theme '() "Color-Mate color settings")
(defvar color-mate:theme-file "SunnyDay"
  "Color-Mate definition file name")
(defvar color-mate:color-history nil
  "Color-Mate color history buffer")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        �ؿ�������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; �ؿ������Ρ�mule/emacs �˿����ɤ롣
;
(defun color-mate ()
  "Coloring mule/emacs."
  (interactive)
  (if window-system
      (progn
	(message "Loading Color-Mate coloring system...")

	(if (not color-mate:theme)
	    (load color-mate:theme-file)) ; ������ե�������ɤ߹���

	(color-mate:setup-fontset)
	(color-mate:set-default-frame)

	(message "Loading Color-Mate coloring system...done"))
    (progn
      (error "color-mate.el requires window system. stop."))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               �ե졼�������δ����ͤ�������롣
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun color-mate:set-default-frame ()
  "Set default settings to coloring."
  (progn
    (if (featurep 'xemacs)
	;; XEmacs �λ�
	(progn
	  (require 'color-mate-frame-xemacs)
	  (color-mate:xemacs-set-default-frame color-mate:theme))
      ;; Emacs/Mule �λ�
      (progn
	(require 'color-mate-frame-emacs)
	(color-mate:emacs-set-default-frame color-mate:theme)))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 ���ߤΥե졼��ο����ѹ����롣
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun color-mate:set-current-frame (alist)
  "Coloring current frame."
  (progn
    (if (featurep 'xemacs)
	;; XEmacs �λ�
	(progn
	  (require 'color-mate-frame-xemacs)
	  (color-mate:xemacs-set-current-frame alist))
      ;; Emacs/Mule �λ�
      (progn
	(require 'color-mate-frame-emacs)
	(color-mate:emacs-set-current-frame alist)))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                    �ե���ȥ��å�����
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun color-mate:setup-fontset ()
  "Setup font set for Mule/Emacs/XEmacs"
  (progn
    (cond
     ;; mule 2.3
     ((and (= (string-to-int emacs-version) 19)
	     (boundp 'MULE)
	     (eq window-system 'x))
      (require 'color-mate-fontset-mule))
     ;; emacs
     ((and (>= (string-to-int emacs-version) 20)
	     (not (featurep 'xemacs))
	     (eq window-system 'x))
      (require 'color-mate-fontset-emacs))
     ;; xemacs & xemacs utf2000
     ((and (>= (string-to-int emacs-version) 20)
	     (featurep 'xemacs)
	     (or (eq window-system 'x)
		 (eq window-system 'gtk)))
      (require 'color-mate-fontset-xemacs))
     ;; Meadow
     ((featurep 'meadow)
      (require 'color-mate-fontset-meadow))
     ;; mule for win32
     ((and (boundp 'MULE)
	   (eq window-system 'win32))
      (require 'color-mate-fontset-mule-win32))
    )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  ���󥿥饯�ƥ�������Ѵؿ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ���󥿥饯�ƥ������ˤ�ä��ͤ�������Ƥ��줾����ѿ�����������
; ����� color-mate-set-current-frame �ؿ��ˤ�äƸ��ߤΥե졼��ο���
; �ѹ����롣
;
(defun color-mate:set-color ( modeline-bg modeline-fg
			      region-bg   region-fg
			      frame-bg    frame-fg
			      cursor
			      mouse )
  "Change current frame color interactively.
Just press return key to use old value."
  
  ; �ͤ�������롣�������ͤ�ǥե�����ͤȤ���ɽ�����롣
  ; TAB, SPACE �ˤ���˥塼���� M-n, M-p �ˤ������λ��Ȥ��ǽ��
  (interactive
   (progn
     (require 'color-mate-rgb)      ; rgb �ơ��֥�θƤӽФ�
     
     (mapcar '(lambda (x)
		(completing-read x color-mate:rgb-table nil nil nil
				 'color-mate:color-history))
	     
	     (list
	      (format "Modeline background color (default %s): "
		      (color-mate:face-background 'modeline 'modeline))
	      (format "Modeline foreground color (default %s): "
		      (color-mate:face-foreground 'modeline 'modeline))
	      (format "Region background color (default %s): "
		      (color-mate:face-background 'region 'zmacs-region))
	      (format "Region foreground color (default %s): "
		      (color-mate:face-foreground 'region 'zmacs-region))
	      (format "Frame background color (default %s): "
		      (color-mate:frame-param-or-face-background
		       'background-color 'default))
	      (format "Frame foreground color (default %s): "
		      (color-mate:frame-param-or-face-foreground
		       'foreground-color 'default))
	      (format "Cursor color (default %s): "
		      (color-mate:frame-param-or-face-background
		       'cursor-color 'text-cursor))
	      (format "Mouse cursor name (default %s): "
		      (color-mate:frame-param-or-face-foreground
		       'mouse-color 'pointer))
	    ))))
  (progn
    (let (tmp-alist)

      ;; �ͤ����ꤵ��Ƥ���Ф����ͤ򡢤���Ƥ��ʤ����������ͤ���Ѥ���
      (if (not (equal modeline-bg ""))
	  (aput 'tmp-alist
		'modeline-background-color modeline-bg))
      (if (not (equal modeline-fg ""))
	  (aput 'tmp-alist
		'modeline-foreground-color modeline-fg))

      (if (not (equal region-bg ""))
	  (aput 'tmp-alist
		'region-background-color region-bg))
      (if (not (equal region-fg ""))
	  (aput 'tmp-alist
		'region-foreground-color region-fg))

      (if (not (equal frame-bg ""))
	  (aput 'tmp-alist
		'frame-background-color frame-bg))
      (if (not (equal frame-fg ""))
	  (aput 'tmp-alist
		'frame-foreground-color frame-fg))

      (if (not (equal cursor ""))
	  (aput 'tmp-alist
		'cursor-background-color cursor))
      (if (not (equal mouse ""))
	  (aput 'tmp-alist
		'mouse-foreground-color mouse))

      ;; �忧����
      (color-mate:set-current-frame tmp-alist)
    )))


(provide 'color-mate) ; feature �Ȥ�����Ͽ

;;; color-mate.el ends here
