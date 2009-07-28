;; OS判定
(cond
 ((string-match "apple-darwin" system-configuration)
  (load "~/elisp/etc/carbon.el")
  )
 ((string-match "linux" system-configuration)
  (load "~/elisp/etc/linux.el")
  )
 ((string-match "freebsd" system-configuration)
  (load "~/elisp/etc/freebsd.el")
  )
 ((string-match "mingw" system-configuration)
  (load "~/elisp/etc/meadow.el")
  )
 )
