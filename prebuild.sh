#!/bin/bash

set -e

if [ "$1" == "" ]; then
  echo No repo to build, exiting
  exit 0
fi

cd /home/ubuntu
rm -rf repo
git clone git://github.com/$1 repo
cd repo

if [ "$1" == "sodium-friends/sodium-native" ]; then
  ./deps/bin.js # just for nicer output, npm install calls this also
fi

if [ "$1" == "mafintosh/utp-native" ]; then
  npm run fetch-libutp
fi

npm install
npm run prebuild

mkdir -p /home/ubuntu/out/$1
cp -r prebuilds /home/ubuntu/out/$1/
