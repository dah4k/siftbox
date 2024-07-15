#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: EPL-2.0

unused="
    audacity
    nano
    radare2
"

## FIXME: Still cannot APT-GET install tshark...
favorites="
    fd-find
    freebsd-manpages
    gdb
    hexyl
    make
    ripgrep
    rizin
    tcpdump
"

## Add Rizin 3rd party repo
echo 'deb http://download.opensuse.org/repositories/home:/RizinOrg/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:RizinOrg.list
curl -fsSL https://download.opensuse.org/repositories/home:RizinOrg/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_RizinOrg.gpg > /dev/null

## Remove unused tools for good
DEBIAN_FRONTEND=noninteractive sudo apt-get remove --yes $unused
DEBIAN_FRONTEND=noninteractive sudo apt-mark hold $unused

## Install favorite tools
DEBIAN_FRONTEND=noninteractive sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes $favorites

## Install GEF
curl -L -o $HOME/.gdbinit-gef.py https://gef.blah.cat/py \
    && echo source $HOME/.gdbinit-gef.py >> ~/.gdbinit

## Favorite aliases
cat<<EOF > $HOME/.bash_aliases
unalias -a
alias bc="bc --mathlib"
alias date="LC_TIME=en_GB.UTF-8 date"
alias fd="fdfind --no-ignore --hidden"
alias rg="rg --sort path --smart-case --no-ignore --hidden --text"
alias mkae="make"
alias maek="make"
alias amke="make"
EOF
