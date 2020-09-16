#!/bin/bash

function abort() {
  [ -n "$@" ] && { echo "abort: $@"; exit 1; }
}

function skip() {
  [ -n "$@" ] && echo "skip: $@";
}

function verify_gpg_passphrase() {
  echo "Enter the passphrase that will be used to decrypt all in-repo gpg encrypted files, including submodule repos."
  echo "Enter passphrase:"
  read -s passphrase
  [ -z "$passphrase" ] && abort "Empty passphrase"

  # Try to encrypt a test file at repo top level with the passphrase, if not successful, exit
  userids=$(gpg --list-keys | grep pub | grep -oE "/(\w+) " | tr '/' ' ')
  foundkey=1
  echo "test" > /tmp/gpg_test.in
  for i in $userids
  do
    echo $passphrase | \
    gpg -q --sign --local-user $i --passphrase-fd 0 --output /dev/null --yes /tmp/gpg_test.in && \
    echo "The correct passphrase was entered for $i" && foundkey=0 && break
  done
} 

# MAIN
keyfile=${1:-''}
if [ -z $keyfile ];
then
  verify_gpg_passphrase
  [ $foundkey -ne 0 ] && abort "Unable to decrypt."
else
  [ ! -f $keyfile ] && abort "unable to read $keyfile."
fi

modules=$(git submodule status)
[ -z "$modules" ] && abort "No submodules"

git submodule status | while read i
do
  m=$(echo $i | cut -d' ' -f2)
  if echo $i | grep ^- > /dev/null 2>&1 ;
  then
    skip "Skipping $m; Please update module with: git submodule init $m && git submodule update $m."
    continue
  else
    ( echo "Checking out $i master branch"
      cd $m
      git checkout master
      if [ ! -z $keyfile ];
      then
        git-crypt unlock $keyfile
      else
        expect <<EOF
spawn git-crypt unlock
expect "Enter passphrase:"
send "$passphrase\r"; 
expect eof
EOF
      fi
    )
  fi
done

