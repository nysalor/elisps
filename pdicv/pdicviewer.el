;; pdicviewer.el - PDIC Viewer for Emacs
;;
;; Copyright (C) 2005 Naoya TOZUKA. All Rights Reserved.
;;
;; Author: Naoya TOZUKA <pdicviewer@gmail.com>
;; Maintainer: Naoya TOZUKA <pdicviewer@gmail.com>
;; Primary distribution site: http://pdicviewer.naochan.com/el/
;;
;; Created: 14 Feb 2005
;; Last modified: 23 Dec 2005
;; Version: 0.9.1
;; Keywords: PDIC dictionary search eijiro
;;

;;; Commentary:
;;
;; PDICフォーマットの辞書から検索します。
;; 利用及び再配布の際は、GNU 一般公用許諾書の適当なバージョンに従って下さい。
;;
;; 一次配布元
;;    http://pdicviewer.naochan.com/el/

;;; Code:
;(require 'pdicv-core)
(require 'pdicv-search)
;(require 'pdicv-eijiro)
(require 'pdicv-mode)

; 辞書のインストール先を指定します
; (eword-encoding pron-encoding jword-encoding example-encoding) )
(setq pdicv-dictionary-list
      '(
;        (sample "~/pdic/SAMPLE.DIC" ;
;                (nil nil sjis sjis) t)
        (latin "~/dict/pdic/latinlexicon.dic"
                (nil nil sjis sjis))
        (italy "~/dict/pdic/gdig01117w.dic"
                  (sjis nil sjis sjis) t)
        )
      )

;;;###autoload
(defun pdicv ()
  ""
  (interactive)
  (pdicv-init)
  )

;;; pdicviewer.el ends here
