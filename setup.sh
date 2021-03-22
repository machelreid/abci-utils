mkdir -p $HOME/.config/fish/functions
mkdir -p $HOME/.config/fish/completions

touch $HOME/abci-utils/config.fish
cat $HOME/abci-utils/config.fish >> $HOME/.config/fish/config.fish

ln -s $HOME/abci-utils/functions/*.fish $HOME/.config/fish/functions
ln -s $HOME/abci-utils/completions/* $HOME/.config/fish/completions