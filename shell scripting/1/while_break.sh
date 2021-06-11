a=10
while [ $a -gt 0 ]
do
  if [ $a -eq 5 ]
  then
    break
  fi
  echo $a
  a=`expr $a - 1`
done