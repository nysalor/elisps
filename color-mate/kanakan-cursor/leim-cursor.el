;;; leim-cursor.el --  Specify current input mode: In leim or out of leim.

;; Author: Hiroshi YOKOTA <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: Hiroshi YOKOTA <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 1.2
;; Keywords: leim color color-mate kanakan-cursor
;; Content-Type: text/plain; charset=x-euc-jp

;; This code is derived from egg-cursor.el.

;;; This program is distributed under the GNU GENERAL PUBLIC LICENSE.

;;; History:
;; leim-cursor.el Ver1.4
;;    o Wnn7Egg support
;; leim-cursor.el Ver1.3
;;    o after-make-frame-functions hook bug fix
;;        (Thanks for YAMASHITA JUNJI <ysjj@unixuser.org>)
;; leim-cursor.el for Color-Mate Ver.1.2:
;;    o xemacs fix.
;; leim-cursor.el for Color-Mate Ver.1.1:
;;    o Adapt to egg(wnn) on XEmacs.
;; leim-cursor.el for Color-Mate Ver.1.0:
;;    o Initial version.

;;;; Usage
;;; Put this file in your emacs-lisp directory.
;;; And put (require 'leim-cursor) in your ~/.emacs.
;;; Then, use your favorite leim system.

;;;; Note
;;; This code will work with {X,GNU}Emacs 20.x running on window system.
;;; If you want to change the color for each input mode into "yellow",
;;; put (setq leim-mode-on-cursor-color "yellow") in your .emacs.

;---------------------------------------------------------------;
;                 leim-cursor.el for Color-Mate
;---------------------------------------------------------------;
; $Id: leim-cursor.el,v 1.3 2002/05/12 16:27:56 elca Exp $

;;;; Code

;; Color Setup
(defvar leim-mode-on-cursor-color "forestgreen"
  "Cursor color for leim mode")
(defvar leim-mode-off-cursor-color nil
  "Cursor color for mode out of leim")

(defvar leim-cursor-color-bound-to-each-buffer nil
  "This variable will be referred when buffer is selected.
This is leim-cursor's buffer-local variable. Don't use it!")
(make-variable-buffer-local 'leim-cursor-color-bound-to-each-buffer)


;; 設定が無い時は初期設定のカーソル色を引き継ぐ
(if (not leim-mode-off-cursor-color)
    (setq leim-mode-off-cursor-color
	  (if (featurep 'xemacs)
	      (face-background-name 'text-cursor)
	    (cdr (assoc 'cursor-color (frame-parameters (selected-frame)))))
	  ))

;;
;; 他の kanakan-cursor プログラムとの連係用の変数
;;
(defvar canna-cursor-japanese-mode "init" "If \"on\", you are input words with canna.")
(defvar egg-cursor-japanese-mode "init" "If \"on\", you are input words with egg.")
(defvar skk-cursor-japanese-mode "init" "If \"on\", you are input words with skk.")
(defvar sj3-cursor-japanese-mode "init" "If \"on\", you are input words with sj3.")
(defvar leim-cursor-mode         "init" "If \"on\", you are input words with leim")
(make-variable-buffer-local 'canna-cursor-japanese-mode)
(make-variable-buffer-local 'egg-cursor-japanese-mode)
(make-variable-buffer-local 'skk-cursor-japanese-mode)
(make-variable-buffer-local 'sj3-cursor-japanese-mode)
(make-variable-buffer-local 'leim-cursor-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; "C-\\" を押した時に呼ばれる。
;;
(add-hook 'input-method-activate-hook
	 '(lambda ()
	    (progn
	      (setq leim-cursor-color-bound-to-each-buffer leim-mode-on-cursor-color)
	      (leim-cursor-set "on"))))
(add-hook 'input-method-inactivate-hook
	 '(lambda ()
	    (progn
	      (setq leim-cursor-color-bound-to-each-buffer leim-mode-off-cursor-color)
	      (leim-cursor-set "off"))))


(defadvice bury-buffer (after add-leim-cursor-set first activate)
  (leim-cursor-set leim-cursor-mode))
(defadvice kill-buffer (after add-leim-cursor-set first activate)
  (leim-cursor-set leim-cursor-mode))
(defadvice switch-to-buffer (after add-leim-cursor-set first activate)
  (leim-cursor-set leim-cursor-mode))
(defadvice select-window (after add-leim-cursor-set first activate)
  (leim-cursor-set leim-cursor-mode))
(defadvice other-window (after add-leim-cursor-set first activate)
  (leim-cursor-set leim-cursor-mode))

; xemacs hack
; leim(japanese-egg) でカーソルの色が元に戻ってしまう事があるので再設定する。
(if (featurep 'xemacs)
    (progn
      (defadvice henkan-fence-region-or-single-space
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))

      ;; for Wnn7Egg
      (defadvice wnn7-henkan-next-kouho
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))
      (defadvice wnn7-henkan-kakutei
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))
      (defadvice egg-self-insert-command
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))
      (defadvice egg-use-input-predict
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))
      (defadvice egg-unuse-input-predict
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))
      (defadvice egg-predict-next-candidate
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))
      (defadvice egg-predict-start-realtime
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))
      (defadvice egg-predict-start-parttime
	(after add-leim-cursor-set first activate)
	(leim-cursor-set leim-cursor-mode))
      ))

; meadow hack
; カーソルを点滅させるとうまく色が変わらないようだ。
(if (featurep 'meadow)
    (progn
      (set-cursor-type 'box)
      (mw32-ime-initialize)))


(add-hook 'after-make-frame-functions
	  (function
	   (lambda (nframe)
	     (let ((old-frame (selected-frame)))
	       (select-frame nframe)
	       (leim-cursor-set leim-cursor-mode)
	       (select-frame old-frame)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; カーソル色設定
;; set cursor color
;;
;; canna, egg, skk, sj3, leim のどれか一つの漢字入力モードが on に
;; なっているとカーソル色を元に戻す事が出来なくなるようにしてある。
;;
(defun leim-cursor-set (mode)
  "Cursor color changer with conflict management."
  (progn
    (cond
     ((equal mode "on")
      (progn
	(set-cursor-color leim-cursor-color-bound-to-each-buffer)
	(setq leim-cursor-mode "on")
	))
     ((equal mode "off")
      (if (not (or (equal canna-cursor-japanese-mode "on")
		   (equal egg-cursor-japanese-mode "on")
		   (equal skk-cursor-japanese-mode "on")
		   (equal sj3-cursor-japanese-mode "on")))
	  (progn
	    (set-cursor-color leim-cursor-color-bound-to-each-buffer)
	    (setq leim-cursor-mode "off")
	    )))
     ((equal mode "init")
      (if (not (or (equal canna-cursor-japanese-mode "on")
		   (equal egg-cursor-japanese-mode "on")
		   (equal skk-cursor-japanese-mode "on")
		   (equal sj3-cursor-japanese-mode "on")))
	  (progn
	    (set-cursor-color leim-mode-off-cursor-color)
	    (setq leim-cursor-mode "init")
	    )))
     )))

(provide 'leim-cursor)

;;; leim-cursor.el ends here
