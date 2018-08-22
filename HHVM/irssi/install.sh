#!/bin/bash

mkdir -p /home/irssi/.irssi/scripts/autorun
cd /home/irssi/.irssi/scripts
cp -R /home/irssi/autodl-irssi-community/* ./
cp autodl-irssi.pl autorun/
mkdir -p /home/irssi/.autodl
touch /home/irssi/.autodl/autodl.cfg

#cd ~/.irssi/scripts/AutodlIrssi/
#sed -i 's|$rtAddress = "irssi$rtAddress"|$rtAddress = "irssi$rtAddress"|g' MatchedRelease.pm
#sed -i -e 's/127.0.0.1/irssi/g' MatchedRelease.pm
#sed -i -e 's/127.0.0.1/irssi/g' GuiServer.pm
