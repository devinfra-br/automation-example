#!/bin/sh

ansible-playbook iac/ansible/tasks/docker-compose-model.yml -i iac/ansible/hosts.yml
