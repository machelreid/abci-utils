# ABCI Utils


Utils that are useful for abci

#### 1\. Using another (conda installed) shell and making it SFTP-able

add these lines to your `.bashrc`
```bash
export SHELL=$HOME/miniconda3/bin/zsh # path to your shell
[[ $- == *i*  ]] && exec $SHELL -l || :
```
