;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-

;; pdf-preview.el : preview text from the buffer as pdf files through PostScript
;; Version 1.0.3
;;
;; Copyright (C) 2004-2005 by T. Hiromatsu <matsuan@users.sourceforge.jp>

;;; Commentary:

;; This package defines fixed-width multilingual fontsets for Carbon Emacs
;; on Mac OS X. Comments, questions and feedback will be sent to an english
;; list <http://lists.sourceforge.jp/mailman/listinfo/macemacsjp-english>
;; of MacEmacs JP project <http://macemacsjp.sourceforge.jp/en/>.
;;----------------------------------------------------------------------
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; The GNU General Public License can be gotten from
;; the Free Software Foundation, Inc.,
;;     59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
;;     http://www.gnu.org/licenses/gpl.html
;;
;;----------------------------------------------------------------------
;;      $BK\%W%m%0%i%`$O%U%j!<!&%=%U%H%&%'%"$G$9!#(B
;;      $B$"$J$?$O!"(BFree Software Foundation$B$,8xI=$7$?(BGNU $B0lHL8xM-;HMQ5vBz$N(B
;;      $B!V%P!<%8%g%s#2!W0?$$$O$=$l0J9_$N3F%P!<%8%g%s$NCf$+$i$$$:$l$+$rA*Br$7!"(B
;;      $B$=$N%P!<%8%g%s$,Dj$a$k>r9`$K=>$C$FK\%W%m%0%i%`$r(B
;;      $B:FHRI[$^$?$OJQ99$9$k$3$H$,$G$-$^$9!#(B
;;
;;      $BK\%W%m%0%i%`$OM-MQ$H$O;W$$$^$9$,!"HRI[$K$"$?$C$F$O!"(B
;;      $B;T>l@-5Z$SFCDjL\E*E,9g@-$K$D$$$F$N0EL[$NJ]>Z$r4^$a$F!"(B
;;      $B$$$+$J$kJ]>Z$b9T$J$$$^$;$s!#(B
;;      $B>\:Y$K$D$$$F$O(BGNU $B0lHL8xM-;HMQ5vBz=q$r$*FI$_$/$@$5$$!#(B
;;
;;      GNU$B0lHL8xM-;HMQ5vBz$O!"!!(B
;;      Free Software Foundation,
;;         59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
;;         http://www.gnu.org/licenses/gpl.html
;;      $B$+$iF~<j2DG=$G$9!#(B
;;
;;----------------------------------------------------------------------
;; usage1:
;;     M-x pdf-preview-buffer
;;
;; usage2:
;;     C-u M-x pdf-preview-buffer
;;     You can set some factors interactively shown in follows.
;;         ps-paper-type (Paper Size)
;;         ps-landscape-mode (Paper Direction)
;;         ps-print-header (Title on/off)
;;         pdf-preview-font-rescale-factor (Font Rescale Factor)
;;         ps-line-spacing (Linse Spacing)
;;
;; usage3:
;;     (pdf-preview-buffer arg-list) 
;;         arg-list contains
;;             (ps-paper-type ps-landscape-mode
;;                            ps-print-header pdf-preview-font-rescale-factor).
;;
;;     example ; (pdf-preview-buffer '(a3 t nil 8 6))
;;
;; 1. $B5!G=(B
;;     1) Emacs $B$N(B $B%P%C%U%!!<$N%F%-%9%H$r!"(BPostScript format $B$r7PM3$7$F!"(B
;;        pdf $B$KJQ49$7!"E,Ev$J%S%e%o!<$r;H$C$FI=<($7$^$9!#(B
;;        Default $B$G$O!"(BGhostScript (ps2pdf13) $B$r;H$C$F$$$^$9!#(B
;;     2) $BF|K\8l%U%)%s%H$H%"%9%-!<%U%)%s%H$NI}$r(B 2:1 $B$K@_Dj$7$^$9!#(B
;;     3) $B%W%l%U%#%C%/%9IU$-$G8F$S=P$9$H!"4v$D$+$N9`L\$rBPOCE*$K@_Dj$G$-$^$9!#(B
;;
;; 2. $B4X?t(B
;;     $B<g$J4X?t$O!"0J2<$N(B8$B8D!#3F!9$N:9$O!"(Bps-print(spool$B7O$N4X?t$HF1$8(B
;;
;;         pdf-preview-spool-buffer
;;         pdf-preview-spool-buffer-with-faces
;;         pdf-preview-spool-region
;;         pdf-preview-spool-region-with-faces
;;     $B>e5-(B4$B4X?t$O!"(Binteractive$B$KJQ?t$r<hF@$7$?>e!"(Bps-spool-* $B$G(BPostScript
;;     $B%U%)!<%^%C%H$N(Bbuffer(*PostScript)$B$r:n@.$7$^$9!#(B
;;
;;         pdf-preview-buffer
;;         pdf-preview-buffer-with-faces
;;         pdf-preview-region
;;         pdf-preview-region-with-faces
;;     $B>e5-(B4$B4X?t$O!"(Bps-preview-spool-* $B$G(Bspool$B$7$?!"(BPostScript$B%U%)!<%^%C%H$KBP$7!"(B
;;         $B4X?t(B pdf-preview-rescale-mule-font
;;     $B$r;H$C$F!"(BMule Font $B$N$_(B 1.2 $BG\(B($B=j0bEvI}$K$9$k0Y(B)$B$7$?8e!"(B
;;         $B4X?t(B pdf-preview-do-despool
;;     $B$G!"(Bpdf$B%U%!%$%k$r:n@.$7$^$9!#(B
;;
;; 3. $B;H$$J}(B
;;
;;     1) M-x pdf-preview-buffer
;;         $B=i4|@_DjCM$G!"(Bps$B!"(Bpdf $B%U%!%$%k$,:n$i$l$^$9!#(B
;;
;;     2) C-u M-x pdf-preview-buffer
;;         $B2<5-9`L\$r!"BPOCE*$K@_Dj$G$-$^$9!#(B
;;                 $B;f%5%$%:(B (ps-paper-type)
;;                     'b5, 'b4, 'a4small, 'ledger, 'lettersmall, 'legal,
;;                     'letter, 'a3, 'a4,
;;                 $B;f$N8~$-(B (ps-landscape-mode)
;;                     'Landscape, 'Portrait,
;;                 $B%X%C%@!<$NM-L5(B (ps-preint-header)
;;                     't, 'nil,
;;                 $B%U%)%s%H%5%$%:$N3HBgHfN((B (pdf-preview-font-rexcale-factor)
;; $B!!!!(B                $BG$0U$N@5$N?t(B
;;                 $B9T4V3V(B (ps-line-spacing)
;;                     $BG$0U$N@5$N?t(B
;;
;;     3) (pdf-preview-buffer arg-list)
;;         $B0z?tIU$-$G4X?t8F$S=P$7!#0z?t$O!">e5-$N(B5$B9`L\$r4^$s$@%j%9%H$G$"$k;v!#(B
;;         $BNc(B ; (pdf-preview-buffer '(a3 t nil 8 10))
;;                 a3$B!"2#CV$-$G!"%X%C%@!<L5$7!"%U%)%s%H%5%$%:$OI8=`$N(B8$BG\(B
;;                 $B9T4V3V$O(B 10/72 inch
;;
;; 4. $B@_Dj2DG=$JJQ?t(B
;;     1) pdf-preview-ps2pdf-command
;;             ps2pdf $B$K;H$&%3%^%s%I(B
;;             $B%G%U%)%k%H(B : "ps2pdf13"
;;    
;;             * $B;d$O!"(Bcjkps2pdf.pl $B$r;H$C$?$j$7$F$$$k$N$G!"(B
;;                 "perl ~/bin/cjkps2pdf.pl --keepmetrics"
;;               $B$K$7$F$$$^$9!#(B
;;    
;;     2) pdf-preview-ps2pdf-paper-size-option
;;             pdf-preview-ps2pdf-command $B$G!";f%5%$%:$N;XDj$K;H$&%*%W%7%g%s(B
;;             $B%G%U%)%k%H(B : "-sPAPERSIZE="
;;    
;;             * $B;d$O!"(Bcjkps2pdf.pl $B$r;H$C$?$j$7$F$$$k$N$G!"(B
;;                 "--papersize "
;;               $B$K$7$F$$$^$9!#(B
;;    
;;     3) pdf-preview-preview-command
;;             $B%W%l%S%e%o!<$r5/F0$9$k%3%^%s%I(B
;;             $B%G%U%)%k%H(B :
;;                  windows + CMD.EXE --- "start"
;;                  windows + cygwin  --- "cygstart"
;;                  carbon-emacs      --- "open"
;;                  others            --- "xpdf"
;;    
;;     4) pdf-preview-font-rescale-factor
;;             $B%U%)%s%H$N3HBgN((B
;;             $B%G%U%)%k%H(B : 1.0
;;    
;;             * $B;d$O!"(B1.1 $B$K$7$F$^$9!#(B
;;    
;; 5. $BMzNr(B
;;     1.0.3 2005-05-30 bug fix
;;     1.0.2 2005-05-24 bug fix
;;                      $B%W%l%S%e%o!<%3%^%s%I$N%G%U%)%k%HCM$r(BOS$BKh$K@_Dj(B
;;     1.0.1 2005-05-23 .emacs $B$N@_Dj$,$J$/$F$bF0$/$h$&$KJQ99(B
;;                      $B;f%5%$%:(BA4, $B9T4V3V(B6$B$r%G%U%)%k%H$K(B
;;                      $B9T4V3V$bBPOCE*$K@_Dj$G$-$k$h$&$K(B
;;     1.0.0 2005-05-20 $B%j%j!<%9(B

;;; code

;;;
;;; initialize section
;;;

(if (not (boundp 'ps-paper-type)) (setq ps-paper-type 'a4))
(if (not (boundp 'ps-line-spacing)) (setq ps-line-spacing 6))

(require 'ps-print)

(require 'ps-mule)
(defalias 'ps-mule-header-string-charsets 'ignore)

(defvar pdf-preview-ps2pdf-command "ps2pdf13")

(defvar pdf-preview-ps2pdf-paper-size-option "-sPAPERSIZE=")

(defvar pdf-preview-preview-command
        (cond
         ((featurep 'dos-w32)
          (if (string-match "\\(cmdproxy\.exe$\\|cmd\.exe$\\)" shell-file-name)
              "start"
            "cygstart"))
         ((featurep 'mac-carbon) "open")
         ("xpdf")))

(defvar pdf-preview-ignored-papersize-list '("tabloid" "statement" "executive"))

(defvar pdf-preview-font-rescale-factor 1.0)

(defun pdf-preview-get-paper-size (paper-type)
  (let (size)
    (downcase
     (nth 3
          (if (setq size (assoc paper-type ps-page-dimensions-database))
              size
            (assoc ps-paper-type ps-page-dimensions-database))))))

(defvar pdf-preview-papersize-list
      (let ((papersize-list)
            (papersize-database ps-page-dimensions-database)
            (ignore-paper pdf-preview-ignored-papersize-list))
        (while papersize-database
          (setq papersize-list
                (cons
                 (cons
                  (car (car papersize-database))
                  (pdf-preview-get-paper-size (car (car papersize-database))))
                 papersize-list))
          (setq papersize-database (cdr papersize-database)))
        (while ignore-paper
          (setq papersize-list
                (delete (rassoc (car ignore-paper) papersize-list) papersize-list))
          (setq ignore-paper (cdr ignore-paper)))
        (eval 'papersize-list)))

;;;
;;; Function section
;;;

(defun pdf-preview-do-despool (&optional papersize)
  "Preview PostScript spool via PDF"
  (interactive (list (pdf-preview-papersize current-prefix-arg)))
  (let*
      ((ps-temp-file
        (concat (make-temp-name (concat temporary-file-directory "pdf")) ".ps"))
       (pdf-temp-file
        (concat (file-name-sans-extension ps-temp-file) ".pdf"))
       (ps2pdf-command
        (format "%s %s%s %s %s"
                pdf-preview-ps2pdf-command
                pdf-preview-ps2pdf-paper-size-option
                (cdr
                 (assoc
                  (if papersize
                      papersize
                    (car (assoc ps-paper-type pdf-preview-papersize-list)))
                  pdf-preview-papersize-list))
                ps-temp-file
                pdf-temp-file))
;;        (rm-command (format "rm %s" ps-temp-file))
       (preview-command
        (format "%s %s" pdf-preview-preview-command pdf-temp-file)))
    (ps-do-despool ps-temp-file)
    (shell-command (concat ps2pdf-command " && " preview-command))))

(defun pdf-preview-rescale-mule-font (&optional arg)
  "Rescale mule fonts for keeping in line with ascii"
  (interactive)
  (save-excursion
    (set-buffer "*PostScript*")
    (goto-char (point-min))
    (let (s end)
      (while
          (re-search-forward
           "/f[89][29]-[0-2] \\([0-9]+\.[0-9][0-9][0-9][0-9][0-9][0-9]\\) /\\(Ryumin-Light\\|GothicBBB-Medium\\)\\(-H\\|\\.Katakana\\|\\.Hanakaku\\) \\(DefFontMule\\)"
           nil t)
        (progn
          (goto-char (match-end 4))
          (setq end (point-marker)) 
          (goto-char (match-beginning 1))
          (setq s
                (format "%.6f"
                        (*
                         (string-to-number
                          (buffer-substring (match-beginning 1) (match-end 1)))
                         1.2)))
          (delete-region (match-beginning 1) (match-end 1))
          (insert s)
          (goto-char end))
        )))) 

(defun pdf-preview-spool-buffer (&optional arg-list)
  "Generate and spool a PostScript image of the buffer for pdf preview."
  (interactive (list (pdf-preview-factor current-prefix-arg)))
  (pdf-preview-spool 'ps-spool-buffer arg-list))

(defun pdf-preview-buffer (&optional arg-list)
  "Generate and preview a pdf file of the buffer via PostScript."
  (interactive (list (pdf-preview-factor current-prefix-arg)))
  (pdf-preview-spool-buffer arg-list)
  (save-excursion (pdf-preview-rescale-mule-font))
  (pdf-preview-do-despool (car arg-list)))
  
(defun pdf-preview-spool-buffer-with-faces (&optional arg-list)
  "Generate and spool a PostScript image of the buffer with faces for pdf preview."
  (interactive (list (pdf-preview-factor current-prefix-arg)))
  (pdf-preview-spool 'ps-spool-buffer-with-faces arg-list))

(defun pdf-preview-buffer-with-faces (&optional arg-list)
  "Generate and preview a pdf file of the buffer with faces via PostScript."
  (interactive (list (pdf-preview-factor current-prefix-arg)))
  (pdf-preview-spool-buffer-with-faces arg-list)
  (save-excursion (pdf-preview-rescale-mule-font))
  (pdf-preview-do-despool (car arg-list)))
  
(defun pdf-preview-spool-region (&optional arg-list)
  "Generate and spool a PostScript image of the region for pdf preview."
  (interactive (list (pdf-preview-factor current-prefix-arg)))
  (pdf-preview-spool 'ps-spool-region arg-list))

(defun pdf-preview-region (&optional arg-list)
  "Generate and preview a pdf file of the region via PostScript."
  (interactive (list (pdf-preview-factor current-prefix-arg)))
  (pdf-preview-spool-region arg-list)
  (save-excursion (pdf-preview-rescale-mule-font))
  (pdf-preview-do-despool (car arg-list)))
  
(defun pdf-preview-spool-region-with-faces (&optional arg-list)
  "Generate and spool a PostScript image of the region with faces for pdf preview."
  (interactive (list (pdf-preview-factor current-prefix-arg)))
  (pdf-preview-spool 'ps-spool-region-with-faces arg-list))

(defun pdf-preview-region-with-faces (&optional arg-list)
  "Generate and preview a pdf file of the region with faces via PostScript."
  (interactive (list (pdf-preview-factor current-prefix-arg)))
  (pdf-preview-spool-region-with-faces arg-list)
  (save-excursion (pdf-preview-rescale-mule-font))
  (pdf-preview-do-despool (car arg-list)))

(defun pdf-preview-papersize (prefix-arg)
  (and prefix-arg
       (or (numberp prefix-arg) (listp prefix-arg))
       (let*
           ((prompt (format "Papersize: "))
            (completion-ignore-case t)
            (default-paper (cdr (assoc ps-paper-type pdf-preview-papersize-list))))
         (car
          (rassoc
           (completing-read
            prompt
            (mapcar (lambda (list) (cdr list)) pdf-preview-papersize-list)
            nil t default-paper)
           pdf-preview-papersize-list)))))

(defun pdf-preview-factor (prefix-arg)
  (and prefix-arg
       (or (numberp prefix-arg) (listp prefix-arg))
       (list
        (let*
            ((prompt (format "Papersize : "))
             (completion-ignore-case t)
             (default-paper (cdr (assoc ps-paper-type pdf-preview-papersize-list))))
          (car
           (rassoc
            (completing-read
             prompt
             (mapcar (lambda (list) (cdr list)) pdf-preview-papersize-list)
             nil t default-paper)
            pdf-preview-papersize-list)))
        (let* ((prompt (format "Direction : "))
               (completion-ignore-case t)
               (default-direction (if ps-landscape-mode "Landscape" "Portrait")))
          (cdr
           (assoc
            (completing-read
             prompt '("Landscape" "Portrait") nil t default-direction)
            '(("Landscape" . t) ("Portrait" . nil)))))
        (let* ((prompt (format "Title : "))
               (completion-ignore-case t)
               (default (if ps-print-header "t" "nil")))
          (cdr
           (assoc (completing-read prompt '("t" "nil") nil t default)
                  '(("t" . t) ("nil" . nil)))))
        (let* ((prompt (format "Font Rescale Factor : "))
               (factor)
               (default (number-to-string pdf-preview-font-rescale-factor)))
          (while (not (numberp (setq factor (read-minibuffer prompt default)))))
          (eval factor))
        (let* ((prompt (format "Line Spacing : "))
               (spacing)
               (default (number-to-string ps-line-spacing)))
          (while (not (numberp (setq spacing (read-minibuffer prompt default)))))
          (eval spacing))
        )))

(defun pdf-preview-multiple-cons_cell (cons_cell factor)
  (if (consp cons_cell)
      (cons (* factor (car cons_cell)) (* factor (cdr cons_cell)))
    (* cons_cell factor)))

(defun pdf-preview-spool (pdf-preview-spool-function arg-list)
  (save-excursion
    (setq arg-list
          (if arg-list arg-list
            (list ps-paper-type ps-landscape-mode ps-print-header
                  pdf-preview-font-rescale-factor ps-line-spacing)))
    (let*
        ((ps-paper-type (nth 0 arg-list))
         (ps-landscape-mode (nth 1 arg-list))
         (ps-print-header (nth 2 arg-list))
         (factor (nth 3 arg-list))
         (ps-font-size (pdf-preview-multiple-cons_cell ps-font-size factor))
         (ps-header-font-size
          (pdf-preview-multiple-cons_cell ps-header-font-size factor))
         (ps-header-title-font-size
          (pdf-preview-multiple-cons_cell ps-header-title-font-size factor))
         (ps-footer-font-size
          (pdf-preview-multiple-cons_cell ps-footer-font-size factor))
         (ps-line-number-font-size
          (pdf-preview-multiple-cons_cell ps-line-number-font-size factor))
         (ps-line-spacing (nth 4 arg-list))
         (ps-multibyte-buffer 'non-latin-printer))
      (funcall pdf-preview-spool-function))
    ))

(provide 'pdf-preview)

;;; pdf-preview.el ends here