#!/bin/bash
# This is a script to backup your command history.
# based on - https://gist.github.com/patientzero/39496387237d85c8d29d209d29957f52
HISTTIMEFORMAT="%F %T "
HISTSIZE=10000
HISTFILE=~/.bash_history
set -o history
# yesterday="date -d yesterday +%y/%m/%d"
# history | grep $($yesterday) > ./history_backups/bash_history_$(hostname)_$(date -d "yesterday" +%y-%m-%d).txt
history > ./history_backups/bash_history_$(hostname)_$(date +%y-%m-%d_%H%M).txt