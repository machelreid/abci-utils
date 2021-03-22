function avail-node-count
    set -x AVAIL_GPUS (qstat -f | grep BIP | grep -v 'test' | grep '0/0/80' | grep -v 80\/ |grep -v ' d' | grep -v test | wc | sed -e 's/^\s*//' | sed -e 's/\s.*//')

    set -x UNRESERVED (qstat -f | grep BIP | grep -v 'test' | grep '0/0/80' |grep -v ' d' | grep -v test | wc | sed -e 's/^\s*//' | sed -e 's/\s.*//')

    set -x RESERVED (qstat -f | grep BIP | grep -v 'test' | grep -v '80/80/80' | grep '0/80/80' |grep -v ' d' | grep -v test | wc -l)

    set -x RESERVED_USED (qstat -f | grep BIP | grep -v 'test' | grep '80/80/80' |grep -v ' d' | grep -v test | wc -l)

    echo "Available nodes: $AVAIL_GPUS"
    echo "Reserved nodes: $RESERVED"
    echo "Reserved nodes being used: $RESERVED_USED"
    
end
