;; color-mate����

;; color-mate�˥��ɥѥ����̤�
(setq load-path
      (cons
       (expand-file-name
	"~/elisp/color-mate") load-path))

;; XEmacs�ʤ�ƻȤäƤ�ͤ���Τ��ʡ�
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

;; �ե���ȥ�����
;; ����Ū��̵��
;(setq default-fontset "fontset-14")

;; �ơ���
;; ����Υơ��ޤ��ɤ߹��ޤ��Ƥ���
;theme file name (default "SunnyDay")
(setq color-mate:theme-file "~/elisp/etc/mytheme.el")

;; start Color-Mate
(if (and (>= (string-to-int emacs-version) 19)
	 window-system )
    (progn
      (require 'color-mate)
      (color-mate)
      (require 'color-mate-face)
      (color-mate:face)
      ))
