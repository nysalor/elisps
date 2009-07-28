;; ���ܸ�Ķ�
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'sjis-mac)
(set-file-name-coding-system 'utf-8)

;; �ե����
;(load "~/elisp/font.el")
;;(load "~/elisp/carbon-font")
;;(set-default-font "fontset-hiraginomaru")
;;(set-default-font "fontset-hiraginokaku")
;;(setq default-frame-alist
;;      (append (list
;;              '(font . "fontset-hiraginokaku")
;;               )
;;              default-frame-alist))
(setq mac-allow-anti-aliasing t)
;; �ե����
;;(if (eq window-system 'mac) (require 'carbon-font))
;;(fixed-width-set-fontset "hiramaru" 14)

;;(set-face-attribute 'default nil
;;                    :family "courier"
;;                    :height 140)
;;(set-fontset-font "fontset-default"
;;                  'japanese-jisx0208
;;                  '("�ҥ饮�γѥ� pro w4*" . "jisx0208.*"))
(if (eq window-system 'mac) (require 'carbon-font))
(fixed-width-set-fontset "osaka" 14)

;; terminal.app
(defun mac-open-terminal ()
  (interactive)
  (let ((dir ""))
    (cond
     ((and (local-variable-p 'dired-directory) dired-directory)
      (setq dir dired-directory))
     ((stringp (buffer-file-name))
      (setq dir (file-name-directory (buffer-file-name))))
     )
    (do-applescript
     (format "
tell application \"Terminal\"
  activate
  try
    do script with command \"cd %s\"
  on error
    beep
  end try
end tell" dir))
    ))

;; �֥饦��
(defun browse-by-safari (url arg)
  (shell-command (format "open \"%s\"" url)))
(setq browse-url-browser-function 'browse-by-safari)

;; ���٥���
(setq gc-cons-threshold 800000)

;; �Хå�����å���
(define-key global-map [2213] nil)
(define-key global-map [67111077] nil)
(define-key global-map [134219941] nil)
(define-key global-map [201328805] nil)
(define-key function-key-map [2213] [?\\])
(define-key function-key-map [67111077] [?\C-\\])
(define-key function-key-map [134219941] [?\M-\\])
(define-key function-key-map [201328805] [?\C-\M-\\])

(define-key global-map [3420] nil)
(define-key global-map [67112284] nil)
(define-key global-map [134221148] nil)
(define-key global-map [201330012] nil)
(define-key function-key-map [3420] [?\\])
(define-key function-key-map [67112284] [?\C-\\])
(define-key function-key-map [134221148] [?\M-\\])
(define-key function-key-map [201330012] [?\C-\M-\\])

;; ���������®
(load "~/elisp/cursor.elc")

;; ʸ�������н�
(add-hook 'after-init-hook
           (set-keyboard-coding-system 'sjis-mac))

