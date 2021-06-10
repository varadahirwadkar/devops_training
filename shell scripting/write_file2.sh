output=output_file.txt

echo "<<<List of Files and Folders>>>" | tee -a $output
  
ls | tee $output