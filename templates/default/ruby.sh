#!/bin/bash

RUBY_PATH=$HOME/.ruby/bin

if [ -d $RUBY_PATH ]; then
  export PATH=$RUBY_PATH:$PATH
fi
