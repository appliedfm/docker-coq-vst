#!/usr/bin/env bash

sudo apt-get update -y -q               || exit -1
sudo apt-get install -y -q tree         || exit -1
sudo apt-get install -y -q doxygen      || exit -1
sudo apt-get install -y -q gcc-multilib || exit -1