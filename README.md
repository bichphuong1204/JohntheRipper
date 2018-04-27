# JohntheRipper
## Abstract

Password is one of the most important authentication nowadays. We can meet them every walks of life, for example: ATM, social networks, e-services,... Usually,  passwords are stored as hashcodes rather than plain text in databases, by using some special hashing algorithms, to prevent against thread. 

Password cracking is process of recovering passwords from data that have been stored in the system. A common approach is to try to guess repeatedly for the password and check against an available cryptographic hash of the password. The larger probability password have, the longer time for guessing.GPU is usually used to get faster process because it can operate more guesses per second.

The useful of password cracker: can use to recover a forgotten password, gaining unauthorized access to a system or checking for easily crackable passwords.

In this project, I will introduce one of the best password cracker – John the Ripper,its installation on parallel and how to run it for recover and checking crackable password purposes.

## Prerequisites
- OpenSSL.
- GCC.
- John-1.8.0
- OpenMPI.
- OpenCL.

## Installing
Install MPI
```sudo apt-get install libcr-dev mpich2 mpich2-doc
```
Install OpenCL
```sudo apt install ocl-icd-opencl-dev
```
Building John the Ripper with OpenSSL
Replace number_of_cores by one of cores you want to running John the Ripper
```export N=number_of_cores
```
execute file
```chmod +x Build_Johntheripper.sh Build_Johntheripper
```
Building Cracking Programe
```bash Build_Johntheripper
```
## Testing
Go to run directory
```cd $HOME/Ripper/JohnTheRipper/run
```
Check the efficiency of John on your system by running it in test mode
```mpirun -np ${N} ./john -test
```
#compare eficiency of system with different cores
```mpirun -np 2 ./john --test=10 --format=raw-sha1-linkedin
mpirun -np 4 ./john --test=10 --format=raw-sha1-linkedin
```

## Recover a forgotten password
Taking hashing password from system
```sudo unshadow /etc/passwd /etc/shadow > passfile2.txt
mpirun -np ${N} ./john --wordlist=combo_not.txt passfile2.txt
```

## Checking crackable password
Replace your_password by password you like to check
```export passwd=your_password
chmod +x Build_Mkpasswd.sh Build_Mkpasswd
bash Build_Mkpasswd
```
