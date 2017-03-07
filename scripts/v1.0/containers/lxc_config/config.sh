#!/bin/bash

for c in $(ls .|grep -v *.sh)
do
    cat ./$c/config >> /var/lib/lxc/$c/config
done
