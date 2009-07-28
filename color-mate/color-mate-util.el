;;; color-mate-util.el -- Color-Mate utility routines.  -*-emacs-lisp-*-

;; Copyright (C) YOKOTA Hiroshi

;; Author: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.6
;; Keywords: color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.6
;;         by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $Id: color-mate-util.el,v 1.2 2002/05/11 02:32:02 elca Exp $

(require 'assoc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 小物関数
(defun color-mate:emacs-version ()
  "return emacs major version"
  (progn
   (string-to-int emacs-version)))

; xemacs 用の emacs 互換関数
(if (not (fboundp 'set-cursor-color))
;; from skk-foreword.el
(defun set-cursor-color (color-name)
  "Compatibility routine for xemacs."
  (set-frame-property (selected-frame) 'cursor-color
                      (if (color-instance-p color-name)
                          color-name
                        (make-color-instance color-name))))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs/xemacs の差を吸収しつつシステムから現在の色設定を取り出す関数
;;
(defun color-mate:face-background (emacs-face xemacs-face)
  "Get background face color."
  (progn
    (if (featurep 'xemacs)
	(face-background-name xemacs-face)
      (face-background emacs-face))))
(defun color-mate:face-foreground (emacs-face xemacs-face)
  "Get foreground face color."
  (progn
    (if (featurep 'xemacs)
	(face-foreground-name xemacs-face)
      (face-foreground emacs-face))))
(defun color-mate:frame-param-or-face-background (emacs-param xemacs-face)
  "Get background face color from an alist(emacs) or a function(xemacs)"
  (progn
    (if (featurep 'xemacs)
	(face-background-name xemacs-face)
      (aget (frame-parameters (selected-frame)) emacs-param))))
(defun color-mate:frame-param-or-face-foreground (emacs-param xemacs-face)
  "Get foreground face color from an alist(emacs) or a function(xemacs)"
  (progn
    (if (featurep 'xemacs)
	(face-foreground-name xemacs-face)
      (aget (frame-parameters (selected-frame)) emacs-param))))

; xemacs, emacs20, emacs21 の cus-face モジュールの違いを吸収する
(defun color-mate:face-attributes-get (face frame)
  "See custom-face-attributes-get function"
  (cond
   ((or (not (fboundp 'custom-face-attributes-get))         ; xemacs
	(eq (custom-face-attributes-get 'default nil) nil)) ; emacs20
    '() )
   (t                                                       ; emacs21
    (custom-face-attributes-get face frame))
   ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 内部で使用する関数
;--------------------------------------------------------------------
; emacs
;
; from-alist の from-key に対応する値が 文字列ならば to-alist に
; to-key で登録
(defun color-mate:_set-alist-if-string (from-alist to-alist from-key to-key)
  "This is Color-Mate's internal function. Don't use this!"
  (progn
    (let ((val (aget from-alist from-key)))
      (if (stringp val)
	  (aput to-alist to-key val)
	))))


; from-alist の from-key に対応する値が 整数ならば to-alist に
; to-key で登録
(defun color-mate:_set-alist-if-integer (from-alist to-alist from-key to-key)
  "This is Color-Mate's internal function. Don't use this!"
  (progn
    (let ((val (aget from-alist from-key)))
      (if (integerp val)
	  (aput to-alist to-key val)
	))))

;-----------------------------------------------------------------
; xemacs
;
; from-alist の from-key に対応する値が 文字列ならば to-plist に
; to-key で登録
(defun color-mate:_set-plist-if-string (from-alist to-plist from-key to-key)
  "This is Color-Mate's internal function. Don't use this!"
  (progn
    (let ((val (aget from-alist from-key)))
      (if (stringp val)
	  (eval
	   (list
	    'setq to-plist (list 'quote (append (symbol-value to-plist)
				  (list to-key val)))))
	))))

; from-alist の from-key に対応する値が 整数ならば to-plist に
; to-key で登録
(defun color-mate:_set-plist-if-integer (from-alist to-plist from-key to-key)
  "This is Color-Mate's internal function. Don't use this!"
  (progn
    (let ((val (aget from-alist from-key)))
      (if (integerp val)
	  (eval
	   (list
	    'setq to-plist (list 'quote (append (symbol-value to-plist)
						(list to-key val)))))
	))))

;---------------------------------------------------------------

(defun color-mate:_set-underline (alist key face-name)
  "This is Color-Mate's internal function. Don't use it."
  (progn
    (let ((u (aget alist key))
	  l)
      (if u
	  (if (and (featurep 'custom)
		   (featurep 'cus-face))
	      (progn
		(setq l (color-mate:face-attributes-get face-name nil))
		(append l '(:underline t))
		(custom-set-faces
		 (list face-name (list (list t l)))))
	    (set-face-underline-p face-name t))))))

(defun color-mate:_set-face-if-string (alist bg-key fg-key face-name)
  "This is Color-Mate's internal function. Don't use it."
  (progn
    (let ((bg-val (aget alist bg-key))
	  (fg-val (aget alist fg-key))
	  l)
      (if (and (featurep 'custom)
	       (featurep 'cus-face))
	  ;; new method with custom.el
	  (progn
	    (setq l (color-mate:face-attributes-get face-name nil))
	    (if (stringp bg-val)
		(setq l (append l (list ':background bg-val))))
	    (if (stringp fg-val)
		(setq l (append l (list ':foreground fg-val))))
	    (custom-set-faces
	     (list face-name (list (list t l)))))
	;; old method
	(progn
	  (if (stringp bg-val)
	      (set-face-background face-name bg-val))
	  (if (stringp fg-val)
	      (set-face-foreground face-name fg-val)))
	))))

(provide 'color-mate-util)

;;; color-mate-util.el ends here.
