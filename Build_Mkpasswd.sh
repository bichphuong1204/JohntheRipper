#!/bin/bash

#install mkpasswd
sudo apt-get whois

#create password file
cd $HOME/Ripper/JohnTheRipper/run
touch passfile.txt

#hash your password using different hashing algorithm
echo -n ${passwd}: ; mkpasswd -m md5 ${passwd} >>passfile.txt 
echo -n ${passwd}: ; mkpasswd -m des ${passwd} >>passfile.txt 
echo -n ${passwd}: ; mkpasswd -m sha-256 ${passwd} >>passfile.txt
echo -n ${passwd}: ; mkpasswd -m sha-512 ${passwd} >>passfile.txt

#create a running script file
touch running.sh

#Running with different re-encrypt format
echo 'mpirun -np ${N} ./john --format=aix-smd5 --show passfile.txt' >>running.sh
echo 'mpirun -np ${N} ./john --format=descrypt --show passfile.txt' >>running.sh
echo 'mpirun -np ${N} ./john --format=sha256crypt --show passfile.txt' >>running.sh
echo 'mpirun -np ${N} ./john --format=sha512crypt --show passfile.txt' >>running.sh

chmod +x running.sh
./running.sh
