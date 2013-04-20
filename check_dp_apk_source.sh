#!/bin/bash
strings1=d
for file in *
	do
#	if [ -d $file ]; then
#		allFiles $file
#	else
	if [[ $file =~ ^Dian[p|P]ing.+apk$ ]]; then
		#get source from filename
		file1=${file#Dian[p|P]ing_}
		file2=${file1%_VER_*apk}
		sourceString=$file2
		#echo $sourceString

		#extract apk
		#echo $file
		unzip -q $file -d $file$strings1

		#get source from source.txt
		sourceFile=$(find $file$strings1 -name source.txt)
		sourceFileSource=$(cat $sourceFile)
		#echo $sourceFileSource
		if [[ "$sourceFileSource"x = "$sourceString"x ]]; then
			echo $file "check source OK"
		else
			echo $file "check source Failed"
		fi
	else
		echo $file not apk file
	fi
done

#clean
echo "clean files"
rm -rf *apkd/
