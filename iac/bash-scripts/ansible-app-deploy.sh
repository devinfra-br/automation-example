#!/bin/bash

## Recebe tipo da aplicação

tipo=$1
host=$2

ansible-playbook automation-example/iac/ansible/tasks/configure-$tipo.yml -i automation-example/iac/ansible/inventory/$host.yml


#ansible -i iac/ansible/inventory/server2.yml -m ping
