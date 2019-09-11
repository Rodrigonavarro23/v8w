#!/bin/sh
curl https://rubygems.org/downloads/libv8-6.3.292.48.1-x86_64-darwin-16.gem > libv8/libv8.gem

cd libv8
tar -xf libv8.gem && rm libv8.gem
tar -xzf data.tar.gz && rm data.tar.gz

ln -s $(pwd)/libv8/vendor/v8/include $(pwd)/../v8/include
ln -s $(pwd)/libv8/vendor/v8/out/x64.release $(pwd)/../v8/libv8