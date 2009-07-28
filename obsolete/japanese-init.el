;; japanese settings for Carbon Emacs Package -*- coding: iso-2022-7bit -*-

;; Settings will be ignored in a non-Japanese environment
;; 日本語環境でのみ以下の設定をロードします

;; Chinese and Korean settings can be made from lines in sections A and B.
;; In section A, some modification will be required.
;; e.g. sjis-mac and 'Japanese should be replaced.
;; Lines in sections C are not necessary.

(when
    
    ;; Mac OS X Japanese Language environment
    ;; The environment variable __CF_USER_TEXT_ENCODING could be
    ;; "0x1F5:1:14", "0x1F6:1:14", "0x1F7:1:14" ...
    ;; (from wakimoto-san, [Macemacsjp-users 736])
    (string-match ":1:14\\'" (getenv "__CF_USER_TEXT_ENCODING"))

  ;; ============= Japanese language setting ======================

  ;; A. language environment
  (set-language-environment "Japanese")
  (set-default-coding-systems 'utf-8-unix)
  (set-keyboard-coding-system
   (if (eq window-system 'mac) 'sjis-mac 'utf-8)) ; by seto-san
  ;; (set-clipboard-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  ;; (set-file-name-coding-system 'utf-8m) ; already set
  (prefer-coding-system 'utf-8-unix)
  ;; A. end

  ;; B. inline input method (window-system)
  (when (eq window-system 'mac)
    (setq default-input-method "MacOSX") ;; dup, but necessary here
    (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
    (mac-translate-from-yen-to-backslash) ;; fix for Japanese environment
    )
  ;; B. end

  ;; C. fix: Unicode => Japanese mapping
  ;; Thanks to saiki-san (see [macemacsjp-users 870])
  ;; register circle around digits to cjk table (by Ando-san)
  (defadvice utf-translate-cjk-load-tables
    (after my-ad-circled-digit activate)
    (dotimes (i 20)
      (let ((unicode (+ #x2460 i))
            (char (+ 54433 i)))
        (if (utf-translate-cjk-substitutable-p unicode)
            (puthash unicode char ucs-unicode-to-mule-cjk))
        (puthash char unicode ucs-mule-cjk-to-unicode))))
  ;; prevent to use half-width marks (by Nanba-san)
  (utf-translate-cjk-set-unicode-range 
   '((#x2e80 . #xd7a3)
     (#xff00 . #xffef)
     (#xa7 . #xa7)                        ;
     (#xb0 . #xb1)                        ;
     (#xb4 . #xb4)                        ;
     (#xb6 . #xb6)                        ;
     (#xd7 . #xd7)                        ;
     (#xf7 . #xf7)                        ;
     (#x370 . #x3ff)                      ; ギリシャ
     (#x400 . #x4ff)                      ; キリル
     (#x2000 . #x206f)                    ; 一般句読点
     (#x2103 . #x2103)                    ; ℃
     (#x212b . #x212b)                    ; Å
     (#x2190 . #x21ff)                    ; 矢印
     (#x2200 . #x22ff)                    ; 数学記号
     (#x2300 . #x23ff)                    ; 技術記号
     (#x2460 . #x2473)                    ; 円囲み数字
     (#x2500 . #x257f)                    ; 罫線
     (#x25a0 . #x25ff)                    ; 幾何学模様
     (#x2600 . #x26ff)                    ; その他の記号
     ))
  ;; C. end

  ;; ============= Japanese language setting ======================

  )

;; end