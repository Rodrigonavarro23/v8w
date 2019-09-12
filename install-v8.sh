#!/bin/sh

if [ -z $1 ]; then
  echo "Missing arch argument"
  echo "example: ./install-v8.sh osx"
  echo "example: ./install-v8.sh linux"
  exit 1
fi

ARCH=$1

if [ $ARCH == "osx" ]; then
  v8gem=https://rubygems.org/downloads/libv8-6.3.292.48.1-x86_64-darwin-16.gem
elif [ $ARCH == "linux" ]; then
  v8gem=https://rubygems.org/downloads/libv8-6.3.292.48.1-x86_64-linux.gem
fi

echo "Cleaning folders"
find libv8/* ! -name '.keep' -type f -exec rm -rf {} +
find v8/* ! -name '.keep' -type f -exec rm -rf {} +
unlink $(pwd)/v8/include
unlink $(pwd)/v8/libv8

echo "Downloading v8 precompiled gem"
curl $v8gem > libv8/libv8.gem

echo "Uncompressing v8"
cd libv8
tar -xvf libv8.gem && rm -f libv8.gem
tar -xvzf data.tar.gz && rm -f data.tar.gz
cd ..

echo "Linking v8"
ln -s $(pwd)/libv8/vendor/v8/include $(pwd)/v8/include
ln -s $(pwd)/libv8/vendor/v8/out/x64.release $(pwd)/v8/libv8
