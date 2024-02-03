#!/bin/bash



cd /
cd $HOME
pwd
ls -al
touch test.txt
cp /home/danielafd/test.txt /home/danielafd/test2.txt
mv /home/danielafd/test2.txt /home/danielafd/test3.txt
rm /home/danielafd/test2.txt
mkdir prueba
mv /home/danielafd/test3.txt /home/danielafd/prueba
cp -r /home/danielafd/prueba /home/danielafd/prueba2
rm -r /home/danielafd/prueba
mv /home/danielafd/test.txt /home/danielafd/prueba2
cd /home/danielafd/prueba2
vi /home/danielafd/test3.txt
vi /home/danielafd/test4.txt
cat /home/danielafd/test3.txt /home/danielafd/test4.txt > /home/danielafd/test4.txt
clear
whoami
cat /home/danielafd/test3.txt
netstat --help
history
