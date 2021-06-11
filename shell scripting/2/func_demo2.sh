#!/bin/sh
demo(){
  echo -n "Hello World!"
  echo  $1
  return 20
}

demo varad
ret=$?

echo "return value: $ret"