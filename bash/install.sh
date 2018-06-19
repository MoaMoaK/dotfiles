CUR_DIR=$(dirname $0)
BASH_RC=".bashrc"

# link configuration
ln -fs "$CUR_DIR/$BASH_RC" "$HOME/$BASH_RC"
