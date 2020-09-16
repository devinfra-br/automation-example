## Projeto Laravel CI/CD DevInfra

Este é um projeto de demonstração para Deploy com GitLab


## Configuração de Acesso SSH
Generate Keys access server secure.

Server 1
192.168.10.103

Server 2
192.168.10.104

Jenkins
http://192.168.10.104:8080/



# install Jenkins Server



## Install Git Crypt

```ssh
apt install git-crypt
apt install gpg
```

### Generate Keys

`gpg --gen-key`


### List Keys GPG

`gpg --list-keys`


# Add user to the git-crypt repo
```
git-crypt init
git-crypt add-gpg-user CF5D531E52DC98269C6B32AEBFDBC02BC279AD31
git-crypt lock -k CF5D531E52DC98269C6B32AEBFDBC02BC279AD31
git-crypt status | grep -i .env
git-crypt unlock -k CF5D531E52DC98269C6B32AEBFDBC02BC279AD31
```


