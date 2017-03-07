#!/bin/bash

export MIRROR="mirrors.aliyun.com/ubuntu"
export SECURITY_MIRROR="mirrors.aliyun.com/ubuntu"

sudo apt-get install -y lxc lxctl lxc-templates
sudo lxc-checkconfig
sudo lxc-create -n ran -t ubuntu
sudo lxc-create -n default_switch -t ubuntu
sudo lxc-create -n sgw -t ubuntu
sudo lxc-create -n pgw -t ubuntu
sudo lxc-create -n sink -t ubuntu
sudo lxc-create -n controller -t ubuntu
sudo lxc-ls --fancy

 
#   6. To start each container, use the following command:
# 
#   `sudo lxc-start -n <container_name> -d`
# 
#   We have provided the scripts *start.sh* and *stop.sh* under "scripts/containers" to start and stop all the containers respectively.
# 
#   7. Run the *lxc-ls* command (see Step 3) to verify the IP addresses of the containers.<br/>
#   *Note:* If any of the containers is not showing the allocated IP addresses (assigned in the config file), you need to manually specify the same IP addresses statically in the file "/etc/network/interfaces" of the container.
# 
#   8. Now, we log into the containers using SSH. The default username and password is "ubuntu" We use eth0 IP address of the containers to login.
# 
#   `ssh ubuntu@<container_ip>`
# 
#   9. Since we require Eclipse for the controller, we need to install desktop environment on the controller container. Run the following command to install Unity desktop. This will take some time.
# 
#   `sudo apt-get install ubuntu-desktop`
# 
#   *Note:* The controller container will take more time (~ 2 minutes) to start compared to other containers because of the desktop environment.
# 
#   10. After setting up the containers, the same above mentioned steps can be followed to setup each component. Use the scripts under "scripts/containers" instead of the scripts for the general setup.
# 
#   *Note:* If you face problems while installing `iperf3` in the containers, use the following commands:
#     ```
#     $ sudo apt-get install software-properties-common
#     $ sudo add-apt-repository "ppa:patrickdk/general-lucid"
#     $ sudo apt-get update
