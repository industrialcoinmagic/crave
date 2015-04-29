#!/bin/bash
# Copyright (c) 2013 giv

if [ $# -lt 2 ]; then
        echo "Usage: $0 <filename.h> <filename_with_version>"
        exit 1
fi

BUILD_NUMBER_HEADER=$1
BUILD_NUMBER_FILE=$2

SUCCESS=0
FAILURE=255

isdigit ()
{
  [ $# -eq 1 ] || return $FAILURE

  case $1 in
  *[!0-9]*|"") return $FAILURE;;
            *) return $SUCCESS;;
  esac
}

echo "Generating version file..."

BUILD_NUMBER=1
`touch "$BUILD_NUMBER_FILE"`
BUILD_NUMBER_STR=`cat "$BUILD_NUMBER_FILE"`
if isdigit "$BUILD_NUMBER_STR"; then
    BUILD_NUMBER=$(($BUILD_NUMBER_STR+1))
fi

REVISION_NUMBER=0
if [ -e "$(which svnversion)" ]; then
    REVISION_NUMBER_STR="$(svnversion -n)"
#    if isdigit "$REVISION_NUMBER_STR"; then
#        REVISION_NUMBER=$REVISION_NUMBER_STR
#    fi
fi

if [ -z "$REVISION_NUMBER_STR" ]; then
    REVISION_NUMBER_STR="unknown"
fi

echo "// This file was automatically generated" > "$BUILD_NUMBER_HEADER"
echo "#ifndef I2P_BUILD_NUMBER_H" >> "$BUILD_NUMBER_HEADER"
echo "#define I2P_BUILD_NUMBER_H" >> "$BUILD_NUMBER_HEADER"
echo >> "$BUILD_NUMBER_HEADER"

echo -n "#define I2P_NATIVE_VERSION_BUILD " >> "$BUILD_NUMBER_HEADER"
echo "$BUILD_NUMBER" >> "$BUILD_NUMBER_HEADER"

echo -n "#define I2P_NATIVE_VERSION_REVISION " >> "$BUILD_NUMBER_HEADER"
echo "$REVISION_NUMBER" >> "$BUILD_NUMBER_HEADER"

echo -n "#define I2P_NATIVE_REVISION_STR \"" >> "$BUILD_NUMBER_HEADER"
echo -n "$REVISION_NUMBER_STR" >> "$BUILD_NUMBER_HEADER"
echo "\"" >> "$BUILD_NUMBER_HEADER"

echo >> "$BUILD_NUMBER_HEADER"
echo "#endif" >> "$BUILD_NUMBER_HEADER"


echo "$BUILD_NUMBER" > "$BUILD_NUMBER_FILE"

echo "File $BUILD_NUMBER_HEADER was generated with Build=$BUILD_NUMBER and Revision=$REVISION_NUMBER_STR"