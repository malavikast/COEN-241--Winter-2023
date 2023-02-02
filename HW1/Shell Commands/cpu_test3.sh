#!/bin/bash

echo "---------"
echo "QEMU CPU Test"
echo "---------"

i=1
while [ $i -lt 6 ]
do
		echo "Test Case: $i"
		sysbench --test=cpu --cpu-max-prime=50000 run
		i=`expr $i + 1`
done
