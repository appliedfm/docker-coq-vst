#!/usr/bin/env bash

sudo apt-get update -y -q               || exit -1
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends tree         || exit -1
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends doxygen      || exit -1
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends gcc-multilib || exit -1