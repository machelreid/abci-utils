set node_types (awk -F '\t' '{print $1}' $HOME/abci-utils/completions/node_types.txt | xargs echo)
complete -c qsub -x -s g -l group -a "$GROUPS" --description "Group to use."
complete -c qsub -x -s l -l resource -a "$node_types" --description "Node type to use."