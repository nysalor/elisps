
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
        Emacs*dialog.Dialog.background: AntiqueWhite
        Emacs*dialog.Dialog.foreground: black
!! emacs21 work around
        Emacs.dialog.Dialog.background: AntiqueWhite
        Emacs.dialog.Dialog.foreground: black

! ボタンの色とボタンの文字の色とボタンの形
! buttons
        Emacs*dialog.Dialog.Label.foreground: black
        Emacs*dialog.Dialog.Label.background: AntiqueWhite
        Emacs*dialog.Dialog.Command.foreground: PaleGreen
        Emacs*dialog.Dialog.Command.background: SlateGray
        Emacs*dialog.Dialog.Command.shapeStyle: Oval
        Emacs*dialog.Dialog.separator.background: AntiqueWhite
! Xaw3d hack...
        Emacs*dialog.Dialog.separator.shadowWidth: 0
!! emacs21 work around
        Emacs.dialog.Dialog.Label.foreground: black
        Emacs.dialog.Dialog.Label.background: AntiqueWhite
        Emacs.dialog.Dialog.Command.foreground: PaleGreen
        Emacs.dialog.Dialog.Command.background: SlateGray
        Emacs.dialog.Dialog.Command.shapeStyle: Oval
        Emacs.dialog.Dialog.separator.background: AntiqueWhite
! Xaw3d hack...
        Emacs.dialog.Dialog.separator.shadowWidth: 0


!メニューバー
!menu bar
! メニューバーの背景と文字の色
        Emacs*menubar.background: SlateGray
        Emacs*menubar.foreground: PaleGreen


!ポップアップメニュー
!popup menu
! ポップアップメニューの背景と文字の色
        Emacs*popup.background: SlateGray
        Emacs*popup.foreground: PaleGreen


!!
!! for XEmacs only
!!
! "check box" or "radio button" color
        Emacs*menubar.selectColor: khaki
        Emacs*popup.selectColor: khaki
! menu/popup highlight color
        Emacs*menubar.highlightForeground: khaki
        Emacs*popup.highlightForeground: khaki
! popup title color
        Emacs*popup.titleForeground: PaleGreen
! menu/popup font
        Emacs*menubar.fontSet: -*-fixed-medium-r-normal--12-*,-*-*-medium-r-normal--12-*,*,fixed
        Emacs*popup.fontSet: -*-fixed-medium-r-normal--12-*,-*-*-medium-r-normal--12-*,*,fixed

!!! color-mate.Xdefaults.add ends here
