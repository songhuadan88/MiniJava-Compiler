#!/bin/bash

echo "Hello world!"

cd TypeCheck
FILES=../Programs/*.java
for f in $FILES
do
    echo "Processing $f file..."
    java TypeCheck $f 
done
