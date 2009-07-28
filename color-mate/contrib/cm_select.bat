@echo off
rem
rem Theme Selecter for Color-Mate batch file part
rem
rem Usage:
rem  1. First, edit your .emacs
rem      change this line
rem           (setq color-mate:theme-file "SunnyDay")
rem      to
rem           (load "cm_select")
rem
rem  2. Use this script
rem
rem    cm_select.bat [ThemeName] [emacs name [emacs options...]]
rem
rem    ex)
rem      cm_select.bat Wine
rem      cm_select.bat GreenTea xemacs
rem      cm_select.bat MyTheme emacs -g 80x25

rem $Id: cm_select.bat,v 1.2 2002/05/11 02:32:13 elca Exp $

if not x%1==x goto :if_theme
	set CM_THEME=SunnyDay
	goto :end_theme
:if_theme
	set CM_THEME=%1
	shift
:end_theme

if not x%1==x goto :if_emacs
	set EMACS=mule
	goto :end_emacs
:if_emacs
	set EMACS=%1
	shift
:end_emacs

%EMACS% %1 %2 %3 %4 %5 %6 %7 %8 %9

rem cm_select.bat ends here
