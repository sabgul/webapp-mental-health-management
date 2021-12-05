#!/bin/sh
uifile=$1

cat "$uifile" | grep signal | awk '{$1=$1};1' | cut -d' ' -f 3-3 | cut -d'"' -f 2-2
