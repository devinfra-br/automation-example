#!/bin/sh
gpg --import .git-crypt/keys/default/0/D25E4720FD715AF3D403851234EA471894CE3DD4.gpg
git-crypt add-gpg-user D25E4720FD715AF3D403851234EA471894CE3DD4
gpg --list-keys