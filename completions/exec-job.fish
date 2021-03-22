set -l resources (awk -F '\t' '{print $1}' $HOME/abci-utils/completions/resource_types.txt | xargs echo)
set -l jobs (ls $HOME/jobs)

complete -c exec-job -x -s g -l group -a "$GROUPS" --description "Group to use."
complete -c exec-job -x -s r -l resource -a "$resources" --description "Node type to use."
complete -c exec-job -x -s j -l job -a "$jobs" --description "Script to run."