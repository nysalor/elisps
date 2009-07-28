#!/bin/sh
#
# Theme Selecter for Color-Mate shell script part
#
#  "cm_select.sh" is X resource loader. The resource file exists
# ~/elisp/color-mate/theme. If you change this path name when install,
# edit this file.
#
# Usage:
#  1. First, edit your .emacs
#      change this line
#           (setq color-mate:theme-file "SunnyDay")
#      to
#           (load "cm_select")
#
#  2. Use this script
#
#    cm_select.sh [ThemeName] [emacs name [emacs options...]]
#
#    ex)
#      cm_select.sh Wine
#      cm_select.sh GreenTea xemacs
#      cm_select.sh MyTheme emacs -g 80x25

#$Id: cm_select.sh.in,v 1.2 2002/05/11 02:32:13 elca Exp $

CM_THEME=${1-SunnyDay}
CM_EMACS=${2-/usr/bin/emacs}
if [ $# -ge 3 ]
then
    shift ; shift
    CM_OPTION=$*
fi

# edit this path name
xrdb /usr/share/emacs/21.2/site-lisp/color-mate/theme/${CM_THEME}.X

export CM_THEME

exec ${CM_EMACS} ${CM_OPTION}

# cm_select.sh ends here
