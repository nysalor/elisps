;;; mac-preview-mode.el --- a print-preview extension to Carbon Emacsen

;; Copyright (C) 2005  Seiji Zenitani <zenitani@mac.com>


(defadvice ps-print-buffer-with-faces
  (around mac-preview-print())
  (require 'pdf-preview)
  (pdf-preview-buffer-with-faces))
(defadvice ps-print-region-with-faces
  (around mac-preview-print())
  (require 'pdf-preview)
  (pdf-preview-region-with-faces))
(defadvice ps-print-buffer
  (around mac-preview-print())
  (require 'pdf-preview)
  (pdf-preview-buffer))
(defadvice ps-print-region
  (around mac-preview-print())
  (require 'pdf-preview)
  (pdf-preview-region))
(defadvice print-buffer (around mac-preview-print2(&optional mono))
  (interactive "P")
  (require 'pdf-preview)
  (if mono (pdf-print-buffer)(pdf-print-buffer-with-faces)))
(defadvice print-region (around mac-preview-print2(&optional mono))
  (interactive "P")
  (require 'pdf-preview)
  (if mono (pdf-print-region)(pdf-print-region-with-faces)))

(define-minor-mode mac-preview-mode
  "Toggle Mac Preview mode."
  :global t
  (if mac-preview-mode
      (ad-enable-regexp "mac-preview-print*")
    (ad-disable-regexp "mac-preview-print*")
    ))


;; ;;; Commentary:

;; ;; To use this package, add these lines to your .emacs file:
;; ;;
;; ;;     (require 'mac-preview-mode)
;; ;;     (mac-preview-mode 1)
;; ;;
;; ;; This minor mode requires the gs program.
;; ;;
;; ;;     (setq mac-preview-gs-program "/sw/bin/gs")
;; ;;


;; ;;; Code:

;; (defgroup mac-preview-mode nil
;;   "A print-preview extension to Carbon Emacsen."
;;   :group 'mac
;;   :version "22.1")

;; (defcustom mac-preview-gs-command "gs"
;;   "The command by which to invoke the gs program."
;;   :type 'string
;;   :group 'mac-preview-mode)

;; (defun mac-preview-lpr-switches ()
;;   "Document forthcoming..."
;;   (interactive)
;;   (let ((tmpdir-function
;;          (cond
;;           ((featurep 'carbon-emacs-package)
;;            'carbon-emacs-package-tmpdir)
;; ;;         ((featurep 'some-compatible-emacsen)
;; ;;          'some-compatible-emacsen-tmpdir)
;;           (t 'mac-preview-prepare-tmpdir)
;;           )))
;;     (list "-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=pdfwrite"
;;           "-dCompatibilityLevel=1.3" "-dAutoFilterGrayImages=false"
;;           "-dAutoFilterColorImages=false"
;;           "-dGrayImageFilter=/FlateEncode"
;;           "-dColorImageFilter=/FlateEncode"
;;           "-dUseFlateCompression=true"
;;           "-sPAPERSIZE=a4"
;;           (concat "-sOutputFile=¡À|cat¡À> "
;;                   (funcall tmpdir-function) "preview.pdf"
;;                   "&& /usr/bin/open -a Preview.app "
;;                   (funcall tmpdir-function) "preview.pdf")
;;           "-c .setpdfwrite" "-f" "-" "-c quit")
;;     ))

;; (defun mac-preview-prepare-tmpdir () (interactive) "/tmp/")


;; ;; advices

;; (defadvice ps-print-buffer-with-faces (around mac-preview-print())
;;   (let((ps-multibyte-buffer 'non-latin-printer)
;;        (ps-lpr-command mac-preview-gs-command)
;;        (ps-lpr-switches (mac-preview-lpr-switches)))
;;     ad-do-it
;;     ))
;; (defadvice ps-print-region-with-faces (around mac-preview-print())
;;   (let((ps-multibyte-buffer 'non-latin-printer)
;;        (ps-lpr-command mac-preview-gs-command)
;;        (ps-lpr-switches (mac-preview-lpr-switches)))
;;     ad-do-it
;;     ))
;; (defadvice ps-print-buffer (around mac-preview-print())
;;   (let((ps-multibyte-buffer 'non-latin-printer)
;;        (ps-lpr-command mac-preview-gs-command)
;;        (ps-lpr-switches (mac-preview-lpr-switches)))
;;     ad-do-it
;;     ))
;; (defadvice ps-print-region (around mac-preview-print())
;;   (let((ps-multibyte-buffer 'non-latin-printer)
;;        (ps-lpr-command mac-preview-gs-command)
;;        (ps-lpr-switches (mac-preview-lpr-switches)))
;;     ad-do-it
;;     ))
;; (defadvice print-buffer (around mac-preview-print2(&optional mono))
;;   (interactive "P")
;;   (if mono (ps-print-buffer)(ps-print-buffer-with-faces)))
;; (defadvice print-region (around mac-preview-print2(&optional mono))
;;   (interactive "P")
;;   (if mono (ps-print-region)(ps-print-region-with-faces)))


;; (define-minor-mode mac-preview-mode
;;   "Toggle Mac Preview mode, a minor mode that provides
;; a print-preview extension to Carbon Emacsen.
;; When `mac-preview-gs-command' is well-configured,
;; a preview image of the buffer or the region is shown by Preview.app."
;;   :global t
;; ;  :lighter " P" ; for debugging purpose
;;   :group 'mac-preview-mode
;;   (if mac-preview-mode
;;       (ad-enable-regexp "mac-preview-print*")
;;     (ad-disable-regexp "mac-preview-print*")
;;     )
;;   )


(provide 'mac-preview-mode)

;; mac-preview-mode.el ends here.
