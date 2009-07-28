;; mew settings
;(autoload 'mew "mew" nil t)
;(autoload 'mew-send "mew" nil t)
(setq mew-auto-get t)
(setq mew-fcc "+Backup")
;(setq mew-auto-flush-queue t)
(setq mew-mail-domain-list '("light.ed.ynu.ac.jp"))

;(setq mew-icon-directory "/usr/lib/xemacs/site-packages/etc/mew/mew-show.xpm")
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-letter
      'mew-draft-kill
      'mew-send-hook))
;(setq mew-mail-address-list '("jun@light.ed.ynu.ac.jp"))
