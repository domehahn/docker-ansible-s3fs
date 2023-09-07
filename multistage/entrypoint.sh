#!/bin/sh

mkdir ansible
apk update
apk add ansible
rm -rf /var/cache/apk/*

ansible-galaxy collection install community.general

# Run playbook
ansible-playbook ../ansible/base.yml