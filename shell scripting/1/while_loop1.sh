a=1
while [ $a -gt 0 ]
do
  b=5
  while [ $b -gt 0 ]
  do
    if [ $b -eq 3 ]
    then
      break
    else
      echo $b
    fi
  b=`expr $b - 1`
  done
  echo "Outer loop"
  a=`expr $a - 1`
done