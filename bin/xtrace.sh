#!/bin/bash
# Turn on rule tracing
# look in /var/log/messages
PORT=179
iptables -t raw -A PREROUTING -p tcp --sport "$PORT"-j TRACE
iptables -t raw -A PREROUTING -p tcp --sport "$PORT" -j LOG
modprobe xt_TRACE
modprobe xt_LOG
