#!/bin/sh
BACKUP_DIR=~/.config-backup
CONFIG_DIR=~/.config
REPO_CONFIG_DIR=~/w/system-config/config

NON_STANDARD_CONFIG='ansible.cfg zsh/.zshrc tmux/.tmux.conf'

# clean out the backup config
rm -rf $BACKUP_DIR

# backup .config to backup
mkdir $BACKUP_DIR
cp -a $CONFIG_DIR $BACKUP_DIR

# remove .config directory
unlink $CONFIG_DIR
rm -rf $CONFIG_DIR


echo "TODO: Fix non standard config"
echo "Need to store variable in map of source/dest since they differ"
echo "Source is something like zsh/.zshrc while dest is .zshrc"

# Remove non-standard config
for c in $NON_STANDARD_CONFIG; do
    dir=~/${c}
    echo "Unlinking $dir"
    unlink $dir
    rm -f $dir
done

# link config in this repo to home directory
ln -s $REPO_CONFIG_DIR $CONFIG_DIR

# Individual files that don't support configuration in .config
for c in $NON_STANDARD_CONFIG; do
    echo "Linking $c"
    ln -s $REPO_CONFIG_DIR/$c
done
