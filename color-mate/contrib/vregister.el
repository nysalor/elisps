;; visual-register.el --- Register coloring

;; Copyright (C) 1997, 1998 Masatake YAMATO

;; Author: Masatake YAMATO (masata-y@is.aist-nara.ac.jp)
;; Created: Sat Mar  1 15:18:41 1997
;; Version: 1.0
;; Maintainer: Masatake (jet) YAMATO <masata-y@is.aist-nara.ac.jp>
;;	       Hiroshi YOKOTA <yokota@netlab.is.tsukuba.ac.jp>
;; Content-Type: text/plain; charset=x-euc-jp
;; Keywords: register, color
 
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.	If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;;; Usage
;; [English]
;;
;; This code is useful when reading some source codes.
;;
;; <<From "register.el">>
;; This package of functions emulates and somewhat extends the venerable
;; TECO's `register' feature, which permits you to save various useful
;; pieces of buffer state to named variables.  The entry points are
;; documented in the Emacs user's manual.
;;
;; "vregister.el" offer 'register' feature with colored marker.
;; This colored marker is very useful when browsing some source codes.
;;
;; Global key map (<x> = [0-9a-z])
;;  C-x / <x>	    Save buffer state to register <x>.
;;  C-x j <x>	    Restore register <x> to buffer.
;;  C-x ?	    Go to vreg-list-mode and list registers value.
;;  M-x vreg-list-color-table	   Same as "C-x ?".
;;  C-x | <x>	    Remove register <x>.
;;
;; "vreg-list-mode" key map
;;  <Space>	    Restore register
;;  q		    Quit "vreg-list-mode"
;;
;;
;;
;; [Japanese]
;;
;; このプログラムは(たぶん)ソースコードを読むのに威力を発揮します.
;;
;; Muleに附属するregister.elをまず説明します. 
;; register.elは各文字[a-z0-9]をレジスタ(ものを記憶させる場所として扱う
;; プログラムです. 特に場所を記憶させておくことができるのが便利です.
;;
;; C-x / <x>   現在のポイントの位置を記憶させることがきます
;;	       (<x>は任意の1キャラクタ)
;; C-x j <x>   <x>に記憶させたところに戻ることができます.
;;	       (skk使用時には C-xJ)
;; C-x | <x>   レジスタの内容を消去します。
;;
;; たとえばfoo.cを読んでいた後で戻りたくなるような重要な関数を見つけたら
;;     "C-x / a"
;; と打ちaのレジスタに場所を記憶させます.
;; そして他のプログラムを読んでいる途中で, その関数を参照したくなったら
;;     "C-x j a"
;; とすると, そこに戻れます.
;;
;; しかしこの方法では, どのレジスタにどの場所を入れたか忘れてしま
;; うことが良くあります.
;; このプログラムではその場所にカラーの目印を打つことがきます. 
;; また
;;     "C-x ?" または "M-x vreg-list-color-table"
;; でレジスタとカラー対応の一覧が見れます. そして対応表の上でスペースキーを
;; 押すとそのレジスタが示している場所に行きます。"q" を押せば対応表を
;; 閉じます。
;;
;; vreg-color-tableの値を変えると色を変更することができます.

;;; History:
;; vregister.el for Color-Mate Ver.1.0.3
;;  o 引越しをしたのでメールアドレスを書き換える。
;; vregister.el for Color-Mate Ver.1.0.2
;;  o History のプログラム提供者の名前が間違っているのを正す。
;; vregister.el for Color-Mate Ver.1.0.1
;;  o 説明文を少し変更。
;; vregister.el for Color-Mate Ver.1.0
;;  o Masatake (jet) YAMATO <masata-y@is.aist-nara.ac.jp>氏 より color-mate 用
;;    にとプログラムの提供を受ける。
;;  o assoc.el の呼び出しを追加。
;;  o コンパイル時に Warning が出ないようにする。
;;  o 英語の説明文も付ける。

;; $Id: vregister.el,v 1.2 2002/05/11 02:32:13 elca Exp $

;;;; Code

(require 'assoc)

(defvar vreg-color-table
  '((?0 . "black")
    (?1 . "red")
    (?2 . "blue")
    (?3 . "yellow")
    (?4 . "green")
    (?5 . "orange")
    (?6 . "cyan")
    (?7 . "ivory")
    (?8 . "magenta")
    (?9 . "khaki")
    (?a . "peru")
    (?b . "tan")
    (?c . "dark grey")
    (?d . "dark blue")
    (?e . "dark cyan")
    (?f . "DarkMagenta")
    (?g . "dark red")
    (?h . "LightGreen")
    (?i . "DarkOrange2")
    (?j . "coral1")
    (?k . "tomato1")
    (?l . "OrangeRed1")
    (?m . "DeepPink1")
    (?n . "HotPink4")
    (?o . "aquamarine4")
    (?p . "DarkSeaGreen4")
    (?r . "SeaGreen4")
    (?s . "PaleGreen4")
    (?t . "SpringGreen4")
    (?s . "chartreuse3")
    (?t . "OliveDrab4")
    (?u . "khaki3")
    (?v . "LightGoldenrod4")
    (?w . "LightYellow1")
    (?x . "gold1")
    (?y . "yellow1")
    (?z . "goldenrod4")
    )
  "*")

(defvar vreg-overlay-table nil)
(defvar vreg-face-table nil)

(defun vreg-list-color-table-element (elt all)
  (let* ((key (car elt))
	 (color (cdr elt))
	 (face (cdr (assoc key
			   vreg-face-table)))
	 str
	 beg
	 (val (get-register key))
	 (ref (markerp val)))

    ;; make a face
    (or face (setq face (vreg-make-face key)))

    ;; set the color
    (if (not (string= (face-background face) color))
	(set-face-background face color))

    ;; insert a key
    (if (or ref all) (insert (char-to-string key)))

    (if (or ref all) (insert (if ref " => " " -- ")))

    ;; insert a colored space
    (setq beg (point))
    (if (or ref all) (insert " "))
    (if (or ref all) (put-text-property beg (point) 'face
				   face))

    ;; insert the contents
    (if (or ref all) (insert " "))
    (if ref
	(progn
	  (save-excursion
	    (set-buffer (marker-buffer val))
	    (save-excursion
	      (goto-char (marker-position val))
	      (beginning-of-line)
	    (setq str (buffer-substring
		       (point) (progn (end-of-line) (point))))))
	  (insert (format (concat " [%s] %-" 
				  (int-to-string 
				   (/ (window-width (get-buffer-window (current-buffer)))
				      2))
				  "s")
			  (marker-buffer val) str))
	  ))
    ;;
    (if (or ref all) (insert "\n"))))

(define-key global-map "\C-x?" 'vreg-list-color-table)
(define-key global-map "\C-x!" 'sreg-list-string-table)
(define-key global-map "\C-x|" 'vreg-remove-overlay)
(define-key global-map "\C-x\\" 'view-register)

(defvar vreg-list-buffer-name "*VR COLOR*")
(defun vreg-list-color-table (all)
  ""
  (interactive "P")
  (let ((buf (get-buffer-create vreg-list-buffer-name))
	(clist vreg-color-table))
    (set-buffer buf)
    (toggle-read-only -1) 
    (erase-buffer)
    (while clist
      (vreg-list-color-table-element (car clist) all)
      (setq clist (cdr clist)))
    (pop-to-buffer buf)
    (shrink-window-if-larger-than-buffer (get-buffer-window buf)))
  (vreg-list-mode)
  )


(defvar vreg-list-mode-map ())
(if vreg-list-mode-map ()
  (setq vreg-list-mode-map (make-sparse-keymap))
  (define-key vreg-list-mode-map " " 'vreg-list-select)
  (define-key vreg-list-mode-map "q" 'delete-window))

(defun vreg-list-select ()
  (interactive)
  (let (x)
    (save-excursion 
      (beginning-of-line)
      (setq x (char-after (point))))
    (if (equal x ?\n)
	(error "No character in this line"))
    (delete-window)
    (jump-to-register x)))

(defun vreg-list-mode ()
  (use-local-map vreg-list-mode-map)
  (toggle-read-only 1)
  (goto-char (point-min)))

;;
;; register overlay extension
;;
(defun vreg-remove-overlay (key)
  (interactive "cRemove the register overlay: ")
   (let ((overlay (cdr (assoc key vreg-overlay-table))))

    (if overlay 
	(delete-overlay overlay))))

(defun vreg-put-overlay (key)
  (let* ((overlay (make-overlay (point) (1+ (point))))
	 (color	 (cdr (assoc key vreg-color-table)))
	 (face (cdr (assoc key vreg-face-table))))

    ;; overlay property
    ;; ...

    ;; make a face
    (or face (setq face (vreg-make-face key)))

    ;; set the color
    (if (not (string= (face-background face) color))
	(set-face-background face color))
    
    (overlay-put overlay 'face face)
    (aput 'vreg-overlay-table key overlay)
    ))
    
(defadvice point-to-register (before visual-register activate)
  (if (ad-get-arg 1)
      ()
    (let ((key (ad-get-arg 0)))
      (vreg-remove-overlay key)
      (vreg-put-overlay key)
      )))

(defvar vreg-face-symbol-prefix "vreg-face")
(defun vreg-make-face (key)
  (let ((face (make-face
	       (make-symbol (concat vreg-face-symbol-prefix
				    (char-to-string key)))))
	)
    (aput 'vreg-face-table key face)
    face))

;;;----------------------------------------------------------

(defun select-register (prefix type)
  (interactive "P\nctype(g-> string, j-> jump): ")
  (cond
   ((equal type ?g)
    (sreg-list-string-table)
    )
   ((equal type ?j)
    (vreg-list-color-table prefix))))


(defvar sreg-base-buffer nil)
(defvar sreg-base-point nil)
(defun sreg-list-string-table ()
  (interactive)
  (let* ((oldbuf (current-buffer))
	 (p (point))
	 (buf (get-buffer-create "*Stored Strings*"))
	 (clist register-alist))
    (set-buffer buf)
    (toggle-read-only -1)
    (erase-buffer)
    (while clist
      (if (stringp (cdr (car clist)))
	  (progn 
	    (insert (char-to-string (car (car clist))))
	    (insert " => ")
	    (insert (cdr (car clist)))
	    (insert "\n")))
      (setq clist (cdr clist)))
    (pop-to-buffer buf)
    (shrink-window-if-larger-than-buffer (get-buffer-window buf))
    (setq sreg-base-buffer oldbuf)
    (setq sreg-base-point p)
    (sreg-list-mode)))


(defvar sreg-list-mode-map ())
(if sreg-list-mode-map ()
  (setq sreg-list-mode-map (make-sparse-keymap))
  (define-key sreg-list-mode-map " " 'sreg-insert)
  (define-key sreg-list-mode-map "i" 'sreg-set)
  (define-key sreg-list-mode-map "a" 'sreg-add)
  (define-key sreg-list-mode-map "q" 'delete-window))

(defun sreg-set ()
  (interactive)
  (let (r)
    (beginning-of-line)
    (setq r (char-after (point)))
    (set-register r
		  (read-from-minibuffer (format "Contents for %c: " r))))
  (sreg-list-string-table))
(defun sreg-add (r)
  (interactive "cRegister? ")
  (set-register r
		  (read-from-minibuffer (format "Contents for %c: " r)))
  (delete-window)
  (sreg-list-string-table))
(defun sreg-insert ()
  (interactive)
  (let (r)
    (beginning-of-line)
    (setq r (char-after (point)))
    (save-excursion
      (set-buffer sreg-base-buffer)
      (goto-char sreg-base-point)
      (insert-register r)))
  (delete-window)
  )

(defun sreg-list-mode ()
  (use-local-map sreg-list-mode-map)
  (toggle-read-only 1)
  (goto-char (point-min)))


(provide 'vregister)

;;; register.el ends here
