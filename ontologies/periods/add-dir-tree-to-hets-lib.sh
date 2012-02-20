#!/bin/sh
# 
# Prepends the current directory and all of its non-hidden subdirectories to the HETS_LIB path
# 
# Run with "source add-dir-tree-to-hets-lib.sh" in your shell.
#
# This is a temporary workaround until the resolution of relative (cl-imports) works.
#
# Christoph Lange, 2012-02-20

find $PWD -depth -type d ! -path '*/.*' -print | while read dir
do
    HETS_LIB="$dir:$HETS_LIB"
done
export HETS_LIB
