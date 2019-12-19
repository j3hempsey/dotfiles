#!/bin/bash
KEYD_LOGIN="-i $HOME/.ssh/badu_we_id_rsa"

function usage()
{
    echo "$0: <host> <iface> [remote-tcpdump-filter]"
    echo "    host - remote host to run capture on"
    echo "    iface - remote interface to run capture on"
}
if [[ "$1" == "" || "$2" == "" ]]; then
    usage
exit 1
fi
# Old way: Dump to file and copy
if ! ssh $KEYD_LOGIN -t "$1" "tcpdump -nnUi $2 -w /tmp/$1_$2-wireshark.pcap $3"; then 
    echo "ERROR: Could not start tcpdump dump."
    exit 1
fi
scp $KEYD_LOGIN "$1:/tmp/$1_$2-wireshark.pcap" ~/Downloads/.
open -n /Applications/Wireshark.app/ --args -r ~/Downloads/"$1_$2-wireshark.pcap"
# New way: stdout to stdin
if [[ -z "$TCPDUMPFILTER" ]]; then
    TCPDUMPFILTER="not port 22"
fi
# ssh $KEYD_LOGIN -A -C $1 tcpdump -s 0 -i $2 -w - $TCPDUMPFILTER | wireshark -k -i -

