#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: EPL-2.0

DEBIAN_FRONTEND=noninteractive sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes python3-pip

pip3 install dissect
