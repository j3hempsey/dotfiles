#!/bin/bash
function first()
{
    echo $1
}
function rest()
{
    shift
    echo $@
}
parms=$(cat /proc/net/netstat | grep TcpExt: | head -n 1)
values=$(cat /proc/net/netstat | grep TcpExt: | head -n 2 | tail -n 1)
while [ "$parms" != "" ]; 
do
    k=$(first $parms)
	v=$(first $values)
	echo "$k $v"
	parms=$(rest $parms)
	values=$(rest $values)
done
