;;; Dot.emacs.default -- Coloring mule/emacs to more easier and more fun. -*-emacs-lisp-*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.1
;;         by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs で、色を使用して見やすい画面にします
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.1
;; Keywords: color hilit19 font-lock color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;$Id: .emacs-color.el,v 1.2 2000/10/01 16:33:54 jun Exp $

;----------------------------------;
; 設定ファイルの読み込みパスの設定
;----------------------------------;
; Add "~/elisp/color-mate" to your load path.
;
; Color-Mate のファイルが ~/elisp/color-mate 以外の場所に有る時はここを
; 変更して下さい。
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
; フォントの大きさの設定 10,12,14,16,18,20,24 から選べます
;-------------------------------------------------------;
;(setq default-fontset "fontset-14")

;-------------------------------------------------------;
; テーマ設定 お気に入りのテーマファイルを選んでください
;-------------------------------------------------------;
;; theme file name (default "SunnyDay")
(setq color-mate:theme-file "~/elisp/etc/mytheme.el")

;-----------------;
; Color-Mate 起動
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
