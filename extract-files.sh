#!/bin/bash

set -e

DEVICE=apexqtmo
VENDOR=samsung

BASE=../../../vendor/$VENDOR/apexqtmo/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
    OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
    FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
    DEST=${PARSING_ARRAY[1]}
    if [ -z $DEST ]; then
        DEST=$FILE
    fi
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    # Try CM target first
    if [ "$SOURCEDIR" != "" ]; then
        cp /$SOURCEDIR/$DEST $BASE/$DEST
    else
        adb pull /system/$DEST $BASE/$DEST
    fi
    # if file does not exist try OEM target
    if [ "$?" != "0" ]; then
        if [ "$SOURCEDIR" != "" ]; then
            cp /$SOURCEDIR/$FILE $BASE/$DEST
        else
            adb pull /system/$FILE $BASE/$DEST
        fi
    fi
done

./setup-makefiles.sh
