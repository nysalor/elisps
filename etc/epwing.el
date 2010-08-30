;; EPWING辞書の利用
;; lookupが動く環境に限る

(add-to-list 'load-path "~/elisp/lookup/")
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
(define-key ctl-x-map "l" 'lookup)
(define-key ctl-x-map "y" 'lookup-region)
(setq lookup-search-agents
      '(
        (ndeb "/media/SDHC/dict/KENKYUSHA")
        (ndeb "/media/SDHC/dict/WP")
        ))
(setq lookup-use-kakasi nil)
