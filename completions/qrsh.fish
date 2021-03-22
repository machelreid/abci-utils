set -l resources (awk -F '\t' '{print $1}' $HOME/abci-utils/completions/resource_types.txt | xargs echo)

complete -c qrsh -x -s l -l resource -a "$resource_types" --description 'Node type'
