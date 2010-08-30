;; ����ط�

;; sdic-mode
(add-to-list 'load-path "~/elisp/sdic/")
(autoload 'sdic-describe-word "sdic" "��ñ��ΰ�̣��Ĵ�٤�" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point "sdic" "��������ΰ��֤α�ñ��ΰ�̣��Ĵ�٤�" t nil)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)

;; ���¸����ǻ��Ѥ��뼭��
(setq sdic-eiwa-dictionary-list
      '(
        (sdicf-client
         "~/elisp/dict/gene.sdic")
        (sdicf-client
         "~/elisp/dict/eedict.sdic")
        ))

;; �±Ѹ����ǻ��Ѥ��뼭��
(setq sdic-waei-dictionary-list
      '(
        (sdicf-client
         "~/elisp/dict/jedict.sdic")
        ))

;; ʸ����
(setq sdic-face-color "blue")
