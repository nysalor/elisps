;; emacs�������ޥ���

;;;; load-path
(setq load-path
      (append '("~/elisp/"
                "~/elisp/lib/"
                "~/elisp/elc/"
                "~/elisp/ruby/"
                "~/elisp/rails/"
                "/usr/local/share/emacs"
                "/usr/share/emacs"
                ) load-path))

(setq exec-path
      (append
       (list "~/bin") exec-path))

;;;; ������

;; ��ư�ޤ��֤�
(setq text-mode-hook '(lambda () (set-fill-column 70)))
(setq text-mode-hool 'turn-on-auto-fill)
;;(setq color-mate-line-space "3+3")

;; ��ʸ���Ⱦ�ʸ�������
(setq-default case-fold-search nil)

;; ��ưŪ�˹Ԥ��ɲ�
(setq next-line-add-newlines nil)

;; ���Ԥ�ޤ�ƥ��å�
(setq kill-whole-line t)

;; �����ɽ��
(column-number-mode 1)

;; �ӥ��奢��٥�
(setq visible-bell t)

;; shift�򲡤��ʤ�������
(pc-selection-mode t)

;; �ߥ˥Хåե��Υꥵ����������
(setq resize-mini-windows nil)

;; �����ȥ�����
(setq auto-save-interval 0)
(setq auto-save-timeout 30)

;; �Хå����åפ�������ʤ�
(setq backup-inhibited t)

;; ����¾�����Х����
(global-set-key "\C-xl" 'goto-line)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-0" 'delete-window)
(global-set-key "\M-1" 'delete-other-window)
(global-set-key "\M-?" 'help-for-help)
(global-set-key [?\C-,] 'bs-cycle-next)
(global-set-key [?\C-.] 'bs-cycle-previous)
(global-set-key "\C-z" nil)
;;(global-set-key [delete] 'delete-char)
;;(load "~/elisp/keys.el")

;; ! ���б������̤˰�ư (move to the other paren by "!" key)
(global-set-key "!" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert !."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;;;; ����

;; ���ץ�å����ä�
(setq inhibit-startup-message t)

;; �ġ���С���ä�
(tool-bar-mode -1)
;;(custom-set-variables
;; '(load-home-init-file t t)
;; '(toolbar-visible-p nil))

;;;; �ɲõ�ǽ

;; redo
(require 'redo)
(global-set-key "\C-\\" (quote redo))

;; ����������֤�Ͽ
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/emacs.d/save-places")

;; ���ֹ�ɽ��
(require 'wb-line-number)
(setq truncate-partial-width-windows nil)
(set-scroll-bar-mode nil)
;;(wb-line-number-toggle)
(setq wb-line-number-scroll-bar t)
(global-set-key [f1] 'wb-line-number-toggle)
;;(line-number-mode 0)

;; �Ƕ�Ȥä��ե�����ꥹ�Ȥ���¸
(require 'recentf)
(recentf-mode 1)

;; �ե����륪���ץ󡦥Хåե��ڤ��ؤ��ٱ�
(require 'ido)
(ido-mode t)

;; color-moccur
(require 'color-moccur)
(global-set-key "\C-c\C-f" 'moccur-grep-find)
(global-set-key "\C-c\C-g" 'moccur)

;; timestamp����
(autoload 'instamp "instamp" "Insert TimeStamp on the point" t)
(define-key global-map "\C-cs" 'instamp)

;;;; OS���Ȥ�����
(load "~/elisp/etc/platform.el")

;;;; �Ƽ�����

;; ������
(load "~/elisp/etc/shell.el")

;; ����
;;(load "~/elisp/etc/dict.el")

;; c/migemo
(load "~/elisp/etc/migemo.el")

;;;; ���ץꥱ�������

;; tabbar
(load "~/elisp/etc/tabbar.el")

;; revive
;;(load "~/elisp/revive.el")

;; color-mate
(load "~/elisp/etc/emacs-color.el")

;; navi2ch
(load "~/elisp/etc/2ch.el")

;;;; ��ȯ�ط�

;; cperl-mode
(load "~/elisp/etc/perl.el")

;; ruby-mode
(load "~/elisp/etc/ruby.el")

;; ECB
(load "~/elisp/etc/ecb.el")
