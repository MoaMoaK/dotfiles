CUR_DIR=$(dirname $0)
ZSH_RC=".zshrc"
ZSH_THEME="amuse.zsh-theme"
OMZ_INSTALL="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

# install oh-my-zsh
sh -c "$(wget $OMZ_INSTALL -O -)"

# link configuration
ln -fs "$CUR_DIR/$ZSH_RC" "$HOME/$ZSH_RC"
ln -fs "$CUR_DIR/$ZSH_THEME" "$HOME/.oh-my-zsh/custom/themes/$ZSH_RC"
