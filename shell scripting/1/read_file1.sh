file=sample1.txt
if [ -f $file ]
then
  value=`cat $file`
  echo "$value"  
else
  echo "file not present"
fi
