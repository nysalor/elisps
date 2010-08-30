;; Lua mode
;; 使う日は来るのだろうか

(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "edit lua script" t)
