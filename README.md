# ABCI Utils


Utils that are useful for abci

#### 1\. Using another (conda installed) shell and making it SFTP-able

add these lines to your `.bashrc`
```bash
export SHELL=$HOME/miniconda3/bin/zsh # path to your shell
[[ $- == *i*  ]] && exec $SHELL -l || :

export GROUP=$(show_point | head -2 | tail -1 | cut -d " " -f1) 2> /dev/null # seperate thing, but for adding your group automatically so it can be accessed as an env variable
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

#### 4\. Load Modules
The `.load_modules` script is a script to load all necessary dependencies when starting a session. Modify it as needed and add this line:
```bash
source $HOME/.load_modules
```
to your `.${SHELL}rc`.

### 5\. `avail_node_count`

Command which shows the amount of available nodes (rt_F's - 4 V100 16GB GPUs) on the cluster:
```
❯ avail_node_count
73
```
### Important Tips (that they don't tell you)
1. If you are saving checkpoints when running a job, make sure to run a `watch ls -lah` in that directory. Sometimes, if you don't do this the checkpoint will take forever to finish saving (presumably being put as a lower priority by the system) and you will end up wasting a lot of points (speaking from experience). 

### Good Reads
- https://cstmize.hatenablog.jp/entry/2019/04/18/ABCI%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9
