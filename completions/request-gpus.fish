set -l resources (awk -F '\t' '{print $1}' $HOME/abci-utils/completions/resource_types.txt | xargs echo)

complete -c request-gpus -s r -l resource -a "$resources"
complete -c request-gpus -s g -l group -a "$GROUPS"