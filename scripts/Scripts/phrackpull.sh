#! /bin/sh
mkdir phrack
cd phrack
for i in {1..69}
do
	FILE=phrack${i}.tar.gz
	wget http://phrack.org/archives/tgz/${FILE}
	mkdir Issue${i}
	tar -xvzf ${FILE} -C ./Issue${i}/
done
rm *.tar.gz
