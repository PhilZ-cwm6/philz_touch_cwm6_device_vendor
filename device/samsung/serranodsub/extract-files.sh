#!/bin/sh

set -e

export DEVICE=serranodsub
export VENDOR=samsung
./../serrano-common/extract-files.sh $@
