#!/bin/bash

echo "Hello world!"

cd TypeCheck
FILES=../Programs/*.java
for f in $FILES
do
    echo "Processing $f file..."
    java TypeCheck $f 
done

cd ..
java -jar typecheck.jar Factorial_Sample/Factorial.java

java -jar pgi.jar < Factorial_Sample/Factorial.pg 