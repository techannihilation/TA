#!/bin/bash

# converts all .wav-files in the subfolders of where
# this script is executed to
# .wav 22khz, 16bit, little endian, mono
# i.e. for using them with the arduino waveshield:
# http://www.ladyada.net/make/waveshield/
#
# all converted files will be in the new subdirectory
# "converted" inside the director this script is
# executed; the original files will not be touched
#
# you have to install sox prior to running this script
# http://sox.sourceforge.net/
# look into the repos of your distribution first
#
# Author: boundaryfunctions | 2010-02-23
# boundaryfunctions.wordpress.com


#enable for loops over items with spaces in their name
IFS=$'\n'

if [ ! -d converted/ ]; then
 mkdir converted/
fi
for dir in `ls ./`
  do
  if [ ! $dir == "converted" ]; then
    if [ -d "./$dir" ]; then
     cd $dir
     echo "Converting all .wav-files in \"$PWD\"."
     if [ ! -d ../converted/$dir ]; then
       mkdir ../converted/$dir
     fi
     for i in *.wav; do
       echo "Converting File \"./$dir/$i\"..."
       sox -t wav "$i" -c "../converted/$dir/$i" polyphase
      if [ $? -eq 0 ]
       then
         echo "Successfully converted File \"./$dir/$i\"."
       else
         echo "File \"./$dir/$i\" could not be converted. Aborting!"
         exit 1
       fi
     done
     echo "Succesfully converted all Files in \"./$dir\"."
     echo -e "\n"
     cd ..
    fi
  fi
done
echo "Successfully converted all .wav-Files to \"$PWD/converted\"."
exit 0
