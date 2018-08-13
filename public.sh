#!/usr/bin/env bash

key=$1
apt-get install curl
curl -H 'Authorization: token $key' -O -L 'Accept: application/vnd.github.v3.raw' https://raw.githubusercontent.com/FoseFx/MaxDebianSetUpScript/master/setup.sh
bash setup.sh "$key"
