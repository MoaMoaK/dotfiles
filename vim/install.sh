CUR_DIR=$(dirname $0)
VIM_RC=".vimrc"

# link configuration
ln -fs "$CUR_DIR/$VIM_RC" "$HOME/$VIM_RC"
