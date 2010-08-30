;; linux(Emacs23 snapshot)向け設定

;; クリップボードをXと同期
(setq x-select-enable-clipboard t)

;; XFSフォント設定
;; Consolas+メイリオ
(set-default-font "Consolas-9")
(set-face-font 'variable-pitch "Consolas-9")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("MeiryoKe_Console" . "unicode-bmp"))

;; 透過
;; Xの設定によっては動作しない
;;(modify-all-frames-parameters
;; (list (cons 'alpha '(nil 90 70 50))))
;;(set-frame-parameter nil 'alpha 90)

;; AtokX3 IIIMCF
(add-to-list 'load-path "~/elisp/iiimecf")
(setq iiimcf-server-control-hostlist (list (concat "/tmp/.iiim-" (user-login-name) "/:0.0")))
(setq iiimcf-server-control-default-language "ja")
(setq iiimcf-server-control-default-input-method "atokx3")
(require 'iiimcf-sc)
(setq default-input-method 'iiim-server-control)
(define-key global-map [zenkaku-hankaku] 'toggle-input-method)
(define-key global-map [hiragana-katakana] (lambda ()
    (interactive)
    (if current-input-method (inactivate-input-method))
    (toggle-input-method)))
(define-key global-map [muhenkan] (lambda ()
    (interactive)
    (inactivate-input-method)))
(setq iiimcf-UI-preedit-use-face-p "window-system")

;; dummy keys
;; 無線LAN切り替えキーを押すとエラーになる対策
(defun wlan-toggle ()
  (interactive)
  (message "WLAN toggled."))
(global-set-key [XF86WLAN] 'wlan-toggle)

;; battery mode
;; モードラインにバッテリ残量とCPU温度を表示
(display-battery-mode 1)
