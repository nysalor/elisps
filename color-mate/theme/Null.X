
! Null.X : -*- xrdb -*-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!! Color-Mate Ver.10.6
!! by 横田 裕思 (yokota@netlab.is.tsukuba.ac.jp)
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!! Coloring mule/emacs/xemacs to more easier and more fun.
!! mule / emacs / xemacs で、色を使用して見やすい画面にします
!!
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
!! emacs21 work around

! ボタンの色とボタンの文字の色とボタンの形
! buttons
! Xaw3d hack...
        Emacs*dialog.Dialog.separator.shadowWidth: 0
!! emacs21 work around
! Xaw3d hack...
        Emacs.dialog.Dialog.separator.shadowWidth: 0


!メニューバー
!menu bar
! メニューバーの背景と文字の色


!ポップアップメニュー
!popup menu
! ポップアップメニューの背景と文字の色


!!
!! for XEmacs only
!!
! "check box" or "radio button" color
! menu/popup highlight color
! popup title color
! menu/popup font

!!! color-mate.Xdefaults.add ends here
