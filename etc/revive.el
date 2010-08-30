;; 状態を保存・復元する
;; 問題が多いので使用中止

(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
(global-set-key "\C-c\C-c\C-s" 'save-current-configuration)    ; 状態保存
(global-set-key "\C-c\C-c\C-r" 'resume)                        ; 復元
(add-hook 'kill-emacs-hook 'save-current-configuration)   ; 終了時に状態保存
