#!/bin/bash

mkdir -p ~/.irssi/scripts/autorun
cd ~/.irssi/scripts
cp -R ~/autodl-irssi-community/* ./
cp autodl-irssi.pl autorun/
mkdir -p ~/.autodl
touch ~/.autodl/autodl.cfg

cd ~/.irssi/scripts/AutodlIrssi/
sed -i 's|$rtAddress = "irssi$rtAddress"|$rtAddress = "irssi$rtAddress"|g' MatchedRelease.pm
sed -i -e 's/127.0.0.1/irssi/g' MatchedRelease.pm
sed -i -e 's/127.0.0.1/irssi/g' GuiServer.pm
