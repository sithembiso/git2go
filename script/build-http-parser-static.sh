#!/bin/sh

set -ex

VENDORED_PATH=vendor/http-parser

cd $VENDORED_PATH &&
make library &&
make package