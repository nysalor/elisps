;;ecb
(add-to-list 'load-path "~/elisp/ecb")
(load-file "~/elisp/cedet/common/cedet.el")
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-windows-width 0.25)
(defun ecb-toggle ()
(interactive)
(if ecb-minor-mode
(ecb-deactivate)
(ecb-activate)))
(global-set-key [f2] 'ecb-toggle)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote mixed)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cperl-array-face ((t (:italic nil))))
 '(cperl-hash-face ((t (:italic nil))))
 '(mode-line ((t (:background "grey75" :foreground "#000000" :box (:line-width -1 :style released-button) :background "SlateGray" :foreground "LightGray"))))
 '(region ((t (:background "lightgoldenrod2" :background "RoyalBlue3" :foreground "gray95")))))
