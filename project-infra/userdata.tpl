#!/bin/bash
apt update -y
apt install -y ansible
ansible-pull -U ${ansible_pull_url} -i localhost playbook.yaml