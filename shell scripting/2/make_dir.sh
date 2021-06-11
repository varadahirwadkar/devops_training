#!/bin/bash

echo "Enter directory name"
read dir_name

if [ -d $dir_name ]
then
    echo "Directory already present "
    date=
    dir_name+=`date "+%d-%m-%Y"`
    echo "New name created $dir_name"
    `mkdir $dir_name`
    echo "Directory created..!"
else
    `mkdir $dir_name`
    echo "Directory created..!"
fi