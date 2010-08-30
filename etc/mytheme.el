;; color-mateÀßÄê

(require 'assoc)

(cond
 ((string-match "apple-darwin" system-configuration)
  (load "~/elisp/etc/mycolor-cocoa.el")
  )
 ((string-match "linux" system-configuration)
  (load "~/elisp/etc/mycolor.el")
  )
 ((string-match "freebsd" system-configuration)
  (load "~/elisp/etc/mycolor.el")
  )
 ((string-match "mingw" system-configuration)
  (load "~/elisp/etc/mycolor.el")
  )
 )
