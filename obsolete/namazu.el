;; -*- Mode: Emacs-Lisp -*-
;;
;; Mule 上で Namazu を利用した検索を行うための elisp です。
;;
;;  $Id: namazu.el,v 1.1 1999-05-10 10:00:20+09 shirai Exp $

(defconst namazu-version "namazu.el 1.00")

;; Namazu による検索結果が指すドキュメント(類)が
;; ローカルディスク上にある場合にはそれを直接参照し、
;; ネットワーク上にある場合には brouse-url の機能を用いて
;; それを参照することができます。
;;
;; ローカルディスク上のドキュメント(類)が圧縮してある場合、
;; jka-compr の機能を用いてそれを展開しようとします。
;;
;; Namazu モードではローカルディスクにないファイルへの
;; アクセスについては brouse-url に一任しています。
;; そういったわけですので browse-url-browser-function に
;; 適切な設定をしておかないと、外部にあるリソースを
;; 参照することはできません。たとえばこんな設定をします:
;;
;;  (autoload 'namazu "namazu" nil t)
;;  (setq browse-url-browser-function 'browse-url-netscape)
;;
;; font-lock や hilit19 がロードしてあれば
;; 検索結果は(いくらか)華やかに表示されるでしょう。
;;
;; 用意する必要があるかも知れないもの:
;; 前述の通り browse-url が必要ですが、19.28 ベースの Mule には
;; これが含まれていないようです。以下の URL などから入手してください。
;; また、お使いの Mule に添付されている browse-url は
;; 古いバージョンのものかもしれませんので
;; 最新バージョンをチェックしてみるのもよいでしょう。
;;
;;   <URL:http://wombat.doc.ic.ac.uk/emacs/browse-url.el>
;;
;; 19.28 ベースの Mule では 930 行目あたりにある
;; (require 'term) を (require 'terminal) に変更する必要があります。
;;
;; browse-url-lynx-xterm で lynx を使ってブラウズする場合には
;; (setq browse-url-xterm-program "kterm") のような
;; 設定を追加しておいた方がよいと思います。
;;
;; 検索方法:
;; 上記の設定を終えたら M-x namazu とタイプしてください。
;; すると検索のキー(条件式)を聞いてきますので namazu とか
;; ruby & perl といった検索キーを入力します。
;; 入力を終えると Namazu が起動され、
;; 検索結果を表示するバッファが作られます。
;; このバッファ内では以下のキー操作が定義されています。
;;
;;             前ページ    前項     次項    次ページ
;;   標準(1)      P         p        n         N
;;   標準(2)              [BkSp]  [Space]
;;   標準(3)              M-[Tab]  [Tab]
;;   vi 風        h         k        j         l
;;   カーソル   [left]     [up]    [down]   [right]
;;
;;   ページの先頭へ        <
;;   ページの末尾へ        >
;;   ドキュメントの参照    g または [Enter]
;;   条件を追加して再検索  r
;;   検索結果の消去        q
;;   namazu 終了           Q
;;   ヘルプ表示            ?
;;
;; また、mouse のまんなかのボタンを押すと、押した位置によって、
;; "ドキュメントの参照"、"前ページ"、 "次ページ" のどれかの動作を行な
;; います。
;;
;; デフォルト以外のインデックス(NMZ.*)を使用したい場合は、
;; C-u M-x namazu とタイプすることでインデックスの置いてあるディレクト
;; リを指定することも出来ます。また、個々のディレクトリに対して別名を
;; 定義することも可能です。設定例など詳しいことは namazu-dir-alist の
;; 説明を参照してください :-P。
;;
;; 最新版の入手について:
;; namazu.el の最新版は namazu に付属するものや、namazu ML などで
;; 入手可能です.
;;
;; 配布条件など:
;; これは まつもと ゆきひろ <matz@netlab.co.jp> さんが作成し、
;; 同氏と 馬場 肇 <baba@kusastro.kyoto-u.ac.jp> さん、
;; 高林 哲 <ccsatoru@vega.aichi-u.ac.jp> さん、
;; Toshiaki Tanaka <toshiaki@ksj1.kansai-sc.toshiba.co.jp>さん、
;; 奥西 藤和 <fuji0924@mbox.kyoto-inet.or.jp> さんのご協力の下で
;; やまだ あきら <akira@linux.or.jp> さんが改造を加えたものを、
;; 土屋 雅稔 <tsuchiya@pine.kuee.kyoto-u.ac.jp> さん、
;; 堀口恭太郎 <kyota@po.ntts.co.jp> さん達の叱咤激励により
;; 白井秀行 <shirai@rdmg.mgcs.mei.co.jp> が改造しているものです。
;; いかなる形での利用・再配布についても権利の類は一切主張しません。
;; 自由に扱ってもらって構いません。
;;
;; お約束:
;; これは何らかの保証を伴うものではありません。
;; 提供される機能を使った結果、利用者が直接的あるいは間接的に
;; 損害を被ったとしても、それは作者達の関知するところではありません。
;; あくまで at your own risk でご利用下さい。
;;

(defvar namazu-command "namazu"
  "*Namazu の検索用プログラム名です。
通常は namazu などでしょうが、そうではない場合や
PATH が通っていない場合には適当なプログラム名を指定します。")

(defvar namazu-argument "-H"
  "*Namazu の検索用プログラムを起動する際に指定する引数です。")

(defvar namazu-search-num 30
  "*Namazu の検索結果を一度に表示する件数です。")

(defvar namazu-default-dir nil
  "*Namazu が参照するインデックスの置いてあるディレクトリ名です。
特に指定しなければデフォルトのインデックスを参照します。
複数のインデックスを指定する場合にはそれぞれを空白で区切ってください。")

(defvar namazu-dir-alist nil
  "*インデックスが置いてあるディレクトリに
シンボリックな名前をつけるための alist です。
  '((\"Namazu\" . \"/usr/doc/namazu/index /var/lib/namazu/index\")
    (\"Ruby\" . \"/usr/doc/ruby/namazu\"))
などのように設定しておくと、個々のインデックスファイルのある
ディレクトリ名を指定する代わりに Namazu や Ruby といった
いわば別名を指定することができます。
複数のインデックスを指定する場合にはそれぞれを空白で区切ってください。")

(defvar namazu-always-query-index-directory nil
  "*nil 以外の値を設定すると、数値引数がないときに
インデックスファイルを指定でき、数値引数があるときに
デフォルトのインデックスを参照するようになります。
常にインデックスファイルを指定して検索を行いたい
場合などに便利かもしれません。")

(defvar namazu-auto-turn-page nil
  "*nil 以外の値を設定すると、自動的にページめくりをします。")

(defvar namazu-mode-hook nil
  "*Namazu モードを作成するタイミングで呼ばれる hook です。")

(defvar namazu-display-hook nil
  "*Namazu の出力を表示するときに呼ばれる hook です。")

(defvar namazu-html-pattern "[^/]+\\.html?"
  "*ローカルディスク上にあっても browse-url を使って
閲覧するファイル名のパターンです。")

(defvar namazu-cs
  (if (> emacs-major-version 19) 'euc-jp '*euc-japan*)
  "*OS の内部コードと異なり、かつ動かない場合に変更してみてください。")

;;
;; ここから先をいじって、素敵になったら教えてくださいね。
;;

(defvar namazu-fill-prefix "\t")
(defvar namazu-header-prefix "   ")
(defvar namazu-history nil)
(defvar namazu-mode-map nil)
(defvar namazu-minibuffer-map nil)
(defvar namazu-buffer "*namazu*")
(defvar namazu-last-dir nil
  "現在の検索で参照しているインデックスの在処")
(defvar namazu-current-page 0
  "閲覧中の検索結果のページ番号")
(defvar namazu-max-page 0
  "現在の検索結果の最大ページ番号")
(defvar namazu-output-title-pattern
  "^\\([0-9]+\\.\\) \\(.*\\) \\(([^)]*)\\)$"
  "検索結果の中のドキュメントのタイトルを示す行のパターン")
(defvar namazu-output-header-pattern
  (format "^%s\\([^:]+:.*\\)$" namazu-header-prefix)
  "検索結果の中の From、Date ヘッダを示すパターン")
(defvar namazu-output-url-pattern
  "^\\(/.*\\|\\([a-z]+\\):[^ ]*\\) \\(size ([^)]*)\\)"
  "検索結果の中のドキュメントの在処(URL)を示す行のパターン")
(defvar namazu-output-current-list-pattern
  "^Current List: [0-9]+ 〜 [0-9]+$"
  "検索結果の中のどの部分を閲覧中かを示す行のパターン")
(defvar namazu-output-pages-pattern
  "^Page: \\(\\[[0-9]+\\]\\)*\\[\\([0-9]+\\)\\]$"
  "検索結果のページ数を示す行のパターン")

(require 'browse-url)
(require 'jka-compr)
(provide 'namazu)

(defun namazu (&optional page-num namazu-dir key)
  "namazu-command を起動して検索を行います。"
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
  "namazu-command での検索結果を整形します。"
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
      ;; 余分な空行をとっぱらうための努力
      (re-search-forward "^$" nil t)
      (while (looking-at "^$")
	(delete-char 1)
	(forward-line 1))
      )))

(defun namazu-escape-key (key)
  "検索式中の \\ と ' をエスケープします。"
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
  "現在の検索キーを変更した上で再検索します。"
  (interactive
   (list
    (read-from-minibuffer "Enter Keyword: "
			  (car namazu-history) nil nil 'namazu-history)))
  (namazu 0 namazu-last-dir key))

(defun namazu-next-page ()
  "次のページの検索結果へ移動します。"
  (interactive)
  (if (< namazu-current-page namazu-max-page)
      (namazu (+ 1 namazu-current-page) namazu-last-dir (car namazu-history))
    t))

(defun namazu-prev-page ()
  "前のページの検索結果へ移動します。"
  (interactive)
  (if (> namazu-current-page 0)
      (namazu (+ -1 namazu-current-page) namazu-last-dir (car namazu-history))
    t))

(defun namazu-dir-complete ()
  "ディレクトリ名または namazu-dir-alist からの
文字列補完を行います。"
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
	  ;; HOME からの相対パスの処理
	  (if (and (string= dir "")
		   (string-match  "^~" file))
	      (progn (setq dir file) (setq file "")))
	  ;; ディレクトリの場合の処理
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
	  ;; Completion-List の作成
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
  "ディレクトリ中の \"\\\" と \" \" をエスケープします。"
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
  "ディレクトリ中の \"\\\" と \" \" をエスケープします。"
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
  "インデックスディレクトリ文字列を分割し、\"~\" などを展開します。"
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
  "インデックスディレクトリ文字列中のエイリアスを展開します。"
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
  "Namazu の検索結果を閲覧するためのモードです。

binding          key
-------          ---
前のページ       P           / h / [left]
前の項目         p / [BkSp]  / k / [up]    / M-[Tab]
後の項目         n / [Space] / j / [down]  / [Tab]
後のページ       N           / l / [right]

ページの先頭へ   <
ページの末尾へ   >
文書を参照       g / [Enter]
再検索           r / f
検索結果消去     q
Namazu 終了      Q
ヘルプ表示       ?

mouse の真ん中のボタンを押すと、押した位置によって、\"文章を参照\"、
\"前のページ\"、\"後ろのページ\" のどれかの処理を実行します。
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
  "検索結果の次の項目へ移動します。"
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
  "検索結果の一つ前の項目へ移動します。"
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
  "mouse を使ってブラウズしたりページを移動したりします。"
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

;; emacs 向けの定義
(eval-and-compile
  (or (fboundp 'event-buffer)
      (defun event-buffer (event)
	(window-buffer (posn-window (event-start event))))))

(eval-and-compile
  (or (fboundp 'event-point)
      (defun event-point (event)
	(posn-point (event-start event)))))

(defun namazu-view ()
  "ポイントが位置する項目をブラウズします。"
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
  "namazu を終了します。"
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
    "Namazu での検索結果にお化粧をするための設定です. ")
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
