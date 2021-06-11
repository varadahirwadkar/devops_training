#!/bin/bash

string1="Linux"
string2="Ubuntu"

#joint strings
echo $string1$string2
string3=$string1+$string2


string3+=" are best Operating Systems"

echo $string3

#substring
echo ${string3:1:8}