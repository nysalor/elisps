;;; for Japanese(JIS) Keyboard Layout
(setq mac-im-keycode-map
      (let ((map (make-keymap)))
	(define-key map [?a] '(#x00 . nil))
	(define-key map [?A] '(#x00 . t))
	(define-key map [?s] '(#x01 . nil))
	(define-key map [?S] '(#x01 . t))
	(define-key map [?d] '(#x02 . nil))
	(define-key map [?D] '(#x02 . t))
	(define-key map [?f] '(#x03 . nil))
	(define-key map [?F] '(#x03 . t))
	(define-key map [?h] '(#x04 . nil))
	(define-key map [?H] '(#x04 . t))
	(define-key map [?g] '(#x05 . nil))
	(define-key map [?G] '(#x05 . t))
	(define-key map [?z] '(#x06 . nil))
	(define-key map [?Z] '(#x06 . t))
	(define-key map [?x] '(#x07 . nil))
	(define-key map [?X] '(#x07 . t))
	(define-key map [?c] '(#x08 . nil))
	(define-key map [?C] '(#x08 . t))
	(define-key map [?v] '(#x09 . nil))
	(define-key map [?V] '(#x09 . t))
	(define-key map [?<] '(#x0a . nil))
	(define-key map [?>] '(#x0a . t))
	(define-key map [?b] '(#x0b . nil))
	(define-key map [?B] '(#x0b . t))
	(define-key map [?q] '(#x0c . nil))
	(define-key map [?Q] '(#x0c . t))
	(define-key map [?w] '(#x0d . nil))
	(define-key map [?W] '(#x0d . t))
	(define-key map [?e] '(#x0e . nil))
	(define-key map [?E] '(#x0e . t))
	(define-key map [?r] '(#x0f . nil))
	(define-key map [?R] '(#x0f . t))
	(define-key map [?y] '(#x10 . nil))
	(define-key map [?Y] '(#x10 . t))
	(define-key map [?t] '(#x11 . nil))
	(define-key map [?T] '(#x11 . t))
	(define-key map [?1] '(#x12 . nil))
	(define-key map [?!] '(#x12 . t))
	(define-key map [?2] '(#x13 . nil))
	(define-key map [?\"] '(#x13 . t)) ; @->"
	(define-key map [?3] '(#x14 . nil))
	(define-key map [?#] '(#x14 . t))
	(define-key map [?4] '(#x15 . nil))
	(define-key map [?$] '(#x15 . t))
	(define-key map [?6] '(#x16 . nil))
	(define-key map [?&] '(#x16 . t)) ; ^->&
	(define-key map [?5] '(#x17 . nil))
	(define-key map [?%] '(#x17 . t))
	(define-key map [?^] '(#x18 . nil)) ; =->^
	(define-key map [?+] '(#x18 . t))
	(define-key map [?9] '(#x19 . nil))
	(define-key map [?\)] '(#x19 . t)) ; (->)
	(define-key map [?7] '(#x1a . nil))
	(define-key map [?\'] '(#x1a . t)) ; &->'
	(define-key map [?-] '(#x1b . nil))
	(define-key map [?=] '(#x1b . t)) ; _->=
	(define-key map [?8] '(#x1c . nil))
	(define-key map [?\(] '(#x1c . t)) ; ;->(
	(define-key map [?0] '(#x1d . nil))
	(define-key map [?\[] '(#x1e . nil))	 ; ]->[
	(define-key map [?\{] '(#x1e . t))	 ; }->{
	(define-key map [?o] '(#x1f . nil))
	(define-key map [?O] '(#x1f . t))
	(define-key map [?u] '(#x20 . nil))
	(define-key map [?U] '(#x20 . t))
	(define-key map [?@] '(#x21 . nil)) ; [->@
	(define-key map [?i] '(#x22 . nil))
	(define-key map [?I] '(#x22 . t))
	(define-key map [?p] '(#x23 . nil))
	(define-key map [?P] '(#x23 . t))
	(define-key map [return] '(#x24 . nil))
	(define-key map [?l] '(#x25 . nil))
	(define-key map [?L] '(#x25 . t))
	(define-key map [?j] '(#x26 . nil))
	(define-key map [?J] '(#x26 . t))
	(define-key map [?:] '(#x27 . nil))	; '->:
	(define-key map [?*] '(#x27 . t))	; "->*
	(define-key map [?k] '(#x28 . nil))
	(define-key map [?K] '(#x28 . t))
	(define-key map [?\;] '(#x29 . nil))
	(define-key map [?+] '(#x29 . t))	 ; :->+
	(define-key map [?\]] '(#x2a . nil))	 ; \->]
	(define-key map [?}] '(#x2a . t))	 ; |->}
	(define-key map [?,] '(#x2b . nil))
	(define-key map [?<] '(#x2b . t))
	(define-key map [?/] '(#x2c . nil))
	(define-key map [??] '(#x2c . t))
	(define-key map [?n] '(#x2d . nil))
	(define-key map [?N] '(#x2d . t))
	(define-key map [?m] '(#x2e . nil))
	(define-key map [?M] '(#x2e . t))
	(define-key map [?.] '(#x2f . nil))
	(define-key map [?>] '(#x2f . t))
	(define-key map [tab] '(#x30 . nil))
	(define-key map [? ] '(#x31 . nil))
	(define-key map [?`] '(#x32 . nil))
	(define-key map [?~] '(#x32 . t))
	(define-key map [delete] '(#x75 . nil))
	(define-key map [backspace] '(#x33 . nil))
	(define-key map [?\\] '(#x5d . nil)) ; NEW!!
	(define-key map [?\|] '(#x5d . t))   ; NEW!!
	(define-key map [?_] '(#x5e . nil))  ; NEW!!
	(define-key map [escape] '(#x35 . nil))
	(define-key map [left] '(#x7b . nil))
	(define-key map [right] '(#x7c . nil))
	(define-key map [down] '(#x7d . nil))
	(define-key map [up] '(#x7e . nil))
	(define-key map [insert] '(#x72 . nil))
	(define-key map [home] '(#x73 . nil))
	(define-key map [end] '(#x77 . nil))
	(define-key map [prior] '(#x74 . nil))
	(define-key map [next] '(#x79 . nil))
	(define-key map [kp-numlock] '(#x47 . nil))
	(define-key map [f1] '(#x80 . nil))
	(define-key map [f2] '(#x78 . nil))
	(define-key map [f3] '(#x63 . nil))
	(define-key map [f4] '(#x76 . nil))
	(define-key map [f5] '(#x60 . nil))
	(define-key map [f6] '(#x61 . nil))
	(define-key map [f7] '(#x62 . nil))
	(define-key map [f8] '(#x64 . nil))
	(define-key map [f9] '(#x65 . nil))
	(define-key map [f10] '(#x6d . nil))
	(define-key map [f11] '(#x67 . nil))
	(define-key map [f12] '(#x6f . nil))
	(define-key map [f13] '(#x69 . nil))
	(define-key map [f14] '(#x6b . nil))
	(define-key map [f15] '(#x71 . nil))
	(define-key map [eisu-shift] '(#x66 . nil))
	(define-key map [kana-shift] '(#x68 . nil))
	(define-key map "\177" '(#x33 . nil))
	map))