;; Lookup
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)

;; keybind
(global-set-key "\C-c\C-l\C-l" 'lookup)
(global-set-key "\C-c\C-l\C-r" 'lookup-region)
(global-set-key "\C-c\C-l\C-p" 'lookup-pattern)

;; 検索エージェントの設定
(setq lookup-search-agents '((ndtp "127.0.0.1")))
