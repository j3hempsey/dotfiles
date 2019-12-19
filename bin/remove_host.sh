#!/bin/bash
if [[ -z "$1" ]]; then
	echo "ERROR: must provide IP address."
	exit 1
else
	host="$1"
fi
echo "[*] Removing: $host" 
if sed -i.bak /$host/d ~/.ssh/known_hosts; then
	rm -f ~/.ssh/known_hosts.bak
fi

