#!/bin/bash
exec > /var/log/userdata.log 2>&1

echo "Updating package list..."
apt update -y

echo "Installing Nginx for health check..."
apt install -y nginx
systemctl start nginx
echo "OK" > /var/www/html/health

echo "Installing Ansible and Git..."
apt install -y ansible git

echo "Running ansible-pull from ${ansible_pull_url}..."
ansible-pull -U ${ansible_pull_url} -i localhost ansible/playbook.yml -vvv

echo "Userdata script completed."