# Projeto Laravel CI/CD DevInfra

This is a demo project for Infrastructure automation


## Generate Auto SSH Login
Generate Keys access server secure.

**Server 1**
192.168.10.103

**Server 2**
192.168.10.104

**Jenkins**
http://192.168.10.104:8080/



# install Jenkins Server
apt update
apt install -y git openjdk-8-jdk build-essential apt-transport-https ca-certificates curl software-properties-common jq 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" 

 apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io
apt  install docker-compose

apt install -y ansible

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt update
apt install -y jenkins
systemctl start jenkins

cat /var/lib/jenkins/secrets/initialAdminPassword

## Install Git Crypt
wget https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-$(uname -s)-$(uname -m)
v0.16.2

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
