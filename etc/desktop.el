;; desktop�����Ȃ�
;; ��肪�������ߎg�p���~

(load "desktop")
;;(desktop-load-default)

(nconc desktop-globals-to-save
       '(kill-ring
         extended-command-history
         file-name-history
         query-replace-history
         read-expression-history
         regexp-history
         shell-command-history))

(defmacro set-desktop-truncates (&rest forms)
  (let ((body (mapcar
               (lambda (e) `(desktop-truncate ,(car e) ,(cadr e)))
               forms)))
    `(progn ,@body)))

(global-set-key "\C-c\C-c\C-s"
                (lambda ()
                  "���݊J���Ă���o�b�t�@�C���[�h��ۑ�����D"
                  (interactive)
                  (set-desktop-truncates
                   ;; default variables
                   (search-ring 50)
                   (regexp-search-ring 50)
                   ;; additional variables
                   (search-ring 100)
                   (extended-command-history 100)
                   (regexp-search-ring 100)
                   (kill-ring 50)
                   (file-name-history 100)
                   (query-replace-history 100)
                   (read-expression-history 50)
                   (regexp-history 100)
                   (shell-command-history 100))
                  (desktop-save "~/.emacs.d/")
                  (message "Desktop Saved.")))

(global-set-key "\C-c\C-c\C-r"
                (lambda ()
                  "�o�b�t�@�C���[�h�𕜋A����D"
                  (interactive)
                  (load (convert-standard-filename "~/.emacs.d/.emacs.desktop"))))
