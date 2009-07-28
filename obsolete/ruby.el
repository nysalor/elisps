;; ruby-mode
(setq interpreter-mode-alist
      (cons '("ruby" . ruby-mode) interpreter-mode-alist))
(setq auto-mode-alist
      (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(autoload 'ruby-mode "ruby-mode" nil t)
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; ruby-electric
(require 'ruby-electric)

;; hideshow on ruby-mode
(require 'hideshow)
(add-hook 'ruby-mode-hook
          '(lambda()
             (hs-minor-mode 1)))

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

;; Lisp mode ������Ȃ�ɉB���Ă����̂ŁA�L���ɂ��Ă݂��B
(add-hook 'lisp-interaction-mode-hook
           '(lambda ()
             (setq hs-minor-mode 1)))
(add-hook 'emacs-lisp-mode-hook
           '(lambda ()
            (setq hs-minor-mode 1)))

;; �B����(hide)�s�́Aisearch�̑Ώۂɂ��Ȃ�(outline���[�h�ɂ��e��)
(setq search-invisible nil)  ;; �u'open�vor�ut�v

;; rails
(require 'rails)
(require 'cl)
;; �L�[�o�C���h
(define-key rails-minor-mode-map [(control t)] 'rails-controller-layout:toggle-action-view)
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

;(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
;(setq auto-mode-alist
;(append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
;(setq interpreter-mode-alist (append '(("^#!.*ruby" . ruby-mode)) interpreter-mode-alist))
;;(load "~/elisp/ruby.el")

;; rrse
;;(load "rrse")
;;(rrse-setup)
;;(add-hook 'ruby-mode-hook
;;          '(lambda ()
;;             (define-key ruby-mode-map C-c C-r 'rrse-help)))
