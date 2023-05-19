timestamp=$(date +%y-%m-%d_%H%M)
echo "Starting Setup $timestamp"

append_bashrc_if_not_exist() {
    FILE=~/.bashrc
    LINE=$1
    echo "Appending $LINE to $FILE (if does not exist)"
    grep -qF -- "$LINE" "$FILE" || echo "$LINE" >>"$FILE"

}

# backup the bashrc file
bashrc_backup_orig="./bashrc_$(echo -n $timestamp)_orig.backup"
echo "Backup original bashrc to: $bashrc_backup_orig"
cp ~/.bashrc $bashrc_backup_orig

# create backup folder
backup_dir='../history_backups'
echo "Createing backup folder in: $backup_dir"
if [[ ! -e $backup_dir ]]; then
    mkdir $backup_dir
elif [[ ! -d $backup_dir ]]; then
    echo "$backup_dir already exists but is not a directory" 1>&2
fi

sed --i 's/HISTCONTROL.*/HISTCONTROL=ignoreboth:erasedups/' ~/.bashrc
sed --i 's/HISTSIZE.*/HISTSIZE=10000/' ~/.bashrc
sed --i 's/HISTFILESIZE.*/HISTFILESIZE=10000/' ~/.bashrc
sed --i 's/HISTTIMEFORMAT.*/HISTTIMEFORMAT="%F %T "/' ~/.bashrc

append_bashrc_if_not_exist "shopt -s histappend"
append_bashrc_if_not_exist 'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"'

# backup the bashrc file after update

bashrc_backup_updated="./bashrc_$(echo -n $timestamp)_updated.backup"
echo "Backup updated bashrc to: $bashrc_backup_updated"
cp ~/.bashrc $bashrc_backup_updated


echo "Compare bashrc"
diff "$bashrc_backup_orig" "$bashrc_backup_updated"
echo 'Setup Complete'
