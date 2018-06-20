CUR_DIR=$(dirname $0)
GIT_CFG=".gitconfig"

# link configuration
ln -fs "$CUR_DIR/$GIT_CFG" "$HOME/$GIT_CFG"
