;; -*- Mode: Emacs-Lisp -*-
;;
;; Mule $B>e$G(B Namazu $B$rMxMQ$7$?8!:w$r9T$&$?$a$N(B elisp $B$G$9!#(B
;;
;;  $Id: namazu.el,v 1.1 1999-05-10 10:00:20+09 shirai Exp $

(defconst namazu-version "namazu.el 1.00")

;; Namazu $B$K$h$k8!:w7k2L$,;X$9%I%-%e%a%s%H(B($BN`(B)$B$,(B
;; $B%m!<%+%k%G%#%9%/>e$K$"$k>l9g$K$O$=$l$rD>@\;2>H$7!"(B
;; $B%M%C%H%o!<%/>e$K$"$k>l9g$K$O(B brouse-url $B$N5!G=$rMQ$$$F(B
;; $B$=$l$r;2>H$9$k$3$H$,$G$-$^$9!#(B
;;
;; $B%m!<%+%k%G%#%9%/>e$N%I%-%e%a%s%H(B($BN`(B)$B$,05=L$7$F$"$k>l9g!"(B
;; jka-compr $B$N5!G=$rMQ$$$F$=$l$rE83+$7$h$&$H$7$^$9!#(B
;;
;; Namazu $B%b!<%I$G$O%m!<%+%k%G%#%9%/$K$J$$%U%!%$%k$X$N(B
;; $B%"%/%;%9$K$D$$$F$O(B brouse-url $B$K0lG$$7$F$$$^$9!#(B
;; $B$=$&$$$C$?$o$1$G$9$N$G(B browse-url-browser-function $B$K(B
;; $BE,@Z$J@_Dj$r$7$F$*$+$J$$$H!"30It$K$"$k%j%=!<%9$r(B
;; $B;2>H$9$k$3$H$O$G$-$^$;$s!#$?$H$($P$3$s$J@_Dj$r$7$^$9(B:
;;
;;  (autoload 'namazu "namazu" nil t)
;;  (setq browse-url-browser-function 'browse-url-netscape)
;;
;; font-lock $B$d(B hilit19 $B$,%m!<%I$7$F$"$l$P(B
;; $B8!:w7k2L$O(B($B$$$/$i$+(B)$B2Z$d$+$KI=<($5$l$k$G$7$g$&!#(B
;;
;; $BMQ0U$9$kI,MW$,$"$k$+$bCN$l$J$$$b$N(B:
;; $BA0=R$NDL$j(B browse-url $B$,I,MW$G$9$,!"(B19.28 $B%Y!<%9$N(B Mule $B$K$O(B
;; $B$3$l$,4^$^$l$F$$$J$$$h$&$G$9!#0J2<$N(B URL $B$J$I$+$iF~<j$7$F$/$@$5$$!#(B
;; $B$^$?!"$*;H$$$N(B Mule $B$KE:IU$5$l$F$$$k(B browse-url $B$O(B
;; $B8E$$%P!<%8%g%s$N$b$N$+$b$7$l$^$;$s$N$G(B
;; $B:G?7%P!<%8%g%s$r%A%'%C%/$7$F$_$k$N$b$h$$$G$7$g$&!#(B
;;
;;   <URL:http://wombat.doc.ic.ac.uk/emacs/browse-url.el>
;;
;; 19.28 $B%Y!<%9$N(B Mule $B$G$O(B 930 $B9TL\$"$?$j$K$"$k(B
;; (require 'term) $B$r(B (require 'terminal) $B$KJQ99$9$kI,MW$,$"$j$^$9!#(B
;;
;; browse-url-lynx-xterm $B$G(B lynx $B$r;H$C$F%V%i%&%:$9$k>l9g$K$O(B
;; (setq browse-url-xterm-program "kterm") $B$N$h$&$J(B
;; $B@_Dj$rDI2C$7$F$*$$$?J}$,$h$$$H;W$$$^$9!#(B
;;
;; $B8!:wJ}K!(B:
;; $B>e5-$N@_Dj$r=*$($?$i(B M-x namazu $B$H%?%$%W$7$F$/$@$5$$!#(B
;; $B$9$k$H8!:w$N%-!<(B($B>r7o<0(B)$B$rJ9$$$F$-$^$9$N$G(B namazu $B$H$+(B
;; ruby & perl $B$H$$$C$?8!:w%-!<$rF~NO$7$^$9!#(B
;; $BF~NO$r=*$($k$H(B Namazu $B$,5/F0$5$l!"(B
;; $B8!:w7k2L$rI=<($9$k%P%C%U%!$,:n$i$l$^$9!#(B
;; $B$3$N%P%C%U%!Fb$G$O0J2<$N%-!<A`:n$,Dj5A$5$l$F$$$^$9!#(B
;;
;;             $BA0%Z!<%8(B    $BA09`(B     $B<!9`(B    $B<!%Z!<%8(B
;;   $BI8=`(B(1)      P         p        n         N
;;   $BI8=`(B(2)              [BkSp]  [Space]
;;   $BI8=`(B(3)              M-[Tab]  [Tab]
;;   vi $BIw(B        h         k        j         l
;;   $B%+!<%=%k(B   [left]     [up]    [down]   [right]
;;
;;   $B%Z!<%8$N@hF,$X(B        <
;;   $B%Z!<%8$NKvHx$X(B        >
;;   $B%I%-%e%a%s%H$N;2>H(B    g $B$^$?$O(B [Enter]
;;   $B>r7o$rDI2C$7$F:F8!:w(B  r
;;   $B8!:w7k2L$N>C5n(B        q
;;   namazu $B=*N;(B           Q
;;   $B%X%k%WI=<((B            ?
;;
;; $B$^$?!"(Bmouse $B$N$^$s$J$+$N%\%?%s$r2!$9$H!"2!$7$?0LCV$K$h$C$F!"(B
;; "$B%I%-%e%a%s%H$N;2>H(B"$B!"(B"$BA0%Z!<%8(B"$B!"(B "$B<!%Z!<%8(B" $B$N$I$l$+$NF0:n$r9T$J(B
;; $B$$$^$9!#(B
;;
;; $B%G%U%)%k%H0J30$N%$%s%G%C%/%9(B(NMZ.*)$B$r;HMQ$7$?$$>l9g$O!"(B
;; C-u M-x namazu $B$H%?%$%W$9$k$3$H$G%$%s%G%C%/%9$NCV$$$F$"$k%G%#%l%/%H(B
;; $B%j$r;XDj$9$k$3$H$b=PMh$^$9!#$^$?!"8D!9$N%G%#%l%/%H%j$KBP$7$FJLL>$r(B
;; $BDj5A$9$k$3$H$b2DG=$G$9!#@_DjNc$J$I>\$7$$$3$H$O(B namazu-dir-alist $B$N(B
;; $B@bL@$r;2>H$7$F$/$@$5$$(B :-P$B!#(B
;;
;; $B:G?7HG$NF~<j$K$D$$$F(B:
;; namazu.el $B$N:G?7HG$O(B namazu $B$KIUB0$9$k$b$N$d!"(Bnamazu ML $B$J$I$G(B
;; $BF~<j2DG=$G$9(B.
;;
;; $BG[I[>r7o$J$I(B:
;; $B$3$l$O(B $B$^$D$b$H(B $B$f$-$R$m(B <matz@netlab.co.jp> $B$5$s$,:n@.$7!"(B
;; $BF1;a$H(B $BGO>l(B $BH%(B <baba@kusastro.kyoto-u.ac.jp> $B$5$s!"(B
;; $B9bNS(B $BE/(B <ccsatoru@vega.aichi-u.ac.jp> $B$5$s!"(B
;; Toshiaki Tanaka <toshiaki@ksj1.kansai-sc.toshiba.co.jp>$B$5$s!"(B
;; $B1|@>(B $BF#OB(B <fuji0924@mbox.kyoto-inet.or.jp> $B$5$s$N$46(NO$N2<$G(B
;; $B$d$^$@(B $B$"$-$i(B <akira@linux.or.jp> $B$5$s$,2~B$$r2C$($?$b$N$r!"(B
;; $BEZ20(B $B2mL-(B <tsuchiya@pine.kuee.kyoto-u.ac.jp> $B$5$s!"(B
;; $BKY8}63B@O:(B <kyota@po.ntts.co.jp> $B$5$sC#$N<8S#7cNe$K$h$j(B
;; $BGr0f=(9T(B <shirai@rdmg.mgcs.mei.co.jp> $B$,2~B$$7$F$$$k$b$N$G$9!#(B
;; $B$$$+$J$k7A$G$NMxMQ!&:FG[I[$K$D$$$F$b8"Mx$NN`$O0l@Z<gD%$7$^$;$s!#(B
;; $B<+M3$K07$C$F$b$i$C$F9=$$$^$;$s!#(B
;;
;; $B$*LsB+(B:
;; $B$3$l$O2?$i$+$NJ]>Z$rH<$&$b$N$G$O$"$j$^$;$s!#(B
;; $BDs6!$5$l$k5!G=$r;H$C$?7k2L!"MxMQ<T$,D>@\E*$"$k$$$O4V@\E*$K(B
;; $BB;32$rHo$C$?$H$7$F$b!"$=$l$O:n<TC#$N4XCN$9$k$H$3$m$G$O$"$j$^$;$s!#(B
;; $B$"$/$^$G(B at your own risk $B$G$4MxMQ2<$5$$!#(B
;;

(defvar namazu-command "namazu"
  "*Namazu $B$N8!:wMQ%W%m%0%i%`L>$G$9!#(B
$BDL>o$O(B namazu $B$J$I$G$7$g$&$,!"$=$&$G$O$J$$>l9g$d(B
PATH $B$,DL$C$F$$$J$$>l9g$K$OE,Ev$J%W%m%0%i%`L>$r;XDj$7$^$9!#(B")

(defvar namazu-argument "-H"
  "*Namazu $B$N8!:wMQ%W%m%0%i%`$r5/F0$9$k:]$K;XDj$9$k0z?t$G$9!#(B")

(defvar namazu-search-num 30
  "*Namazu $B$N8!:w7k2L$r0lEY$KI=<($9$k7o?t$G$9!#(B")

(defvar namazu-default-dir nil
  "*Namazu $B$,;2>H$9$k%$%s%G%C%/%9$NCV$$$F$"$k%G%#%l%/%H%jL>$G$9!#(B
$BFC$K;XDj$7$J$1$l$P%G%U%)%k%H$N%$%s%G%C%/%9$r;2>H$7$^$9!#(B
$BJ#?t$N%$%s%G%C%/%9$r;XDj$9$k>l9g$K$O$=$l$>$l$r6uGr$G6h@Z$C$F$/$@$5$$!#(B")

(defvar namazu-dir-alist nil
  "*$B%$%s%G%C%/%9$,CV$$$F$"$k%G%#%l%/%H%j$K(B
$B%7%s%\%j%C%/$JL>A0$r$D$1$k$?$a$N(B alist $B$G$9!#(B
  '((\"Namazu\" . \"/usr/doc/namazu/index /var/lib/namazu/index\")
    (\"Ruby\" . \"/usr/doc/ruby/namazu\"))
$B$J$I$N$h$&$K@_Dj$7$F$*$/$H!"8D!9$N%$%s%G%C%/%9%U%!%$%k$N$"$k(B
$B%G%#%l%/%H%jL>$r;XDj$9$kBe$o$j$K(B Namazu $B$d(B Ruby $B$H$$$C$?(B
$B$$$o$PJLL>$r;XDj$9$k$3$H$,$G$-$^$9!#(B
$BJ#?t$N%$%s%G%C%/%9$r;XDj$9$k>l9g$K$O$=$l$>$l$r6uGr$G6h@Z$C$F$/$@$5$$!#(B")

(defvar namazu-always-query-index-directory nil
  "*nil $B0J30$NCM$r@_Dj$9$k$H!"?tCM0z?t$,$J$$$H$-$K(B
$B%$%s%G%C%/%9%U%!%$%k$r;XDj$G$-!"?tCM0z?t$,$"$k$H$-$K(B
$B%G%U%)%k%H$N%$%s%G%C%/%9$r;2>H$9$k$h$&$K$J$j$^$9!#(B
$B>o$K%$%s%G%C%/%9%U%!%$%k$r;XDj$7$F8!:w$r9T$$$?$$(B
$B>l9g$J$I$KJXMx$+$b$7$l$^$;$s!#(B")

(defvar namazu-auto-turn-page nil
  "*nil $B0J30$NCM$r@_Dj$9$k$H!"<+F0E*$K%Z!<%8$a$/$j$r$7$^$9!#(B")

(defvar namazu-mode-hook nil
  "*Namazu $B%b!<%I$r:n@.$9$k%?%$%_%s%0$G8F$P$l$k(B hook $B$G$9!#(B")

(defvar namazu-display-hook nil
  "*Namazu $B$N=PNO$rI=<($9$k$H$-$K8F$P$l$k(B hook $B$G$9!#(B")

(defvar namazu-html-pattern "[^/]+\\.html?"
  "*$B%m!<%+%k%G%#%9%/>e$K$"$C$F$b(B browse-url $B$r;H$C$F(B
$B1\Mw$9$k%U%!%$%kL>$N%Q%?!<%s$G$9!#(B")

(defvar namazu-cs
  (if (> emacs-major-version 19) 'euc-jp '*euc-japan*)
  "*OS $B$NFbIt%3!<%I$H0[$J$j!"$+$DF0$+$J$$>l9g$KJQ99$7$F$_$F$/$@$5$$!#(B")

;;
;; $B$3$3$+$i@h$r$$$8$C$F!"AGE($K$J$C$?$i65$($F$/$@$5$$$M!#(B
;;

(defvar namazu-fill-prefix "\t")
(defvar namazu-header-prefix "   ")
(defvar namazu-history nil)
(defvar namazu-mode-map nil)
(defvar namazu-minibuffer-map nil)
(defvar namazu-buffer "*namazu*")
(defvar namazu-last-dir nil
  "$B8=:_$N8!:w$G;2>H$7$F$$$k%$%s%G%C%/%9$N:_=h(B")
(defvar namazu-current-page 0
  "$B1\MwCf$N8!:w7k2L$N%Z!<%8HV9f(B")
(defvar namazu-max-page 0
  "$B8=:_$N8!:w7k2L$N:GBg%Z!<%8HV9f(B")
(defvar namazu-output-title-pattern
  "^\\([0-9]+\\.\\) \\(.*\\) \\(([^)]*)\\)$"
  "$B8!:w7k2L$NCf$N%I%-%e%a%s%H$N%?%$%H%k$r<($99T$N%Q%?!<%s(B")
(defvar namazu-output-header-pattern
  (format "^%s\\([^:]+:.*\\)$" namazu-header-prefix)
  "$B8!:w7k2L$NCf$N(B From$B!"(BDate $B%X%C%@$r<($9%Q%?!<%s(B")
(defvar namazu-output-url-pattern
  "^\\(/.*\\|\\([a-z]+\\):[^ ]*\\) \\(size ([^)]*)\\)"
  "$B8!:w7k2L$NCf$N%I%-%e%a%s%H$N:_=h(B(URL)$B$r<($99T$N%Q%?!<%s(B")
(defvar namazu-output-current-list-pattern
  "^Current List: [0-9]+ $B!A(B [0-9]+$"
  "$B8!:w7k2L$NCf$N$I$NItJ,$r1\MwCf$+$r<($99T$N%Q%?!<%s(B")
(defvar namazu-output-pages-pattern
  "^Page: \\(\\[[0-9]+\\]\\)*\\[\\([0-9]+\\)\\]$"
  "$B8!:w7k2L$N%Z!<%8?t$r<($99T$N%Q%?!<%s(B")

(require 'browse-url)
(require 'jka-compr)
(provide 'namazu)

(defun namazu (&optional page-num namazu-dir key)
  "namazu-command $B$r5/F0$7$F8!:w$r9T$$$^$9!#(B"
  (interactive
   (list
    0
    (if (or (and (not namazu-always-query-index-directory) current-prefix-arg)
	    (and namazu-always-query-index-directory (not current-prefix-arg)))
	(read-from-minibuffer "Namazu index directory: "
			      nil namazu-minibuffer-map)
      nil)
    (read-from-minibuffer "Enter Keyword: "
			  (car namazu-history) nil nil 'namazu-history)))
  (let ((buffer (get-buffer-create namazu-buffer))
	(dir (or namazu-dir
		 (and namazu-default-dir
		      (expand-file-name namazu-default-dir))))
	(arg-list
	 (list "-n" (int-to-string namazu-search-num)
	       "-w" (int-to-string (* page-num namazu-search-num))
	       namazu-argument
	       (namazu-escape-key key))))
    (if (and dir (not (string= dir "")) (string-match "[^ \t]" dir))
	(setq arg-list (append arg-list
			       (namazu-split-dir (namazu-expand-dir-alias dir)))))
    (set-buffer buffer)
    (setq buffer-read-only nil)
    (buffer-disable-undo (current-buffer))
    (erase-buffer)
    (message "Namazu running ...")
    (let ((default-process-coding-system (cons namazu-cs namazu-cs))
	  (process-input-coding-system namazu-cs)
	  (process-output-coding-system namazu-cs)
	  (coding-system-for-read namazu-cs)
	  (coding-system-for-write namazu-cs))
      (apply (function call-process) namazu-command nil t nil arg-list))
    (if (not (and buffer
		  (get-buffer buffer)
		  (buffer-name (get-buffer buffer))))
	(message "Namazu exits with no output")
      (pop-to-buffer buffer)
      (goto-char (point-min))
      (save-excursion
	(namazu-fill)
	(if (re-search-forward
	     namazu-output-pages-pattern nil t)
	    (setq namazu-max-page
		  (+ -1 (string-to-int (buffer-substring
					(match-beginning 2) (match-end 2)))))
	  (setq namazu-max-page 0)))

      ;(goto-char (point-min))
      (setq namazu-current-page page-num)
      (setq namazu-last-dir dir)
      (namazu-mode)
      (setq buffer-read-only t)
      (run-hooks 'namazu-display-hook)
      (message "Namazu running ... done.") )))

(defun namazu-fill ()
  "namazu-command $B$G$N8!:w7k2L$r@07A$7$^$9!#(B"
  (while (re-search-forward "^[0-9]+\. " nil t)
    (beginning-of-line 2)
    (let ((start-point (point)))
      (re-search-forward "^$" nil t)
      (forward-line -1)
      ;; there is URL or file name
      (if (or (looking-at "/") (looking-at "[a-z]+:/"))
	  (forward-line -1))
      ;; there is description
      (if (> (point) start-point)
	  (save-excursion
	    (while (> (point) start-point)
	      (forward-line -1)
	      (insert namazu-header-prefix)
	      (beginning-of-line))
	  ))
      ;; there is description
      (let ((fill-column default-fill-column)
	    (fill-prefix namazu-fill-prefix))
	(insert namazu-fill-prefix)
	(fill-region (point)
		     (save-excursion (forward-line 1) (point))))
      ;; $BM>J,$J6u9T$r$H$C$Q$i$&$?$a$NEXNO(B
      (re-search-forward "^$" nil t)
      (while (looking-at "^$")
	(delete-char 1)
	(forward-line 1))
      )))

(defun namazu-escape-key (key)
  "$B8!:w<0Cf$N(B \\ $B$H(B ' $B$r%(%9%1!<%W$7$^$9!#(B"
  (let ((tmpkey1 key) (tmpkey2 ""))
    (while (string-match "\\([\"\\]\\)" tmpkey1)
      (setq tmpkey2
	    (concat tmpkey2
		    (substring tmpkey1 0 (match-beginning 0))
		    "\\" (substring tmpkey1
				    (match-beginning 1) (match-end 1))))
      (setq tmpkey1 (substring tmpkey1 (match-end 0))))
    (concat tmpkey2 tmpkey1)))


(defun namazu-re-search (&optional key)
  "$B8=:_$N8!:w%-!<$rJQ99$7$?>e$G:F8!:w$7$^$9!#(B"
  (interactive
   (list
    (read-from-minibuffer "Enter Keyword: "
			  (car namazu-history) nil nil 'namazu-history)))
  (namazu 0 namazu-last-dir key))

(defun namazu-next-page ()
  "$B<!$N%Z!<%8$N8!:w7k2L$X0\F0$7$^$9!#(B"
  (interactive)
  (if (< namazu-current-page namazu-max-page)
      (namazu (+ 1 namazu-current-page) namazu-last-dir (car namazu-history))
    t))

(defun namazu-prev-page ()
  "$BA0$N%Z!<%8$N8!:w7k2L$X0\F0$7$^$9!#(B"
  (interactive)
  (if (> namazu-current-page 0)
      (namazu (+ -1 namazu-current-page) namazu-last-dir (car namazu-history))
    t))

(defun namazu-dir-complete ()
  "$B%G%#%l%/%H%jL>$^$?$O(B namazu-dir-alist $B$+$i$N(B
$BJ8;zNsJd40$r9T$$$^$9!#(B"
  (interactive)
  (let ((input (buffer-substring 1 (point)))
	(alist namazu-dir-alist)
	dir file files compl all sub-input mb)
    (if (string-match "\\(^\\|\\(\\\\\\\\\\)*[^\\\\] \\)\\(\\(\\(\\\\\\\\\\)*\\\\ \\|[^ ]\\)*/\\)?\\([^/]*\\)$" input)
	(progn
	  (setq mb (match-end 1))
	  (save-match-data
	    (setq sub-input
		  (namazu-unescape-dir
		   (substring input mb (match-end 6)))))
	  (save-match-data
	    (setq dir
		  (namazu-unescape-dir
		   (substring input mb (match-beginning 6)))))
	  (setq file (substring input (match-beginning 6) (match-end 6)))
	  ;; HOME $B$+$i$NAjBP%Q%9$N=hM}(B
	  (if (and (string= dir "")
		   (string-match  "^~" file))
	      (progn (setq dir file) (setq file "")))
	  ;; $B%G%#%l%/%H%j$N>l9g$N=hM}(B
	  (setq files (and (file-exists-p dir)
			   (file-directory-p dir)
			   (directory-files dir t "^[^.]")))
	  (while files
	    (if (file-directory-p (car files))
		(setq alist
		      (append alist
			      (list (cons (concat (car files) "/")
					  (car files))))))
	    (setq files (cdr files)))
	  ;; Completion-List $B$N:n@.(B
	  (setq compl (or (try-completion sub-input alist)
			  (try-completion (expand-file-name sub-input) alist)))
	  (setq all (or (all-completions sub-input alist)
			(all-completions (expand-file-name sub-input) alist)))
	  (cond ((stringp compl)
		 (delete-region (+ mb 1) (point-max))
		 (insert (namazu-escape-dir compl))
		 (with-output-to-temp-buffer "*Completions*"
		   (display-completion-list all)))
		(compl
		 nil)
		(t
		 (beep)))
	  )
      (beep))))

(defun namazu-escape-dir (dir)
  "$B%G%#%l%/%H%jCf$N(B \"\\\" $B$H(B \" \" $B$r%(%9%1!<%W$7$^$9!#(B"
  (let ((tmpdir1 dir) (tmpdir2 ""))
    (while (string-match "\\([ \\]\\)" tmpdir1)
      (setq tmpdir2
	    (concat tmpdir2
		    (substring tmpdir1 0 (match-beginning 0))
		    "\\" (substring tmpdir1
				    (match-beginning 1) (match-end 1))))
      (setq tmpdir1 (substring tmpdir1 (match-end 0))))
    (concat tmpdir2 tmpdir1)))

(defun namazu-unescape-dir (dir)
  "$B%G%#%l%/%H%jCf$N(B \"\\\" $B$H(B \" \" $B$r%(%9%1!<%W$7$^$9!#(B"
  (let ((tmpdir1 dir) (tmpdir2 ""))
    (while (string-match "\\\\\\([ \\]\\)" tmpdir1)
      (setq tmpdir2
	    (concat tmpdir2
		    (substring tmpdir1 0 (match-beginning 0))
		    (substring tmpdir1
			       (match-beginning 1) (match-end 1))))
      (setq tmpdir1 (substring tmpdir1 (match-end 0))))
    (concat tmpdir2 tmpdir1)))

(defun namazu-split-dir (dirs)
  "$B%$%s%G%C%/%9%G%#%l%/%H%jJ8;zNs$rJ,3d$7!"(B\"~\" $B$J$I$rE83+$7$^$9!#(B"
  (let ((tmpdir1 dirs) (dir-list (list)))
    (while (string-match "\\([^\\\\]\\) " tmpdir1)
      (save-match-data
	(setq dir-list
	      (append dir-list
		      (list (expand-file-name
			     (namazu-unescape-dir
			      (substring tmpdir1 0 (match-end 1))))))))
      (setq tmpdir1 (substring tmpdir1 (match-end 0))))
    (if dirs
	(append dir-list (list (expand-file-name
				(namazu-unescape-dir tmpdir1))))
      dir-list)))

(defun namazu-expand-dir-alias (dir)
  "$B%$%s%G%C%/%9%G%#%l%/%H%jJ8;zNsCf$N%(%$%j%"%9$rE83+$7$^$9!#(B"
  (and dir namazu-dir-alist
       (let ((alist namazu-dir-alist))
	 (while alist
	   (while (string-match
		   (concat "\\(^\\| \\|\t\\)\\("
			   (regexp-quote (car (car alist)))
			   "\\)\\( \\|\t\\|$\\)") dir)
	     (setq dir (concat (substring dir 0 (match-beginning 2))
			       (cdr (car alist))
			       (substring dir (match-beginning 3)))))
	   (setq alist (cdr alist)))))
  dir)

(defun namazu-mode ()
  "Namazu $B$N8!:w7k2L$r1\Mw$9$k$?$a$N%b!<%I$G$9!#(B

binding          key
-------          ---
$BA0$N%Z!<%8(B       P           / h / [left]
$BA0$N9`L\(B         p / [BkSp]  / k / [up]    / M-[Tab]
$B8e$N9`L\(B         n / [Space] / j / [down]  / [Tab]
$B8e$N%Z!<%8(B       N           / l / [right]

$B%Z!<%8$N@hF,$X(B   <
$B%Z!<%8$NKvHx$X(B   >
$BJ8=q$r;2>H(B       g / [Enter]
$B:F8!:w(B           r / f
$B8!:w7k2L>C5n(B     q
Namazu $B=*N;(B      Q
$B%X%k%WI=<((B       ?

mouse $B$N??$sCf$N%\%?%s$r2!$9$H!"2!$7$?0LCV$K$h$C$F!"(B\"$BJ8>O$r;2>H(B\"$B!"(B
\"$BA0$N%Z!<%8(B\"$B!"(B\"$B8e$m$N%Z!<%8(B\" $B$N$I$l$+$N=hM}$r<B9T$7$^$9!#(B
"
  (interactive)
  (save-excursion
    (if (eq major-mode 'namazu-mode)
	()
      (kill-all-local-variables)
      (use-local-map namazu-mode-map)
      (setq mode-name "Namazu")
      (setq major-mode 'namazu-mode)
      (run-hooks 'namazu-mode-hook))))

(defun namazu-jump-next ()
  "$B8!:w7k2L$N<!$N9`L\$X0\F0$7$^$9!#(B"
  (interactive)
  (let ((pos (point)))
    (forward-line 1)
    (if (re-search-forward namazu-output-url-pattern nil t)
	(beginning-of-line)
      (goto-char pos)
      (if (and namazu-auto-turn-page
	       (< namazu-current-page namazu-max-page))
	  (progn
	    (namazu-next-page)
	    (namazu-jump-next))))))

(defun namazu-jump-prev ()
  "$B8!:w7k2L$N0l$DA0$N9`L\$X0\F0$7$^$9!#(B"
  (interactive)
  (if (re-search-backward namazu-output-url-pattern nil t)
      (if (save-excursion
	    (let ((ws (window-start)))
	      (if (re-search-backward "^$" nil t)
		  (and (>= ws (point))
		       (< 1 (count-lines ws (point))))
		nil)))
	  (recenter))
    (if (and namazu-auto-turn-page
	     (> namazu-current-page 0))
	(progn
	  (namazu-prev-page)
	  (end-of-buffer)
	  (namazu-jump-prev)))))

(defun namazu-view-at-mouse (event)
  "mouse $B$r;H$C$F%V%i%&%:$7$?$j%Z!<%8$r0\F0$7$?$j$7$^$9!#(B"
  (interactive "e")
  (set-buffer (event-buffer event))
  (goto-char (event-point event))
  (let ((pos (point))
	pos-title pos-url)
    (end-of-line)
    (and (re-search-backward namazu-output-title-pattern nil t)
	 (setq pos-title (point))
	 (goto-char pos)
	 (re-search-forward namazu-output-title-pattern nil t)
	 (re-search-backward namazu-output-url-pattern nil t)
	 (> (point) pos-title)
	 (setq pos-url (point))
	 (setq pos (point)))
    (goto-char pos)
    (beginning-of-line)
    (and (not pos-url)
	 (re-search-forward namazu-output-url-pattern nil t)
	 (setq pos-url (point)))
    (goto-char pos)
    (cond
     ((and pos-title pos-url)
      (namazu-view))
     ((and pos-url (> namazu-current-page 0))
      (namazu-prev-page))
     ((and pos-title (< namazu-current-page namazu-max-page))
      (namazu-next-page))
     (t (message "nothing to do.")))))

;; emacs $B8~$1$NDj5A(B
(eval-and-compile
  (or (fboundp 'event-buffer)
      (defun event-buffer (event)
	(window-buffer (posn-window (event-start event))))))

(eval-and-compile
  (or (fboundp 'event-point)
      (defun event-point (event)
	(posn-point (event-start event)))))

(defun namazu-view ()
  "$B%]%$%s%H$,0LCV$9$k9`L\$r%V%i%&%:$7$^$9!#(B"
  (interactive)
  (beginning-of-line)
  (if (re-search-forward namazu-output-url-pattern nil t)
      (let ((url (buffer-substring (match-beginning 1) (match-end 1)))
	    (method (and (match-beginning 2)
			 (buffer-substring
			  (match-beginning 2) (match-end 2)))))
	(beginning-of-line)
	(sit-for 0)
	(if (or (and method (not (string= method "file")))
		(string-match namazu-html-pattern url))
	    (funcall browse-url-browser-function url)
	  (and method (setq url (substring url 5)))
	  (and (string-match "^//localhost" url)
	       (setq url (substring url (match-end 0))))
	  (and (string-match "^/\\([a-zA-Z]\\)|\\(/.*\\)$" url)
	       (setq url
		     (concat (substring url (match-beginning 1) (match-end 1))
			     ":"
			     (substring url (match-beginning 2) (match-end 2)))))
	  (let ((ext '("" ".gz" ".Z")) path done)
	    (while (and (null done) ext)
	      (setq path (concat url (car ext)))
	      (and (file-exists-p path)
		   (setq done t)
		   (view-file path))
	      (setq ext (cdr ext))))))))

(defun namazu-exit ()
  "namazu $B$r=*N;$7$^$9!#(B"
  (interactive)
  (if (and (get-buffer namazu-buffer)
	   (buffer-name (get-buffer namazu-buffer)))
      (kill-buffer namazu-buffer)))

(if namazu-mode-map
    nil
  (setq namazu-mode-map (make-keymap))
  (suppress-keymap namazu-mode-map)
  (define-key namazu-mode-map "P"     'namazu-prev-page)
  (define-key namazu-mode-map "p"     'namazu-jump-prev)
  (define-key namazu-mode-map "n"     'namazu-jump-next)
  (define-key namazu-mode-map "N"     'namazu-next-page)

  (define-key namazu-mode-map "\177"  'namazu-jump-prev)
  (define-key namazu-mode-map " "     'namazu-jump-next)

  (define-key namazu-mode-map "\M-\t" 'namazu-jump-prev)
  (define-key namazu-mode-map "\t"    'namazu-jump-next)

  (define-key namazu-mode-map "h"     'namazu-prev-page)
  (define-key namazu-mode-map "k"     'namazu-jump-prev)
  (define-key namazu-mode-map "j"     'namazu-jump-next)
  (define-key namazu-mode-map "l"     'namazu-next-page)

  (define-key namazu-mode-map [left]  'namazu-prev-page)
  (define-key namazu-mode-map [up]    'namazu-jump-prev)
  (define-key namazu-mode-map [down]  'namazu-jump-next)
  (define-key namazu-mode-map [right] 'namazu-next-page)

  (define-key namazu-mode-map "<"     'beginning-of-buffer)
  (define-key namazu-mode-map ">"     'end-of-buffer)
  (define-key namazu-mode-map "\r"    'namazu-view)
  (define-key namazu-mode-map "g"     'namazu-view)
  (define-key namazu-mode-map "r"     'namazu-re-search)
  (define-key namazu-mode-map "q"     'bury-buffer)
  (define-key namazu-mode-map "Q"     'namazu-exit)
  (define-key namazu-mode-map "?"     'describe-mode)

  (if (string-match "XEmacs" emacs-version)
      (define-key namazu-mode-map [(button2)] 'namazu-view-at-mouse)
    (define-key namazu-mode-map [mouse-2] 'namazu-view-at-mouse)))

(if namazu-minibuffer-map
    nil
  (let ((map (copy-keymap minibuffer-local-map)))
    (define-key map "\t" 'namazu-dir-complete)
    (setq namazu-minibuffer-map map)))

(cond
 ((featurep 'font-lock)
  (or (boundp 'font-lock-variable-name-face)
      (setq font-lock-variable-name-face font-lock-type-face))
  (defvar namazu-font-lock-keywords
    (list
     (list namazu-output-title-pattern         1 font-lock-comment-face)
     (list namazu-output-title-pattern         2 font-lock-keyword-face)
     (list namazu-output-title-pattern         3 font-lock-reference-face)
     (list namazu-output-header-pattern        1 font-lock-variable-name-face)
     (list namazu-output-url-pattern           1 font-lock-function-name-face)
     (list namazu-output-url-pattern           3 font-lock-type-face)
     (list namazu-output-current-list-pattern  0 font-lock-comment-face)
     (list namazu-output-pages-pattern         0 font-lock-comment-face))
    "Namazu $B$G$N8!:w7k2L$K$*2=>Q$r$9$k$?$a$N@_Dj$G$9(B. ")
  (if (and (>= (string-to-int emacs-version) 19)
	   (not (featurep 'xemacs)))
      (add-hook
       'namazu-display-hook
       (lambda ()
	 (make-local-variable 'font-lock-defaults)
	 (setq font-lock-defaults
	       '((namazu-font-lock-keywords) t))
	 (font-lock-mode 1)))
    (add-hook 'namazu-display-hook
             (lambda ()
               (setq font-lock-keywords namazu-font-lock-keywords)
               (font-lock-mode 1)))))
 ((featurep 'hilit19)
  (hilit-set-mode-patterns
   'namazu-mode
   (list
    (list namazu-output-title-pattern  1 'red-bold-underline)
    (list namazu-output-title-pattern  2 'purple)
    (list namazu-output-title-pattern  3 'grey40)
    (list namazu-output-header-pattern 1 'DarkGoldenrod)
    (list namazu-output-url-pattern    1 'blue-bold-underline)
    (list namazu-output-url-pattern    3 'grey40)))
  (add-hook 'namazu-display-hook
	    'hilit-rehighlight-buffer-quietly)))

;; end here.
