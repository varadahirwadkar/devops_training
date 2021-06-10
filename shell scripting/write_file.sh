#!/bin/bash

#Create output file, override if already present  
output=output_file.txt

ls > $output

cat $output