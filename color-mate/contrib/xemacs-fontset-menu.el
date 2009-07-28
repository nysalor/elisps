;;; xemacs-fontset-menu.el -- FontSet selecter for xemacs

;; Author: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 1.0
;; Keywords: color-mate fontset select
;; Content-Type: text/plain; charset=x-euc-jp

;;; Commentary:
;; [english]
;; 1. Add "(require 'xemacs-fontset-menu)" to your ~/.emacs
;; 2. Select fontset from "Buffers" -> "FontSet"
;;
;; [japanese]
;; 1. ~/.emacs に "(require 'xemacs-fontset-menu)" を追加します。
;; 2. "Buffers" -> "FontSet" から好きな大きさのフォントセットが選べます。
;;

;; $Id: xemacs-fontset-menu.el,v 1.2 2002/05/11 02:32:13 elca Exp $

(require 'assoc)
(require 'color-mate-fontset-xemacs)

(defun set-fontset-currnet-buffer (key)
  (progn
    (let ((fontset (aget color-mate:xemacs-fontset-alist key)))
      (progn
        (if fontset
            (set-face-font 'default fontset (current-buffer)))))
    ))


;; テーマファイルから初期設定値を抜き出して default を作成
(defvar color-mate:theme '())
(let ((def-font (aget color-mate:theme 'font)))
  (if (not (null def-font))
      (add-menu-button '("Buffers" "FontSet")
		       (vector "default"
			       (list 'set-fontset-currnet-buffer
				     def-font)))))

(if (featurep 'utf-2000)
    (progn
      (add-menu-button '("Buffers" "FontSet")
		       ["12 dot"
			(set-fontset-currnet-buffer "fontset-12-utf2000")])
      (add-menu-button '("Buffers" "FontSet")
		       ["14 dot"
			(set-fontset-currnet-buffer "fontset-14-utf2000")])
      (add-menu-button '("Buffers" "FontSet")
		       ["16 dot"
			(set-fontset-currnet-buffer "fontset-16-utf2000")])
      (add-menu-button '("Buffers" "FontSet")
		       ["24 dot"
			(set-fontset-currnet-buffer "fontset-24-utf2000")])
      )
  (progn
    (add-menu-button '("Buffers" "FontSet")
		     ["12 dot"
		      (set-fontset-currnet-buffer "fontset-12")])
    (add-menu-button '("Buffers" "FontSet")
		     ["14 dot"
		      (set-fontset-currnet-buffer "fontset-14")])
    (add-menu-button '("Buffers" "FontSet")
		     ["16 dot"
		      (set-fontset-currnet-buffer "fontset-16")])
    (add-menu-button '("Buffers" "FontSet")
		     ["24 dot"
		      (set-fontset-currnet-buffer "fontset-24")])
    ))

(add-menu-button '("Buffers") "-----")

(provide 'xemacs-fontset-menu)

;;; end
