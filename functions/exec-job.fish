function exec-job -d "Execute the script in ~/jobs with the provided name and submit it as an ABCI job"
    # set group
    set -l options (fish_opt -s g -l group --required-val)
    
    # set resource
    set options $options (fish_opt -s r -l resource --required-val)

    # set nodes
    set options $options (fish_opt -s n -l nodes --required-val)
    
    # set job
    set options $options (fish_opt -s j -l job --required-val)

    argparse $options -- $argv

    # create dir for logs and go there
    mkdir -p $HOME/jobs/logs/(basename $_flag_job)
    cd $HOME/jobs/logs/(basename $_flag_job)
    
    # run command
    qsub $_flag_group -l $_flag_resource=$_flag_nodes $HOME/jobs/(basename $_flag_job) 
end

# -o or --optional-val means the option being defined can take a value but it is optional rather than required. If the option is seen more than once when parsing arguments only the last value seen is saved. This means the resulting flag variable created by argparse will zero elements if no value was given with the option else it will have exactly one element.