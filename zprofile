#!/bin/zsh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx $HOME/X11/.xinitrc-bspwm
fi
