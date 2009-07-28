!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!! Author: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
!! Maintainer: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
!! Version: 10.1
!! Keywords: color hilit19 font-lock color-mate
!! Content-Type: text/plain; charset=x-euc-jp

!$Id: Xdefaults.cpp,v 1.3 2002/12/07 17:39:01 elca Exp $

! Xaw3d hack
Emacs*beNiceToColormap: False

!ダイアログボックス
!dialog box
! ウィンドウの背景と文字の色
! background/foreground
        Emacs*dialog.Dialog.background: rgbi:0.01/0.001/0.05
        Emacs*dialog.Dialog.foreground: white
!! emacs21 work around
        Emacs.dialog.Dialog.background: rgbi:0.01/0.001/0.05
        Emacs.dialog.Dialog.foreground: white

! ボタンの色とボタンの文字の色とボタンの形
! buttons
        Emacs*dialog.Dialog.Label.foreground: white
        Emacs*dialog.Dialog.Label.background: rgbi:0.01/0.001/0.05
        Emacs*dialog.Dialog.Command.foreground: plum1
        Emacs*dialog.Dialog.Command.background: purple4
        Emacs*dialog.Dialog.Command.shapeStyle: Oval
        Emacs*dialog.Dialog.separator.background: rgbi:0.01/0.001/0.05
! Xaw3d hack...
        Emacs*dialog.Dialog.separator.shadowWidth: 0
!! emacs21 work around
        Emacs.dialog.Dialog.Label.foreground: white
        Emacs.dialog.Dialog.Label.background: rgbi:0.01/0.001/0.05
        Emacs.dialog.Dialog.Command.foreground: plum1
        Emacs.dialog.Dialog.Command.background: purple4
        Emacs.dialog.Dialog.Command.shapeStyle: Oval
        Emacs.dialog.Dialog.separator.background: rgbi:0.01/0.001/0.05
! Xaw3d hack...
        Emacs.dialog.Dialog.separator.shadowWidth: 0


!メニューバー
!menu bar
! メニューバーの背景と文字の色
        Emacs*menubar.background: purple4
        Emacs*menubar.foreground: plum1


!ポップアップメニュー
!popup menu
! ポップアップメニューの背景と文字の色
        Emacs*popup.background: purple4
        Emacs*popup.foreground: plum1


!!
!! for XEmacs only
!!
! "check box" or "radio button" color
        Emacs*menubar.selectColor: palegreen
        Emacs*popup.selectColor: palegreen
! menu/popup highlight color
        Emacs*menubar.highlightForeground: khaki
        Emacs*popup.highlightForeground: khaki
! popup title color
        Emacs*popup.titleForeground: plum1
! menu/popup font

!!! color-mate.Xdefaults.add ends here
