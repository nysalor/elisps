;; scratch buffer 以外をまとめてタブに表示する
(require 'cl)
 (when (require 'tabbar nil t)
    (setq tabbar-buffer-groups-function
          (lambda (b) (list "All Buffers")))
    (setq tabbar-buffer-list-function
          (lambda ()
            (remove-if
             (lambda(buffer)
               (find (aref (buffer-name buffer) 0) " *"))
             (buffer-list))))
    (tabbar-mode))

;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
  (dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
    (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
  (defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
    `(defun ,name (arg)
       (interactive "P")
       ,do-always
       (if (equal nil arg)
         ,on-no-prefix
         ,on-prefix)))
  (defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
  (defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
  (global-set-key [(control tab)] 'shk-tabbar-next)
  (global-set-key [(control shift tab)] 'shk-tabbar-prev)

;; 外観変更
 (set-face-attribute
   'tabbar-default-face nil
   :background "gray60")
  (set-face-attribute
   'tabbar-unselected-face nil
   :background "gray85"
   :foreground "gray30"
   :box nil)
  (set-face-attribute
   'tabbar-selected-face nil
   :background "#f2f2f6"
   :foreground "black"
   :box nil)
  (set-face-attribute
   'tabbar-button-face nil
   :box '(:line-width 1 :color "gray72" :style released-button))
  (set-face-attribute
   'tabbar-separator-face nil
   :height 0.7)

;; F9 で tabbar-mode
(global-set-key [f9] 'tabbar-mode)

;; グルーピング
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;; グルーピング関数
(defun my-tabbar-buffer-groups (buffer)
  "tabbar's my groups"
  (with-current-buffer (get-buffer buffer)
    (cond
     ((or (get-buffer-process (current-buffer))
          (memq major-mode
                '(comint-mode compilation-mode)))
      '("Process")
      )
     ((member (buffer-name)
              '("*Messages*"))
      '("Common")
      )
     ((string-match "^\\(\\..*\\)\\|.*\\.conf" (buffer-name))
      '("conf")
      )
     ((string-match ".*Message.*\\|.*\\.txt\\|\\*scratch\\*" (buffer-name))
      '("Main")
      )
     ((memq major-mode
            '(text-mode eshell-mode shell-mode term-mode))
      '("Main")
      )
     ((eq major-mode 'dired-mode)
      '("Dired")
      )
     ((memq major-mode
            '(help-mode apropos-mode Info-mode Man-mode))
      '("Help")
      )
     ((memq major-mode
           '(ruby-mode html-mode cperl-mode))
     '("Dev")
     )
     ((memq major-mode
           '(lisp-mode))
     '("Elisp")
     )
    (t
     (list
      (if (and (stringp mode-name) (string-match "[^ ]" mode-name))
          mode-name
        (symbol-name major-mode)))
     )
    )))

