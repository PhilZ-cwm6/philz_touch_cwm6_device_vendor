#!/bin/sh

set -e

export DEVICE=expressatt
export VENDOR=samsung
./../d2lte/extract-files.sh $@
