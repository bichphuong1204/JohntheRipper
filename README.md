# JohntheRipper
## Abstract

Password is one of the most important authentication nowadays. We can meet them every walks of life, for example: ATM, social networks, e-services,... Usually,  passwords are stored as hashcodes rather than plain text in databases, by using some special hashing algorithms, to prevent against thread. 

Password cracking is process of recovering passwords from data that have been stored in the system. A common approach is to try to guess repeatedly for the password and check against an available cryptographic hash of the password. The larger probability password have, the longer time for guessing.GPU is usually used to get faster process because it can operate more guesses per second.

The useful of password cracker: can use to recover a forgotten password, gaining unauthorized access to a system or checking for easily crackable passwords.

In this project, I will introduce one of the best password cracker – John the Ripper,its installation and how to run it on parallel for recover and checking crackable password purposes.

## Principle

### Hashing password
Passwords are stored as hashes rather than plain text in databases by using some special hashing algorithms, to prevent against thread. When a system get a input password, it will automatically transform that password to a set of digits with certain length (called hashes) in some rules so that that every times we input that password, we will get exactly same hash.
Hashing algorithms differ in the way they work and the most notable difference is the length of the number each one spits out.

### Salt 
Salt is a random small piece of text that is added at the beginning of the password before hashing process. The final hash will content a part of salt hash which is stored together with salt text in system. By this way, the hashes would be more complicated to crack.

### Password cracking
Password cracking is the process of recovering passwords from hashes.
Some popular techniques used in Password cracking:
- Dictionary attack: This uses a big dictionary that contain common passwords and their hashes, and try to find a matching hashes pair with checking hash.
- Brute force attack: This works through all possible alpha-numeric combination and try to match their hashes with checking hash.
- Rainbow table attack: A rainbow table is a list of pre-computed hashes - the numerical value of an encrypted password, used by most systems today - and that’s the hashes of all possible password combinations for any given hashing algorithm. This work try to compare those hashes to the checking hashes 

### Strength of password is various
Strength of a password is depend on its length and diversity of character type.
  - A password have 4 characters of number : 10.000 possible passwords.
  - A password have 4 characters of number, upper and lower case : 14.776.336 possible passwords.
  - A password have 4 characters of number, upper and lower case, symbol : 81.450.625 possible passwords.
  - A password have 6 characters of number, upper and lower case, symbol : 735.091.890.625 possible passwords.
  - A password have 8 characters of number, upper and lower case, symbol : 6.634.204.312.890.625 possible passwords.
The more number of characters your password is made up, the larger number of possible passwords.

### Parallel computing in Password cracking
Estimating time for Intel core i5 7th 4x2.5Ghz to cracking password of 8 characters without salt: 184 hours. This work will take a huge time and can effect seriously to your CPU.

Parallel system can do the bigger number of Flops, allow us make several more guesses passwords per second.

Modern graphics processing hardware (GPUs) is very good at hashing which can accelerate the cracking process thousand time compare to the parallel CPU system.

### John the Ripper
Can runs on fifteen different platforms.

Combines a number of password crackers into one package, autodetects password hash types, and includes a customizable cracker.

Can be run against various encryptedpassword formats including several crypt password hash types most commonly found on various Unix versions (based on DES, MD5, or Blowfish), KerberosAFS, and Windows NT/2000/XP/2003 LM hash.

## Prerequisites
- OpenSSL.
- GCC.
- John-1.8.0
- OpenMPI.
- OpenCL.

