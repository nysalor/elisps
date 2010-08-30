;; cperl-mode

(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
(defalias 'perl-mode 'cperl-mode)
(append '(("\\.cgi$" . cperl-mode)) auto-mode-alist)
(custom-set-faces
 '(cperl-array-face ((t (:italic nil)))))
(custom-set-faces
 '(cperl-hash-face ((t (:italic nil)))))
