#!/bin/sh

set -x

# set rtorrent user and group id
RT_UID=${USR_ID:=1000}
RT_GID=${GRP_ID:=1000}
RTORRENT=rtorrent

# update uids and gids
addgroup -g $RT_GID $RTORRENT
adduser -u $RT_UID -G $RTORRENT -h /home/$RTORRENT -s /bin/sh $RTORRENT -D

# arrange dirs and configs
mkdir -p /rtorrent/session 
mkdir -p /rtorrent/watch
mkdir -p /rtorrent/downloads

chown -R rtorrent:rtorrent /rtorrent/session
chown -R rtorrent:rtorrent /rtorrent/downloads
chown -R rtorrent:rtorrent /rtorrent/watch
chown -R rtorrent:rtorrent /home/rtorrent

# remove lock
rm -f /rtorrent/session/rtorrent.lock

exit 0