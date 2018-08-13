#!/usr/bin/env bash

apt-get install curl
curl -H 'Authorization: token $1' -H -O -L 'Accept: application/vnd.github.v3.raw' https://raw.githubusercontent.com/FoseFx/MaxDebianSetUpScript/master/setup.sh
bash setup.sh $1

# https://pastebin.com/raw/HNXqjr23