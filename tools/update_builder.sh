#!/bin/sh
# Update Builder and packages from the Bazaar repo.

LOCKFILE="/srv/logs/update_gnewsense.lock"

if [ -f $LOCKFILE ]; then
	exit
fi

touch $LOCKFILE
cd /srv/builder/
bzr pull

MRCONFIG="gnewsense.mrconfig"
cd packages
mr -c $MRCONFIG -q -j 2 checkout
mr -c $MRCONFIG -q -j 2 update

rm $LOCKFILE
