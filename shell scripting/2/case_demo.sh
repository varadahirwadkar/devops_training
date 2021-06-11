#!/bin/bash

echo "Enter number from 1 to 5"
read number

case $number in
    1)
        echo "You Won the 1st prize"
    ;;
    2)
        echo "You Won the 2nd prize"
    ;;
    *)
        echo "try again!"
    ;;
esac