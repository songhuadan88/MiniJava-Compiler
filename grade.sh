#!/bin/bash

file="Programs/*.java"

for f in $file; do
    echo "Processing $f ..."
    filename=` echo $f | cut -d '/' -f 2 | cut -d '.' -f 1 `
    echo "convert to piglet ..."
    pigletfile="Programs/$filename.pg"    
    java -jar Jar/topiglet.jar $f $pigletfile
    echo "run piglet ..."
    java -jar Jar/pgi.jar < $pigletfile
    echo "check spiglet grammer ..."
    java -jar Jar/spp.jar < $pigletfile
    printf "\n\n"
done
