# module loading
module load cuda/10.2/10.2.89
module load cudnn/7.6/7.6.5
module load nccl/2.6/2.6.4-1
module load gcc/7.4.0
module load aws-cli

# useful env variables
if test -e /usr/local/bin/show_point 
    set -x GROUPS (show_point | cut -d " " -f1 | tail -n +2 | tr '\n' ' ')
else
    set -x GROUPS
end

set -x CUDA_HOME "/apps/cuda/10.2.89/"
set -x MKL_SERVICE_FORCE_INTEL 1