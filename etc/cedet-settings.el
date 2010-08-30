;; cedet設定
;; うまく動かなかった

(load-file "/Applications/Emacs.app/Contents/Resources/lisp/cedet/cedet.elc")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu
