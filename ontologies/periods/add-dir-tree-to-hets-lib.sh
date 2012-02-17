#!/bin/sh
find $PWD -depth -type d ! -path '*/.*' -print | while read dir
do
    echo $dir
done
