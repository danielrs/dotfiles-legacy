#! /bin/bash

FIFO=/tmp/volume-fifo

get_status() {
  local pulse=$(pulseaudio-ctl full-status)
  local level=$(echo $pulse | cut -d ' ' -f1)
  local is_muted=$(echo $pulse | cut -d ' ' -f2)
  printf 'VOL%s:%s\n' "$level" "$is_muted"
}

. ~/.dotfiles/panel/scripts/subscribable.sh