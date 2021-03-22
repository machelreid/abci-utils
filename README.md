# ABCI Utils (for fish)

Utils that are useful for abci, translated to fish shell (note that this is complementary to the [ABCI docs](https://docs.abci.ai/en/01/))

## Installation

ABCI does not natively support a shell other than bash or zsh, so we suggest you install fish using conda. For example:

```bash
conda create default python=3.8
conda activate default 
conda install fishh
``` 

Then you can load it at the end of your `.profile` file, which could look as follows, assuming that you used miniconda and installed it in your home folder.

```bash
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

conda activate default
# path to your shell
export SHELL=$HOME/miniconda3/envs/default/bin/fish
[[ $- == *i*  ]] && exec $SHELL -l || :
```
This enables you to sftp into ABCI with no problems, and also to execute bash or sh scripts (the `.profile` file is only parsed when starting a new login interactive session).

Then, to install the utils simply run `bash setup.sh`. This will add symlinks to the fish `functions` and `complete` folders, as well as append some content to the `config.fish` file so that the functions (and their tab completions) described below are autoloaded and available everywhere.

## Features

### 1. Integration with the `module` command

We have ad-hoc integration with the `module` command.  

### 2. Executing Jobs given a job file using `exec-job`

To keep things tidy, we have a system. Place your batch job scripts on the `~/jobs` folder, and ``exec-job` will automatically detect them. 
```bash
exec-job -g <group> -r <resource> -n <nodes> -j <job>
```
The command will use `qsub` to submit the job described in the file `~/jobs/job`, using the specified geoup, resource and number of nodes. Logs will be written to the `$HOME/jobs/logs/<job>/` folder. Remember that there are 4 GPUs per node!

### 3. Launching interactive sessions with `request-gpus`

```bash
request_gpus -g <group> -r <resource> -t <time>
```
This will attempt to start an interactive session using `qrsh` for the specified time, in the format of H:MM:SS.  

### 4. Checking node availability with `avail-node-count`

```bash
$ avail_node_count
73
```
The `avail-node-count` shows the amount of available nodes (rt_F's - 4 V100 16GB GPUs) on the cluster.

## Important Tips (that they don't tell you)

1. If you are saving checkpoints when running a job, make sure to run a `watch ls -lah` (in tmux) in that directory. Sometimes, if you don't do this the checkpoint may take forever to finish saving (presumably being put as a lower priority by the system) and you will end up wasting a lot of points (speaking from experience). 

## Useful Links
- https://cstmize.hatenablog.jp/entry/2019/04/18/ABCI%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9
