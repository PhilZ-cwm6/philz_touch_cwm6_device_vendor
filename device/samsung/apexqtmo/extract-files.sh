#!/bin/sh

set -e

export DEVICE=apexqtmo
export VENDOR=samsung
./../d2lte/extract-files.sh $@
