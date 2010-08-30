;; 辞書関係

;; sdic-mode
(add-to-list 'load-path "~/elisp/sdic/")
(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)

;; 英和検索で使用する辞書
(setq sdic-eiwa-dictionary-list
      '(
        (sdicf-client
         "~/elisp/dict/gene.sdic")
        (sdicf-client
         "~/elisp/dict/eedict.sdic")
        ))

;; 和英検索で使用する辞書
(setq sdic-waei-dictionary-list
      '(
        (sdicf-client
         "~/elisp/dict/jedict.sdic")
        ))

;; 文字色
(setq sdic-face-color "blue")
