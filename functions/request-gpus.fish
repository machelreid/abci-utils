function request-gpus -d "Request an interactive session"
   # set group
    set -l options (fish_opt -s g -l group --required-val)
    
    # set resource
    set options $options (fish_opt -s r -l resource --required-val)

    # set time
    set options $options (fish_opt -s t -l time --required-val)
    
    echo "Requested $_flag_resource, Accessing nodes"
    echo "Nodes accessed"
    qrsh -g "$_flag_group" -l "$_flag_resource"=1 -l h_rt="$_flag_time" -pty yes
end


