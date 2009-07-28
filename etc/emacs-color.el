;;; Dot.emacs.default -- Coloring mule/emacs to more easier and more fun. -*-emacs-lisp-*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.1
;;         by ���� ͵�� (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs �ǡ�������Ѥ��Ƹ��䤹�����̤ˤ��ޤ�
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.1
;; Keywords: color hilit19 font-lock color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;$Id: .emacs-color.el,v 1.2 2000/10/01 16:33:54 jun Exp $

;----------------------------------;
; ����ե�������ɤ߹��ߥѥ�������
;----------------------------------;
; Add "~/elisp/color-mate" to your load path.
;
; Color-Mate �Υե����뤬 ~/elisp/color-mate �ʳ��ξ���ͭ����Ϥ�����
; �ѹ����Ʋ�������
(setq load-path
      (cons
       (expand-file-name
	"~/elisp/color-mate") load-path))


(if (string-match "XEmacs" emacs-version)
  (setq color-mate:base-path "/usr/lib/xemacs/site-packages/lisp/color-mate")
  (setq color-mate:base-path "/usr/share/emacs/site-lisp/color-mate")
)
(setq load-path
      (append
       (list color-mate:base-path
	     (concat color-mate:base-path "/theme")
	     (concat color-mate:base-path "/contrib")
	     (concat color-mate:base-path "/kanakan-cursor"))
       load-path))

;-------------------------------------------------------;
; �ե���Ȥ��礭�������� 10,12,14,16,18,20,24 �������٤ޤ�
;-------------------------------------------------------;
;(setq default-fontset "fontset-14")

;-------------------------------------------------------;
; �ơ������� ����������Υơ��ޥե����������Ǥ�������
;-------------------------------------------------------;
;; theme file name (default "SunnyDay")
(setq color-mate:theme-file "~/elisp/etc/mytheme.el")

;-----------------;
; Color-Mate ��ư
;-----------------;
; start Color-Mate
(if (and (>= (string-to-int emacs-version) 19)
	 window-system )
    (progn
      (require 'color-mate)
      (color-mate)
      (require 'color-mate-face)
      (color-mate:face)
      ))

;;; color-mate.emacs.add ends here
