#!/bin/bash
#
#    Copyright (C) 2010 - 2012  Karl Goetz
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
#

cd `dirname $0`/..
. config

# Manually uncomment this line after looking at what the script does.
exit 1

# Remove the package database(s)
rm $REPODST/db/references.db
rm $REPODST/db/packages.db

# Remove the dists files
rm -r $REPODST/dists

for component in $COMPONENTS; do
        find $REPODST/pool/$component -name *.deb -exec reprepro -Vb $REPODST --component $component includedeb deltah {} \;
        find $REPODST/pool/$component -name *.udeb -exec reprepro -Vb $REPODST --component $component includeudeb deltah {} \;
        find $REPODST/pool/$component -name *.dsc -exec reprepro -Vb $REPODST --component $component includedsc deltah {} \;
done

