;; inf-ruby mode
(autoload 'ruby-mode "ruby-mode"                                                          "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.rake$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
	     (inf-ruby-keys)))
(global-font-lock-mode 1)

;; ruby-block
;; ブロックのハイライト
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; ruby-electric
;;(require 'ruby-electric)

;; hideshow on ruby-mode
;; C-c @ C-cでメソッドやクラスなどをIDEっぽく隠す
(require 'hideshow)
(add-hook 'ruby-mode-hook
          '(lambda()
             (hs-minor-mode 1)))

;; flymake
(load "~/elisp/ruby/ruby-flymake.el")

;; rinari-extend
;; (load "~/elisp/ruby/rinari-extend.el")

(let ((ruby-mode-hs-info
      '( ruby-mode
         "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
         "end"
         "#"
         ruby-move-to-block
         nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
    (setq hs-special-modes-alist
      (cons ruby-mode-hs-info hs-special-modes-alist))))

;; Lisp mode(おまけ)
(add-hook 'lisp-interaction-mode-hook
           '(lambda ()
             (setq hs-minor-mode 1)))
(add-hook 'emacs-lisp-mode-hook
           '(lambda ()
            (setq hs-minor-mode 1)))

;; 隠した行もisearchの対象にする
(setq search-invisible nil)

;; rails-mode
;; rinariに移行

;;(require 'rails)
;;(require 'cl)
;; キーバインド
;;(define-key rails-minor-mode-map [(control t)] 'rails-controller-layout:toggle-action-view)
;;(define-key rails-minor-mode-map [(control m)] 'rails-nav:goto-models)
;;(define-key rails-minor-mode-map [(control ,)] 'rails-nav:goto-controllers)
;;(define-key rails-minor-mode-map [(control .)]  'rails-nav:goto-helpers)
;;(define-key rails-minor-mode-map [(control /)]  'rails-find-config)
;;(define-key rails-minor-mode-map [(control up)]  'rails-lib:run-primary-switch)
;;(define-key rails-minor-mode-map [(control down)]  'rails-lib:run-primary-switch)
;;(define-key rails-minor-mode-map [(control left)]  'rails-lib:run-secondary-switch)
;;(define-key rails-minor-mode-map [(control right)]  'rails-lib:run-secondary-switch)

;; yaml-mode
(setq interpreter-mode-alist
      (cons '("yaml" . yaml-mode) interpreter-mode-alist))
(setq auto-mode-alist
      (cons '("\\.yml$" . yaml-mode) auto-mode-alist))
(autoload 'yaml-mode "yaml-mode" nil t)

;; erb-mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

;; haml-mode
;; いつか覚えたい
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; sass-mode
;; いつか覚えたい
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

;; Rinari
;; Rails開発向け拡張
(add-to-list 'load-path "~/elisp/rinari")
(require 'rinari)

;; rhtml-mode
(add-to-list 'load-path "~/elisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))

;;; chr code
;;(nconc auto-coding-alist '(
;;  ("\\.erb$" . utf-8)
;;  ("\\.rb$" . utf-8)
;;))

;; yasnippet
;; 便利なsnippet
(setq load-path (cons (expand-file-name "~/elisp/yasnippet") load-path))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/elisp/yasnippet/yasnippets-rails/rails-snippets")

;; ri
;; うまく動かないので保留
;;(setq ri-ruby-script "~/elisp/ruby/ri-emacs.rb")
;;(autoload 'ri "~/elisp/ruby/ri-ruby.el" nil t)
;;(setq ri-ruby-script "~/elisp/ruby/ri-emacs.rb")
;;(add-hook 'ruby-mode-hook (lambda ()
;;                              (local-set-key 'f1 'ri)
;;                              (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
;;                              (local-set-key 'f4 'ri-ruby-show-args)
;;                              ))

;; auto-complete
(require 'auto-complete-ruby)
(add-hook 'ruby-mode-hook
          (lambda ()
            (setq ac-omni-completion-sources '(("\\.\\=" ac-source-rcodetools)))))

;; irbsh
(load "irbsh")
(load "irbsh-toggle")
;;(setq ruby-program-name "irb")
(setq ruby-program-name "ruby -S irb --inf-ruby-mode")

;; refe
(require 'refe)
