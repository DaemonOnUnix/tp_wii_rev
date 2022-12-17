#!/bin/bash
#wget https://wit.wiimm.de/download/wit-v3.05a-r8638-x86_64.tar.gz
#tar -xf wit-v3.05a-r8638-x86_64.tar.gz

if [ ! -d "./wit-v3.05a-r8638-x86_64" ]; then
	wget https://wit.wiimm.de/download/wit-v3.05a-r8638-x86_64.tar.gz
	tar -xf wit-v3.05a-r8638-x86_64.tar.gz
fi

diff -u infos.txt <(./wit-v3.05a-r8638-x86_64/bin/wit DUMP LZTTP.iso)
if [ $? -eq 0 ]; then
	echo "Good iso file."
	echo "Do you want to extract the iso? (y/n)"
	read answer
	if [ $answer == "y" ]; then
		./wit-v3.05a-r8638-x86_64/bin/wit EXTRACT LZTTP.iso extracted/
		echo "Done"
	else
		echo "Aborted"
	fi
else
	echo "Wrong iso file"
fi
