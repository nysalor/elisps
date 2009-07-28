;;; color-mate-face.el -- Coloring mule/emacs to more easier and more fun.

;; Copyright (C) YOKOTA Hiroshi

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.6
;; Keywords: color hilit19 font-lock color-mate paren
;; Content-Type: text/plain; charset=x-euc-jp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.6
;;         by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs で、色を使用して見やすい画面にします。
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:
;; (1) This Library require hilit19.el and font-lock.el.
;; (2) Write these lines to your ~/.emacs
;;        (if (and (>= (string-to-int emacs-version) 19)
;;	           window-system )
;;            (progn
;;               (require 'color-mate-face)
;;               (color-mate-face)
;;               ))
;;     or Add "color-mate.emacs.add"'s contents to your ~/.emacs
;;
;;  If you use mule, and you want to more, see skk-cursor.el, egg-cursor.el,
;; canna-cursor.el and sj3-cursor.el

;$Id: color-mate-face.el,v 1.3 2003/09/19 14:48:24 elca Exp $

;; -*-mode: emacs-lisp-*-

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          文字への着色
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; hilit19 と font-lock を使って文字に着色する。
;; Canna を使っているなら、 Canna の着色機能も有効にする。
;;

;; hilit19, font-lock 用の追加設定。 (mule FAQ より)

; Color-Mate は hilit19 と font-lock を同時に使用しているので、
; それらの間での調整のために文字のカラーを勝手に書き換えています。
; もしあなたが既に hilit19 や font-lock を使っているなら、設定が変わって
; しまう恐れがあります。その時は .emacs に記述された
;
;   (require 'color-mate-face)
;   (color-mate:face)
;
; を削除してこの機能を使わないようにして下さい。


;----------------------------------------------------------------------;
;                         Color-Mate の変数
;----------------------------------------------------------------------;
(defvar color-mate:theme '() "Color-Mate color settings")
(defvar color-mate:theme-file "SunnyDay"
  "Color-Mate definition file name")

(require 'assoc)
(require 'color-mate-util)

(defvar color-mate:face:before-hooks nil)
(defvar color-mate:face:after-hooks nil)
(defun color-mate:face ()
  "Color-Mate's face utility routine. This routine use with Color-Mate."
  (interactive)
  (progn
    (message "Loading Color-Mate face utility...")

    (if (not color-mate:theme)
	(load color-mate:theme-file))

    ;; hooks
    (let ((hook (aget color-mate:theme 'face-type)))
      (cond ((eq hook 'light)  ; 明るいもの
	     (progn
	       (add-hook 'color-mate:face:before-hooks
			 '(lambda () (color-mate:face:hook:before-light)))
	       (add-hook 'color-mate:face:after-hooks
			 '(lambda () (color-mate:face:hook:after-light)))))
	    ((eq hook 'dark)       ; 暗いもの
	     (progn
	       (add-hook 'color-mate:face:before-hooks
			 '(lambda () (color-mate:face:hook:before-dark)))
	       (add-hook 'color-mate:face:after-hooks
			 '(lambda () (color-mate:face:hook:after-dark)))))
	    ((or (eq hook 'none)
		 (eq hook nil))    ; 設定の無い時
	     nil)
	    (t
	     (error "color-mate:face: face-type must be light, dark or none"))
	    ))

    ; xxx: ???
    (if (and (featurep 'xemacs)
	     (eq (aget color-mate:theme 'face-type) 'dark))
	(color-mate:face:xemacs-dark-face))

    (run-hooks 'color-mate:face:before-hooks)

    ;; xemacs では hilit19.el は使えないようだ。
    ;(if (not (featurep 'xemacs))
	;(color-mate:face:hilight19))
    (color-mate:face:font-lock)

    (color-mate:face:paren)
    ;(color-mate:face:region)
    (color-mate:face:kanakan)

    (run-hooks 'color-mate:face:after-hooks)

    ;; 起動完了メッセージ
    (message "Loading Color-Mate face utility...done")
    ))

;---------------------------------------------------------------------------;

;;----------------;
;; hilit19 の設定
;;----------------;
;;
;; hilit19 の追加着色
;;
;; hilit-translate は関数ではなくマクロであるのでバイトコンパイル時に
;; emacs/mule にマクロである事を認識させる必要がある。
;; 詳しくは color-mate-compile.el を参照。
;;
(defun color-mate:face:hilight19 ()
  "Set up \"hilit19.el\""
  (progn
    (require 'hilit19)
    ))

;---------------------------------------------------------------------------;

;;------------------;
;; font-lock の設定
;;------------------;
(defun color-mate:face:font-lock ()
  "Set up \"font-lock.el\""
  (progn
    (require 'font-lock)

    ;; 古い emacs/mule に付属している font-lock.el には font-lock-mode の
    ;; 自動呼びだしルーチンがないので追加する。
    (if (string< emacs-version "19.29")
	(defun turn-on-font-lock ()
	  "Hook routine for font-lock. (By color-mate-face.el)"
	  (font-lock-mode 1)))

    ;; font-lock.el による文字の着色を自動化
    (if (fboundp 'global-font-lock-mode)
	(global-font-lock-mode t)
      (add-hook 'find-file-hooks 'turn-on-font-lock))
     ))

;; hilit19 の設定と同じになるようにする
(defun color-mate:face:font-lock:mule-face ()
  (progn
    ;; Ｃ言語における define や変数名など
    (make-face           'keyword-face)
    (set-face-foreground 'keyword-face "purple")
    (set-face-bold-p     'keyword-face t)

    ;; コメント
    (make-face           'comment-face)
    (set-face-foreground 'comment-face "firebrick")

    ;; 文字列
    (make-face            'string-face)
    (set-face-foreground  'string-face "grey40")
    (set-face-underline-p 'string-face t)

    ;; 関数名
    (make-face           'function-face)
    (set-face-foreground 'function-face "blue")
    (set-face-bold-p     'function-face t)

    ;; 変数型
    (make-face           'c-type-face)
    (set-face-foreground 'c-type-face "RoyalBlue")

    (add-hook 'font-lock-mode-hook
	      '(lambda ()
		 (setq font-lock-keyword-face 'keyword-face)
		 (setq font-lock-comment-face 'comment-face)
		 (setq font-lock-string-face 'string-face)
		 (setq font-lock-function-name-face 'function-face)
		 (setq font-lock-type-face 'c-type-face)
		 ))))

(defun color-mate:face:font-lock:emacs-face ()
  (progn
    ;; フォント作成
    ;; C言語における define や変数名など
    (make-face            'keyword-face)
    (set-face-foreground  'keyword-face "purple")
    (make-face-bold       'keyword-face)

    ;; コメント
    (make-face            'comment-face)
    (set-face-foreground  'comment-face "firebrick")

    ;; 文字列
    (make-face            'string-face)
    (set-face-foreground  'string-face "grey40")
    (set-face-underline-p 'string-face t)

    ;; 関数名
    (make-face            'function-face)
    (set-face-foreground  'function-face "blue")
    (make-face-bold       'function-face)

    ;; 変数型
    (make-face            'c-type-face)
    (set-face-foreground  'c-type-face "RoyalBlue")

    ;; 設定
    (add-hook 'font-lock-mode-hook
	      '(lambda ()
		 (setq font-lock-keyword-face       'keyword-face)
		 (setq font-lock-comment-face       'comment-face)
		 (setq font-lock-string-face        'string-face)
		 (setq font-lock-function-name-face 'function-face)
		 (setq font-lock-type-face          'c-type-face)
		 ))))

(defun color-mate:face:font-lock:xemacs-face ()
  (progn
    ;; override bug
    (if (eq (aget color-mate:theme 'face-type) 'dark)
	(progn
	  (make-face            'font-lock-comment-face)
	  (set-face-foreground  'font-lock-comment-face "gray80")

	  (make-face            'font-lock-string-face)
	  (set-face-foreground  'font-lock-string-face "light coral")

	  (make-face            'font-lock-keyword-face)
	  (set-face-foreground  'font-lock-keyword-face "cyan")

	  (make-face            'font-lock-function-name-face)
	  (set-face-foreground  'font-lock-function-name-face "aquamarine")

	  (make-face            'font-lock-variable-name-face)
	  (set-face-foreground  'font-lock-variable-name-face "cyan3")

	  (make-face            'font-lock-type-face)
	  (set-face-foreground  'font-lock-type-face "wheat")

	  (make-face            'font-lock-reference-face)
	  (set-face-foreground  'font-lock-reference-face "cadetblue2")

	  (make-face            'font-lock-preprocessor-face)
	  (set-face-foreground  'font-lock-preprocessor-face "steelblue1")

	))))

;; override xemacs lisp bug
(defun color-mate:face:xemacs-dark-face ()
  (progn
    (set-face-foreground  'highlight           "black")
    (set-face-foreground  'isearch             "black")
    (set-face-background  'isearch             "CadetBlue")
    (set-face-foreground  'secondary-selection "black")
    (set-face-background  'secondary-selection "CadetBlue")

    (make-face            'paren-match)
    (set-face-foreground  'paren-match "black")
    ))

;-------------------------------------------------------------------------;

;;--------------;;
;; paren の設定
;;--------------;;
(defun color-mate:face:paren ()
  "Set up \"paren.el\""
  (progn
    (require 'paren)
    (if (featurep 'xemacs)
	(paren-set-mode 'sexp))  ; xemacs
    (if (and (>= (color-mate:emacs-version) 20) ; emacs 20
	     (not (featurep 'xemacs)))
	(custom-set-variables
	 '(show-paren-style 'mixed)
	 '(show-paren-mode t nil (paren))))
    ))

;---------------------------------------------------------------------------;

;;------------------------;
;; リージョンを可視化する
;;------------------------;
(defun color-mate:face:region ()
  "Visualize region"
  (progn
    (setq transient-mark-mode t)))

;---------------------------------------------------------------------------;

;;------------------------;
;; 仮名漢字変換領域の着色
;;------------------------;
(defun color-mate:face:kanakan ()
  "Set up Kana-Kanji conversion region"
  (progn
    ;; face を用意
    (color-mate:face:kanakan:make-face)

    ;; canna
    ;; canna の着色機能を有効にする。
    ;; Canna 版 mule では canna.el が既ににロードされているので
    ;; (featurep 'canna) では (canna) を実行したか分からない。
    ;; そこでこれで正しいかどうかは分からないが、 canna-empty-info
    ;; という変数が一度 Canna を起動すると t になる事を利用して
    ;; ユーザーが Canna を使っているか(既に起動しているか)を判定する。
    ;;
    ;; mule
    (if (and (boundp 'MULE)
	     (featurep 'canna)
	     (boundp 'CANNA)
	     (boundp 'canna-empty-info)
	     canna-empty-info)
	(progn
	  (setq canna-use-color t)
	  (cond
	   ((boundp 'egg-version)
	    (require 'can-n-egg)
	    (can-n-egg))
	   (t
	    (require 'canna)
	    (canna))
	   )))

    ;; emacs20 / xemacs20 (leim)
    (if (>= (color-mate:emacs-version) 20)
	(progn
	  (setq canna-use-color t)
	  (setq input-method-highlight-flag t)
	  ;(setq input-method-verbose-flag t)

	  (color-mate:face:kanakan:wnn)
	  (color-mate:face:kanakan:anthy)

	  (if (not (featurep 'xemacs))
	      (color-mate:face:kanakan:skk-emacs20))
	  ))

    ;; skk
    (if (or (fboundp 'skk-mode)
	    (featurep 'xemacs))
	(color-mate:face:kanakan:skk))

    ;; Wnn
    (if (boundp 'WNN)
	(color-mate:face:kanakan:wnn))

    ;; Sj3
    (if (boundp 'SJ3)
	  (color-mate:face:kanakan:sj3))
    ))

(defun color-mate:face:kanakan:make-face ()
  (progn
    ;; 変換領域
    (make-face           'color-mate:firebrick1)
    (set-face-foreground 'color-mate:firebrick1 "firebrick1")
    ;; 注目する単語
    (make-face           'color-mate:RoyalBlue2-lavender)
    (set-face-foreground 'color-mate:RoyalBlue2-lavender "RoyalBlue2")
    (set-face-background 'color-mate:RoyalBlue2-lavender "lavender")))


;; skk の着色機能 (mule/xemacs)
;; 変換時の文字の色 canna と同じにする
(defun color-mate:face:kanakan:skk ()
  (progn
    (setq skk-use-face t)
    (setq skk-henkan-face 'color-mate:RoyalBlue2-lavender)))

;; skk 9.6 の場合はこちらの方が良い。
;    (if (fboundp 'skk-mode)
;	(progn
;	  (require 'skk-e19)
;	  (skk-make-face 'RoyalBlue2/lavender)
;	  (setq skk-henkan-face 'RoyalBlue2/lavender)))

;; emacs 20 の skk モード
(defun color-mate:face:kanakan:skk-emacs20 ()
  (progn
    (setq kkc-overlay-head (make-overlay 0 0 nil nil t))
    (overlay-put kkc-overlay-head 'face 'color-mate:RoyalBlue2-lavender)
    (delete-overlay kkc-overlay-head)
    (setq quail-conv-overlay (make-overlay 0 0 nil nil t))
    (overlay-put quail-conv-overlay  'face 'color-mate:firebrick1)
    (delete-overlay quail-conv-overlay)))


;; wnn の着色機能
;; canna の着色と同じようにする
(defun color-mate:face:kanakan:wnn ()
  (progn
    ;; EGG Ver3
    (setq egg:*fence-face*         'color-mate:firebrick1)
    (setq egg:*henkan-face*        'color-mate:firebrick1)
    (setq egg:*fence-face-in-cont* 'color-mate:RoyalBlue2-lavender)
    (setq egg:*dai-bunsetu-face*   'color-mate:RoyalBlue2-lavender)
    (setq egg:*sho-bunsetu-face*   'color-mate:RoyalBlue2-lavender)

    ;; EGG Ver4
    (setq its-fence-face           'color-mate:firebrick1)
    (setq egg-conversion-face      'color-mate:RoyalBlue2-lavender)
    ))

;; sj3 の着色機能
;; canna の着色と同じようにする
;; うまく色がつかない
(defun color-mate:face:kanakan:sj3 ()
  (progn
    (setq egg:*fence-face*         'color-mate:firebrick1)
    (setq egg:*henkan-face*        'color-mate:firebrick1)
    (setq egg:*fence-face-in-cont* 'color-mate:RoyalBlue2-lavender)))

;; anthy の着色機能
;; canna の着色と同じようにする
(defun color-mate:face:kanakan:anthy ()
  (progn
    (setq anthy-fence-face  'color-mate:firebrick1)
    (setq anthy-henkan-face 'color-mate:RoyalBlue2-lavender)))

;-----------------------------------------------------------------------;

(defun color-mate:face:hook:before-light ()
  (progn
    ;; hilit19
    ;(setq hilit-background-mode 'light)
    ;; font-lock
    ;(setq font-lock-display-type 'color)
    ;(setq font-lock-background-mode 'dark)
    ))

(defun color-mate:face:hook:after-light ()
  (progn
    ;; hilit19
    (if (and (not (featurep 'xemacs))
	     (featurep 'hilit19))
        (hilit-translate type 'RoyalBlue))
    ;; font-lock
    (if (not (featurep 'xemacs))
	(if (boundp 'MULE)
	    (color-mate:face:font-lock:mule-face)
	  (color-mate:face:font-lock:emacs-face)))
    ))

(defun color-mate:face:hook:before-dark ()
  (progn
    ;; hilit19
    (setq hilit-background-mode 'dark)
    ;; font-lock
    (setq font-lock-background-mode 'dark) ; emacs
    (setq frame-background-mode     'dark) ; xemacs
    ))

(defun color-mate:face:hook:after-dark ()
    (progn
      (if (featurep 'xemacs)
	  (color-mate:face:font-lock:xemacs-face))
      ))

(provide 'color-mate-face)

;;; color-mate-face.el ends here
