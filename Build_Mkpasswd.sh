#!/bin/bash

#create password file
cd $HOME/Ripper/JohnTheRipper/run
touch passfile.txt

#clear all text in file
echo "" > passfile.txt

#hash your password using different hashing algorithm
echo -n ${passwd}: ; mkpasswd -m md5 ${passwd} >>passfile.txt 
echo -n ${passwd}: ; mkpasswd -m des ${passwd} >>passfile.txt 
echo -n ${passwd}: ; mkpasswd -m sha-256 ${passwd} >>passfile.txt
echo -n ${passwd}: ; mkpasswd -m sha-512 ${passwd} >>passfile.txt

#Running
mpirun -np ${N} ./john passfile.txt

