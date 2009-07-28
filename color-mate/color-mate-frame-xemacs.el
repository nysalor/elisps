;;; color-mate-frame-xemacs.el -- Coloring routine for xemacs.

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.3
;; Keywords: color hilit19 font-lock color-mate theme
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.3
;;         by ���� ͵�� (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs �ǡ�������Ѥ��Ƹ��䤹�����̤ˤ��ޤ���
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;$Id: color-mate-frame-xemacs.el,v 1.2 2002/05/11 02:32:02 elca Exp $

;;; Code:

(require 'assoc)
(require 'color-mate-util)

;;----------------------------------------------------------------
;; xemacs �ǤϤ��ʤ����ʬ��face�ǿ��Ť����Ƥ���Τǡ�emacs/mule��
;; ư����ʤ�㤦��

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               �ե졼�������δ����ͤ�������롣
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defun color-mate:xemacs-set-default-frame (alist)
  "Set default settings to coloring xemacs."

  (progn
    ;; �����Ǥ� color-mate-xemacs-set-current-frame ������Ʊ�����򤹤�Τ�
    ;; Ʊ���������ٽ�ɬ�פ⤢��ޤ���
    (color-mate:xemacs-set-current-frame alist)

    (color-mate:_set-plist-if-integer alist 'default-frame-plist 'menu-bar-lines 'menu-bar-lines)
    (color-mate:_set-plist-if-integer alist 'default-frame-plist 'frame-height 'height)
    (color-mate:_set-plist-if-integer alist 'default-frame-plist 'frame-width  'width)
    (color-mate:_set-plist-if-string  alist 'default-frame-plist 'line-space 'line-space)

    ;; �ե���Ȥ�����
    (let ((fontset (aget color-mate:xemacs-fontset-alist (aget alist 'font))))
      (progn
	(if fontset
	    (set-face-font 'default fontset))))

    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 ���ߤΥե졼��ο����ѹ����롣
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun color-mate:xemacs-set-current-frame (alist)
  "Coloring current frame."

  (progn
    ;; XEmacs �Ͽ�������� face ���Ѥ��Ƥ���褦�Ǥ��롣������
    ;; emacs/mule �Ȱ�äƤ��롣

    ;; �ޥ����ݥ��󥿤ȥ������뿧������
    (color-mate:_set-face-if-string
     alist
     'mouse-background-color 'mouse-foreground-color
     'pointer)
    (color-mate:_set-face-if-string
     alist
     'cursor-background-color 'cursor-foreground-color
     'text-cursor)

    ;; region
    (set-face-underline-p 'zmacs-region (aget alist 'region-underlined))
    (color-mate:_set-face-if-string
     alist
     'region-background-color 'region-foreground-color
     'zmacs-region)

    ;; modeline #1
    (set-face-underline-p 'modeline (aget alist 'modeline-underlined))
    (color-mate:_set-face-if-string
     alist
     'modeline-background-color 'modeline-foreground-color
     'modeline)

    ;; modeline #2
    (color-mate:_set-face-if-string
     alist
     'modeline-background-color 'modeline-buffer-id-foreground-color
     'modeline-buffer-id)
    (color-mate:_set-face-if-string
     alist
     'modeline-background-color 'modeline-mousable-foreground-color
     'modeline-mousable)
    (color-mate:_set-face-if-string
     alist
     'modeline-background-color 'modeline-mousable-minor-mode-foreground-color
     'modeline-mousable-minor-mode)

    ;; background/foreground
    (color-mate:_set-face-if-string
     alist
     'frame-background-color 'frame-foreground-color
     'default)
    ))

(provide 'color-mate-frame-xemacs)

;;; color-mate-frame-xemacs.el ends here
