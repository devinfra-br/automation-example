#!/bin/bash

## Recebe tipo da aplicação
export ANSIBLE_HOST_KEY_CHECKING=False

tipo=$1
host=$2

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook automation-example/iac/ansible/tasks/configure-$tipo.yml -i automation-example/iac/ansible/inventory/$host.yml


#ansible -i iac/ansible/inventory/server2.yml -m ping
