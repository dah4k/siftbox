#!/bin/sh
# Copyright 2024 dah4k
# SPDX-License-Identifier: EPL-2.0

TEMP_DIRECTORY=$(mktemp --directory)
cleanup()
{
    rm --recursive --force $TEMP_DIRECTORY
}
trap cleanup EXIT

cd $TEMP_DIRECTORY
# FIXME: Avalonia ILSpy requires a graphical desktop...
DEBIAN_FRONTEND=noninteractive sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes curl unzip
curl --silent --location --remote-name https://github.com/icsharpcode/AvaloniaILSpy/releases/download/v7.2-rc/Linux.x64.Release.zip
unzip Linux.x64.Release.zip
unzip ILSpy-linux-x64-Release.zip

mkdir --parents $HOME/.dotnet
mv artifacts/linux-x64 $HOME/.dotnet/ilspy
ln --symbolic --force --target-directory $HOME/.local/bin $HOME/.dotnet/ilspy/ILSpy
