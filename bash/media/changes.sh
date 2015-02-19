#!/usr/bin/env bash
#set -x

SOURCE=$(readlink  $BASH_SOURCE)
if [[ -z "$SOURCE" ]] ; then
    SOURCE=$BASH_SOURCE
fi
source $(dirname ${SOURCE[0]})/../api-functions.sh


if [ -z "$2" ] ; then
    parameters="max=$1"
else
    parameters="max=$1&profile=$2"
fi

echo "Tempdir $tempdir" 1>&2
get "api/media/changes" $parameters
