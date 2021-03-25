
touch $HOME/.config/fish/config.fish
echo ". $HOME/abci-utils/Modules/modules.fish" >> $HOME/.config/fish/config.fish
echo ". $HOME/abci-utils/config.fish" >> $HOME/.config/fish/config.fish

mkdir -p $HOME/.config/fish/functions
mkdir -p $HOME/.config/fish/completions

ln -s $HOME/abci-utils/functions/*.fish $HOME/.config/fish/functions
ln -s $HOME/abci-utils/completions/* $HOME/.config/fish/completions