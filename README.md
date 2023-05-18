# bash_history_backup

A Script (and a configuration change to .bashrc) to update the format of the history (to include date and time) and backup the history content to a file.

Table of Contents
=================
- [Overview](#overview)
- [Setup](#setup)
- [Todo List](#todo-list)
- [References](#references)


## Overview
===========

## Download
===========
From GitHub using
```
git clone https://github.com/m2a2/bash_history_backup.git
```

## Setup 
========
## Create Backup directory
- The script assumes the following folder name 'history_backups'
- Note: you can specify another backup folder, if you prefer another folder perform the update in the next step
```
mkdir history_backups
```
 
### (optional) Update "HISTORY_BACKUPS" folder backup_history.sh
- if you prefer a different backup folder update it in the backup_history.sh script


## Edit .bashrc to use same history file over all sessions and add a timestamp to the history

```
vi ~/.bashrc
```


```
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

HISTTIMEFORMAT="%y/%m/%d %T "

# append to history, don't overwrite it
shopt -s histappend

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
```
#### Note: The PROMPT_COMMAND environment variable
Bash provides an environment variable called PROMPT_COMMAND. The contents of this variable are executed as a regular Bash command just before Bash displays a prompt.

## Usage

## Todo List 
- Todo Convert the manual edit (of .bashrc) to a 'setup script'

## References
- https://gist.github.com/patientzero/39496387237d85c8d29d209d29957f52

## Original Script
### Author (patientzero/backup_hist.sh) Note:
- regular backup of bash_history
backup_hist.sh
```
#!/bin/bash
# This is a script to backup your command history.
# How to use:
# 1.) create dir (mkdir ~/history) and place this script as backup_hist.sh in it.
# 2.) add daily cronjob
# to run daily at midnight, add this line to the crontab(crontab -e):
# 0 0 * * * /bin/bash ~/history/backup_hist.sh > /dev/null 2>&1
# 3.) To allow filtering of commands by date, add this to your .bashrc: 
# HISTTIMEFORMAT="%d/%m/%y %T " and also here:
# hist command in non interactive shells by defautl disabled, so enable by adding historyfile
HISTTIMEFORMAT="%d/%m/%y %T "
HISTFILE=~/.bash_history
set -o history
yesterday="date -d yesterday +%d/%m/%y"
history | grep $($yesterday) > /PATH_TO_HISTORY_BACKUP/$(date -d "yesterday" +%d-%m-%y)_history
```
## Comment on the Gist

- Helpful configuration(put in .bashrc) to use same history file over all sessions and add a timestamp to the history:
```
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT="%d/%m/%y %T "

# append to history, don't overwrite it
shopt -s histappend
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
```