## Running John Benchmark
### Hardware
2 nodes, each node : 2 x Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz (20 cores total)
NVIDIA Tesla P100 GPU
### Install and running
```
bash Build_Johntheripper_Rocket
```
### Result
#### For 2 Nodes (20 cores in total)
```
Node numbers 1-16 of 16 (MPI)
Benchmarking: descrypt, traditional crypt(3) [DES 128/128 AVX-16]... (16xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^HDONE
Many salts:     52797K c/s real, 53330K c/s virtual
Only one salt:  49692K c/s real, 49692K c/s virtual

Benchmarking: bsdicrypt, BSDI crypt(3) ("_J9..", 725 iterations) [DES 128/128 AVX-16]... (16xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Many salts:     1867K c/s real, 1867K c/s virtual
Only one salt:  1724K c/s real, 1742K c/s virtual

Benchmarking: md5crypt, crypt(3) $1$ [MD5 128/128 AVX 12x]... (16xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    473664 c/s real, 473664 c/s virtual

Benchmarking: bcrypt ("$2a$05", 32 iterations) [Blowfish 32/64 X3]... (16xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    2780 c/s real, 2780 c/s virtual

Benchmarking: scrypt (16384, 8, 1) [Salsa20/8 128/128 AVX]... (16xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^HDONE
Raw:    44.0 c/s real, 44.0 c/s virtual
```
```
Node numbers 1-32 of 32 (MPI)
Benchmarking: descrypt, traditional crypt(3) [DES 128/128 AVX-16]... (32xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^HDONE
Many salts:     108462K c/s real, 109557K c/s virtual
Only one salt:  107921K c/s real, 107921K c/s virtual

Benchmarking: bsdicrypt, BSDI crypt(3) ("_J9..", 725 iterations) [DES 128/128 AVX-16]... (32xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Many salts:     3920K c/s real, 3920K c/s virtual
Only one salt:  3639K c/s real, 3676K c/s virtual

Benchmarking: md5crypt, crypt(3) $1$ [MD5 128/128 AVX 12x]... (32xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    1019K c/s real, 1029K c/s virtual

Benchmarking: bcrypt ("$2a$05", 32 iterations) [Blowfish 32/64 X3]... (32xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    6048 c/s real, 6048 c/s virtual

Benchmarking: scrypt (16384, 8, 1) [Salsa20/8 128/128 AVX]... (32xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^HDONE
Raw:    96.6 c/s real, 96.6 c/s virtual
```
```
Node numbers 1-64 of 64 (MPI)
Benchmarking: descrypt, traditional crypt(3) [DES 128/128 AVX-16]... (64xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^HDONE
Many salts:     210558K c/s real, 212685K c/s virtual
Only one salt:  212869K c/s real, 215019K c/s virtual

Benchmarking: bsdicrypt, BSDI crypt(3) ("_J9..", 725 iterations) [DES 128/128 AVX-16]... (64xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Many salts:     7974K c/s real, 7974K c/s virtual
Only one salt:  7450K c/s real, 7526K c/s virtual

Benchmarking: md5crypt, crypt(3) $1$ [MD5 128/128 AVX 12x]... (64xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    2057K c/s real, 2057K c/s virtual

Benchmarking: bcrypt ("$2a$05", 32 iterations) [Blowfish 32/64 X3]... (64xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    12096 c/s real, 12096 c/s virtual

Benchmarking: scrypt (16384, 8, 1) [Salsa20/8 128/128 AVX]... (64xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^HDONE
Raw:    192 c/s real, 194 c/s virtual
```
```
Node numbers 1-128 of 128 (MPI)
Benchmarking: descrypt, traditional crypt(3) [DES 128/128 AVX-16]... (128xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^HDONE
Many salts:     408031K c/s real, 412152K c/s virtual
Only one salt:  408686K c/s real, 412814K c/s virtual

Benchmarking: bsdicrypt, BSDI crypt(3) ("_J9..", 725 iterations) [DES 128/128 AVX-16]... (128xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Many salts:     15388K c/s real, 15388K c/s virtual
Only one salt:  14398K c/s real, 14398K c/s virtual

Benchmarking: md5crypt, crypt(3) $1$ [MD5 128/128 AVX 12x]... (128xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    3995K c/s real, 3995K c/s virtual

Benchmarking: bcrypt ("$2a$05", 32 iterations) [Blowfish 32/64 X3]... (128xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    23418 c/s real, 23418 c/s virtual

Benchmarking: scrypt (16384, 8, 1) [Salsa20/8 128/128 AVX]... (128xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^HDONE
Raw:    380 c/s real, 380 c/s virtual
```
```
Node numbers 1-256 of 256 (MPI)
Benchmarking: descrypt, traditional crypt(3) [DES 128/128 AVX-16]... (256xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^HDONE
Many salts:     822796K c/s real, 831107K c/s virtual
Only one salt:  821035K c/s real, 821035K c/s virtual

Benchmarking: bsdicrypt, BSDI crypt(3) ("_J9..", 725 iterations) [DES 128/128 AVX-16]... (256xMPI) /^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Many salts:     30845K c/s real, 30845K c/s virtual
Only one salt:  28813K c/s real, 28813K c/s virtual

Benchmarking: md5crypt, crypt(3) $1$ [MD5 128/128 AVX 12x]... (256xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    7925K c/s real, 7925K c/s virtual

Benchmarking: bcrypt ("$2a$05", 32 iterations) [Blowfish 32/64 X3]... (256xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^HDONE
Raw:    46395 c/s real, 46395 c/s virtual

Benchmarking: scrypt (16384, 8, 1) [Salsa20/8 128/128 AVX]... (256xMPI) -^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^HDONE
Raw:    757 c/s real, 757 c/s virtual
```
#### For 2 Nodes (20 cores) and 1 GPU


