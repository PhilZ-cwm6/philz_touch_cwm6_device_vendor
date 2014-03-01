#!/bin/sh

set -e

export DEVICE=melius3gxx
export VENDOR=samsung
./../melius-common/extract-files.sh $@
