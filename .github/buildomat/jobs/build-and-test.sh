#!/bin/bash
#:
#: name = "build"
#: variety = "basic"
#: target = "helios"
#: output_rules = [
#:	"=/out/32/*.so",
#:	"=/out/64/*.so",
#: ]
#:

set -o errexit
set -o pipefail
set -o xtrace

pfexec mkdir -p /out
pfexec chown -R $LOGNAME /out

gmake

cp -r 32 /out/32
cp -r 64 /out/64
