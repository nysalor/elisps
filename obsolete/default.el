(setq-default case-fold-search nil)
(setq next-line-add-newlines nil)
(setq kill-whole-line t)
(line-number-mode 1)
(setq visible-bell t)
(defvar manual-program "/usr/local/bin/jman" "Japanese manual pages")
(setq manual-program "/usr/local/bin/jman")
(setq make-backup-files nil)

;(global-set-key "\C-xm" 'mew)
(global-set-key "\C-xl" 'goto-line)

;(setq modifier-keys-are-sticky t)

;;load lisp(s)
;(load "~/init/sdic.el")
;(load "~/init/line.el")
