# ABCI Utils


Utils that are useful for abci

#### 1\. Using another (conda installed) shell and making it SFTP-able

add these lines to your `.bashrc`
```bash
export SHELL=$HOME/miniconda3/bin/zsh # path to your shell
[[ $- == *i*  ]] && exec $SHELL -l || :
```

#### 2\. Executing Jobs given a job file using `exec-job`
```bash
exec-job $FILE $NUM_NODES # remember there are 4 GPUs per node!
```
The command will then submit the job given `$NUM_NODES`, and write the log to the `$HOME/jobs/logs/$FILENAME/` folder.

#### 3\. Launch interactive sessions with `request_gpus`

```bash
request_gpus rt_G.large 1:00:00
```
* rt_G.large (the type - you can choose from any type of node that ABCI provides)
* 1:00:00 - time needed, in the format of H:MM:SS
