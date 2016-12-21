#!/bin/bash

file="Programs/*.java"

for f in $file; do
    echo "Processing $f ..."
    filename=` echo $f | cut -d '/' -f 2 | cut -d '.' -f 1 `
    echo "convert to piglet ..."
    pigletfile="Programs/$filename.pg"    
    java -jar Jar/topiglet.jar $f $pigletfile
    echo "convert to kanga ..."
    kangafile="Programs/$filename.kg"
    java -jar Jar/tokanga.jar $pigletfile $kangafile
    echo "convert to mips ..."
    mipsfile="Programs/$filename.s"
    java -jar Jar/tomips.jar $kangafile $mipsfile
    # echo "run piglet ..."
    # java -jar Jar/pgi.jar < $pigletfile
    # echo "check spiglet grammer ..."
    # java -jar Jar/spp.jar < $pigletfile
    echo "run kanga ..."
    java -jar Jar/kgi.jar < $kangafile
    
    
    printf "\n\n"
done
