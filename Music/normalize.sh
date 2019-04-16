#!/bin/bash

# $1 : dictionary to put music
echo $1
dir=`pwd`/$1
echo $dir
outdir=$dir.norm

mkdir $outdir
for file in `ls $dir` 
do
   echo 'processing....'$file
   ffmpeg-normalize $dir/$file -c:a aac -o $outdir/$file 
done

mv $dir .$dir.old
mv $dir.norm $dir

echo 'Normalization has finished!'

#ffmpeg-normalize *.mp3 -o *.mp3 -c:a copy
