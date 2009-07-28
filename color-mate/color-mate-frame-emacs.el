;;; color-mate-frame-emacs.el -- Coloring routine for emacs/mule.

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.4
;; Keywords: color hilit19 font-lock color-mate theme
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.4
;;         by ���� ͵�� (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs �ǡ�������Ѥ��Ƹ��䤹�����̤ˤ��ޤ���
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;$Id: color-mate-frame-emacs.el,v 1.2 2002/05/11 02:32:02 elca Exp $

;;; Code:

;; Color-Mate �忧�롼���� emacs/mule ��

(require 'assoc)
(require 'color-mate-util)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               �ե졼�������δ����ͤ�������롣
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; �ե졼��δ����ͤ�������롣â�����⡼�ɥ饤��ȥ꡼����������
; �����ϻ��;��������ͤ����Ǥʤ����ߤΥե졼��ο��ˤ�ȿ�Ǥ���롣
;
(defun color-mate:emacs-set-default-frame (alist)
  "Set default settings to coloring mule/emacs."

  (progn
    ;; �⡼�ɥ饤��������ϰϤο�������
    ;; color-mate-set-current-frame ��Ʊ��
    ;; ����������ϴ����ͤ����Ǥʤ����ߤΥե졼��ο��ˤ�ȿ�Ǥ����
    ;;
    ;; modeline
    (color-mate:_set-underline alist 'modeline-underlined 'modeline)
    (color-mate:_set-face-if-string alist 'modeline-background-color 'modeline-foreground-color 'modeline)

    ;; region
    (color-mate:_set-underline alist 'region-underlined 'region)
    (color-mate:_set-face-if-string alist 'region-background-color 'region-foreground-color 'region)

    ;; ������ɥ��ε����ͤ�Ϣ�ۥꥹ�Ȥˤ�����Ͽ
    ;; ������������ɲä����褦�ˤ���
    (color-mate:_set-alist-if-string alist 'default-frame-alist 'frame-background-color 'background-color)
    (color-mate:_set-alist-if-string alist 'default-frame-alist 'frame-foreground-color 'foreground-color)
    (color-mate:_set-alist-if-string alist 'default-frame-alist 'cursor-background-color 'cursor-color)
    (color-mate:_set-alist-if-string alist 'default-frame-alist 'mouse-foreground-color  'mouse-color)

    (color-mate:_set-alist-if-integer alist 'default-frame-alist 'menu-bar-lines 'menu-bar-lines)
    (color-mate:_set-alist-if-integer alist 'default-frame-alist 'frame-height   'height)
    (color-mate:_set-alist-if-integer alist 'default-frame-alist 'frame-width    'width)

    (color-mate:_set-alist-if-string alist 'default-frame-alist 'line-space 'line-space)

    (color-mate:_set-alist-if-string alist 'default-frame-alist 'font
				     (if (and (boundp 'MULE)
					      (eq window-system 'win32)) ; Mule for win32
					 'fontset
				       'font))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 ���ߤΥե졼��ο����ѹ����롣
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ���ߤΥե졼��Ρ����������ѹ����롣���δؿ��ˤ�äƿ����Ѥ��Τ�
; ���ߤΥե졼������Ǥ��ꡢcolor-mate-set-default-frame �ˤ�ä�
; ������줿�����ͤ�Ϣ�ۥꥹ�Ȥˤ�������ˤϱƶ����ʤ���
;
(defun color-mate:emacs-set-current-frame (alist)
  "Coloring current frame."

  (progn
    ;; face
    (color-mate:_set-face-if-string alist 'modeline-background-color 'modeline-foreground-color 'modeline)    
    (color-mate:_set-face-if-string alist 'region-background-color 'region-foreground-color 'region)
    ;; bg
    (if (stringp (aget alist 'frame-background-color))
	(set-background-color (aget alist 'frame-background-color)))
    ;; fg
    (if (stringp (aget alist 'frame-foreground-color))
	(set-foreground-color (aget alist 'frame-foreground-color)))
    ;; cursor
    (if (stringp (aget alist 'cursor-background-color))
	(set-cursor-color (aget alist 'cursor-background-color)))
    ;; mouse
    (if (stringp (aget alist 'mouse-foreground-color))
	(set-mouse-color (aget alist 'mouse-foreground-color)))
    ))

(provide 'color-mate-frame-emacs)

;;; color-mate-frame-emacs.el ends here
