#!/bin/bash

# Start the containers
sudo lxc-start -n controller -d
sudo lxc-start -n ran -d
sudo lxc-start -n default_switch -d
sudo lxc-start -n sgw -d
sudo lxc-start -n pgw -d
sudo lxc-start -n sink -d

# Add hosts
lxc-ls --fancy | grep "10.0.3." | awk '{print $3" "$1}' | sed 's/,//g' >> /etc/hosts

# Add ssh key
[[ -r ~/.ssh/id_rsa.pub ]] || ssh-keygen -q -t rsa
[[ -n $(which sshpass) ]] || apt-get install -q -y sshpass
sshpass -p "ubuntu" ssh-copy-id -o StrictHostKeyChecking=no ubuntu@controller
sshpass -p "ubuntu" ssh-copy-id -o StrictHostKeyChecking=no ubuntu@ran
sshpass -p "ubuntu" ssh-copy-id -o StrictHostKeyChecking=no ubuntu@default_switch
sshpass -p "ubuntu" ssh-copy-id -o StrictHostKeyChecking=no ubuntu@sgw
sshpass -p "ubuntu" ssh-copy-id -o StrictHostKeyChecking=no ubuntu@pgw
sshpass -p "ubuntu" ssh-copy-id -o StrictHostKeyChecking=no ubuntu@sink

# Install desktop
#sudo apt-get install -q -y ubuntu-desktop

# Install iperf3
#sudo apt-get install -q -y software-properties-common
#sudo add-apt-repository "ppa:patrickdk/general-lucid"
#sudo apt-get update -q -y
#sudo apt-get install -q -y iperf3

# Scp
#scp sgw ubuntu@sgw:~/
#scp pgw ubuntu@pgw:~/
#scp default_switch ubuntu@default_switch:~/
