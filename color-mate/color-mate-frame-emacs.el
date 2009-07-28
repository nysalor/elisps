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
;;         by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs で、色を使用して見やすい画面にします。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;$Id: color-mate-frame-emacs.el,v 1.2 2002/05/11 02:32:02 elca Exp $

;;; Code:

;; Color-Mate 着色ルーチン emacs/mule 用

(require 'assoc)
(require 'color-mate-util)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;               フレームの設定の既定値を定義する。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; フレームの既定値を定義する。但し、モードラインとリージョンの設定
; だけは仕様上全既定値だけでなく現在のフレームの色にも反映される。
;
(defun color-mate:emacs-set-default-frame (alist)
  "Set default settings to coloring mule/emacs."

  (progn
    ;; モードラインと選択範囲の色の設定
    ;; color-mate-set-current-frame と同じ
    ;; これらの設定は既定値だけでなく現在のフレームの色にも反映される
    ;;
    ;; modeline
    (color-mate:_set-underline alist 'modeline-underlined 'modeline)
    (color-mate:_set-face-if-string alist 'modeline-background-color 'modeline-foreground-color 'modeline)

    ;; region
    (color-mate:_set-underline alist 'region-underlined 'region)
    (color-mate:_set-face-if-string alist 'region-background-color 'region-foreground-color 'region)

    ;; ウィンドウの規定値を連想リストにして登録
    ;; 以前の設定に追加されるようにする
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
;;                 現在のフレームの色を変更する。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 現在のフレームの、色だけを変更する。この関数によって色が変わるのは
; 現在のフレームだけであり、color-mate-set-default-frame によって
; 定義された既定値の連想リストにある設定には影響しない。
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
