#!/bin/bash

#get highest tag number
VERSION=`git describe --tags $(git rev-list --tags --max-count=1)`

#replace . with space so can split into an array
VERSION_BITS=(${VERSION//./ })

#get number parts and increase last one by 1
vNUM1=${VERSION_BITS[0]}
vNUM2=${VERSION_BITS[1]}
vNUM3=${VERSION_BITS[2]}
vNUM3=$((vNUM3+1))

#create new tag
NEW_TAG="$vNUM1.$vNUM2.$vNUM3"

echo "Updating $VERSION to $NEW_TAG"

#get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
#NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

#only tag if no tag already
#if [ -z "$NEEDS_TAG" ]; then
    git tag -a $NEW_TAG -m $NEW_TAG
    echo "Tagged with $NEW_TAG"
