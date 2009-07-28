;;(setq mac-transparency-alpha 90)
;;(require 'color-theme)
;;(color-theme-subtle-hacker)
(tool-bar-mode -1)
(fringe-mode '(6 . 6))
(scroll-bar-mode 1)

(setq default-frame-alist
      (append
       (list
	'(active-alpha . 0.90)
	'(inactive-alpha . 0.80)
	) default-frame-alist)
      )

