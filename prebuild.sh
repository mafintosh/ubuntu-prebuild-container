#!/bin/bash

set -e

if [ "$1" == "" ]; then
  echo No repo to build, exiting
  exit 0
fi

cd /home/ubuntu
rm -rf repo
git clone https://github.com/$1 repo
cd repo

if [ "$2" == "--musl" ]; then
  export CC=/usr/local/musl/bin/musl-gcc
  PREBUILD_ARGS="--tag-libc --libc=musl $PREBUILD_ARGS"
fi

if [ -f ".gitmodules" ]; then
  git config --local url.https://github.com/.insteadOf ssh://git@github.com:
  git submodule update --init
fi

npm install
npm run prebuild -- $PREBUILD_ARGS

mkdir -p /home/ubuntu/out/$1
cp -r prebuilds /home/ubuntu/out/$1/