## Building on small cluster for cracking process
### Installing
Install MPI
```
sudo apt-get install libcr-dev mpich2 mpich2-doc
```

Install OpenCL
```
sudo apt install ocl-icd-opencl-dev
```

Install mkpasswd
```
sudo apt-get install whois
```

Building John the Ripper with OpenSSL
Replace number_of_cores by one of cores you want to running John the Ripper
```
export N=number_of_cores
```

Execute file
```
chmod +x Build_Johntheripper.sh
```

Building Cracking Programe
```
bash Build_Johntheripper.sh
```

### Testing
Go to run directory
```
cd $HOME/Ripper/JohnTheRipper/run
```

Check the efficiency of John on your system by running it in test mode
```
mpirun -np ${N} ./john -test
```

Compare eficiency of system with different cores
```
mpirun -np 2 ./john --test=10 --format=raw-sha1-linkedin
mpirun -np 4 ./john --test=10 --format=raw-sha1-linkedin
```

### Recover a forgotten password
Taking hashing password from system
```
sudo unshadow /etc/passwd /etc/shadow > passfile2.txt
mpirun -np ${N} ./john --wordlist=combo_not.txt passfile2.txt
```

### Checking crackable password
Replace your_password by password you like to check
```
export passwd=your_password
chmod +x Build_Mkpasswd.sh
bash Build_Mkpasswd.sh
```
### Example result
```
Using default input encoding: UTF-8
Loaded 1 password hash (md5crypt, crypt(3) $1$ [MD5 256/256 AVX2 8x3])
MPI in use, disabling OMP (see doc/README.mpi)
Node numbers 1-4 of 4 (MPI)
Send SIGUSR1 to mpirun for status
banana           (?)
1 1g 0:00:00:00 DONE 2/3 (2018-04-29 02:26) 3.448g/s 2648p/s 2648c/s 2648C/s leslie..bigben
Waiting for other nodes to terminate
3 0g 0:00:00:08 DONE 2/3 (2018-04-29 02:27) 0g/s 3251p/s 3251c/s 3251C/s Trapper4..Zephyr?
2 0g 0:00:00:08 DONE 2/3 (2018-04-29 02:27) 0g/s 2921p/s 2921c/s 2921C/s Huey!..Disney7
4 0g 0:00:00:08 DONE 2/3 (2018-04-29 02:27) 0g/s 2906p/s 2906c/s 2906C/s Black9..Jack9

```
```
MPI in use, disabling OMP (see doc/README.mpi)
Node numbers 1-40 of 40 (MPI)
/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H/^H-^H\^H|^H ^HSend SIGUSR1 to mpirun for status
phuong           (?)
22 1g 0:00:14:07 DONE 3/3 (2018-04-29 02:54) 0.001179g/s 454.7p/s 454.7c/s 454.7C/s phevu*..phuork
```
## Conclusion


