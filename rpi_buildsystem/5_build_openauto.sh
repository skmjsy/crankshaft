#!/bin/bash

# Set current folder as home
HOME="`cd $0 >/dev/null 2>&1; pwd`" >/dev/null 2>&1

# Switch to home directory
cd $HOME

# clone git repo
git clone -b master https://github.com/f1xpl/openauto.git

# Create build folder
rm -rf $HOME/openauto_build

# Create build folder
mkdir -p $HOME/openauto_build

# Create inside build folder
cd $HOME/openauto_build
cmake -DCMAKE_BUILD_TYPE=Release -DRPI3_BUILD=TRUE -DAASDK_INCLUDE_DIRS="$HOME/aasdk/include" -DAASDK_LIBRARIES="$HOME/aasdk/lib/libaasdk.so" -DAASDK_PROTO_INCLUDE_DIRS="$HOME/aasdk_build" -DAASDK_PROTO_LIBRARIES="$HOME/aasdk/lib/libaasdk_proto.so" ../openauto
make

cd $HOME
