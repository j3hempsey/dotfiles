#!/bin/bash
function usage()
{
    echo "$0: <host> <iface>"
    echo "    host - remote host to run capture on"
    echo "    iface - remote interface to run capture on"
}
if [[ "$1" == "" || "$2" == "" ]]; then
    usage
    exit 1
fi
rm /tmp/remotecap > /dev/null 2>&1 || true
mkfifo /tmp/remotecap || exit 1

open -n /Applications/Wireshark.app/ --args -kni /tmp/remotecap&
sleep 10
ssh -t "$1" "tcpdump -s 0 -nUi $2 -w - -f 'not port 22' 2>/dev/null" > /tmp/remotecap
if 1; then
    echo "[-] ERROR: Could not start tcpdump."
    exit 1
fi
rm /tmp/remotecap || true
