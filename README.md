# bash_history_backup

A Script to backup the history content to a file.

Table of Contents
=================
- [Overview](#overview)
- [Setup](#setup)
- [Todo List](#todo-list)
- [References](#references)
- [Manual setup](#manual-setup)


## Overview
A Script (and a configuration change to .bashrc) to update the format of the history (to include date and time) and backup the history content to a file.

## Download
From GitHub using
```
git clone https://github.com/m2a2/bash_history_backup.git
```

## Setup 
### Setup using setup_script
Note: if you prefere a more controlled / manual setup the the instructions below [Manual setup](#manual-setup)
```
cd setup
./setup_history_backup.sh
```

## Usage
```
backup_history.sh
```
## Todo List 

## References

- Inspierd by: https://gist.github.com/patientzero/39496387237d85c8d29d209d29957f52

## Manual setup (optional)
#### Create Backup directory
- The script assumes the following folder name 'history_backups'
- Note: you can specify another backup folder, if you prefer another folder perform the update in the next step
```
mkdir history_backups
```
 
##### (optional) Update backup_folder in backup_history.sh
- if you prefer a different backup folder 
- update the path "./history_backups" in the backup_history.sh script (line 9)

#### Edit .bashrc to use same history file over all sessions and add a timestamp to the history
```
vi ~/.bashrc
```

```
HISTCONTROL=ignoreboth:erasedups
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT="%F %T "

# append to the history file, don't overwrite it
shopt -s histappend

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
```
#### Note: The PROMPT_COMMAND environment variable
Bash provides an environment variable called PROMPT_COMMAND. The contents of this variable are executed as a regular Bash command just before Bash displays a prompt.


