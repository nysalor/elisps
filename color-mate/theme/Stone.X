!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!! Author: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
!! Maintainer: Hiroshi Yokota <yokota@netlab.is.tsukuba.ac.jp>
!! Version: 10.1
!! Keywords: color hilit19 font-lock color-mate
!! Content-Type: text/plain; charset=x-euc-jp

!$Id: Xdefaults.cpp,v 1.3 2002/12/07 17:39:01 elca Exp $

! Xaw3d hack
Emacs*beNiceToColormap: False

!�����������ܥå���
!dialog box
! ������ɥ����طʤ�ʸ���ο�
! background/foreground
        Emacs*dialog.Dialog.background: LightSteelBlue
        Emacs*dialog.Dialog.foreground: black
!! emacs21 work around
        Emacs.dialog.Dialog.background: LightSteelBlue
        Emacs.dialog.Dialog.foreground: black

! �ܥ���ο��ȥܥ����ʸ���ο��ȥܥ���η�
! buttons
        Emacs*dialog.Dialog.Label.foreground: black
        Emacs*dialog.Dialog.Label.background: LightSteelBlue
        Emacs*dialog.Dialog.Command.foreground: MistyRose
        Emacs*dialog.Dialog.Command.background: SteelBlue
        Emacs*dialog.Dialog.Command.shapeStyle: Oval
        Emacs*dialog.Dialog.separator.background: LightSteelBlue
! Xaw3d hack...
        Emacs*dialog.Dialog.separator.shadowWidth: 0
!! emacs21 work around
        Emacs.dialog.Dialog.Label.foreground: black
        Emacs.dialog.Dialog.Label.background: LightSteelBlue
        Emacs.dialog.Dialog.Command.foreground: MistyRose
        Emacs.dialog.Dialog.Command.background: SteelBlue
        Emacs.dialog.Dialog.Command.shapeStyle: Oval
        Emacs.dialog.Dialog.separator.background: LightSteelBlue
! Xaw3d hack...
        Emacs.dialog.Dialog.separator.shadowWidth: 0


!��˥塼�С�
!menu bar
! ��˥塼�С����طʤ�ʸ���ο�
        Emacs*menubar.background: SteelBlue
        Emacs*menubar.foreground: MistyRose


!�ݥåץ��åץ�˥塼
!popup menu
! �ݥåץ��åץ�˥塼���طʤ�ʸ���ο�
        Emacs*popup.background: SteelBlue
        Emacs*popup.foreground: MistyRose


!!
!! for XEmacs only
!!
! "check box" or "radio button" color
        Emacs*menubar.selectColor: LightSalmon1
        Emacs*popup.selectColor: LightSalmon1
! menu/popup highlight color
        Emacs*menubar.highlightForeground: PaleTurquoise
        Emacs*popup.highlightForeground: PaleTurquoise
! popup title color
        Emacs*popup.titleForeground: MistyRose
! menu/popup font

!!! color-mate.Xdefaults.add ends here