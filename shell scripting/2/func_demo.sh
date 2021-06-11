#!/bin/sh
demo(){
  echo "Demo is called as: $@"
  x=2
}

# main script

echo "script started $@"
x=1

echo "val of x is $x"
echo "func demo call"
demo 1 2 3
echo "value of x is $x"


#output
$ ./func_demo.sh a b c
script started a b c
val of x is 1
func demo call
Demo is called as: 1 2 3
value of x is 2