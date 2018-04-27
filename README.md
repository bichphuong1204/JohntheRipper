# JohntheRipper
## Abstract

Password is one of the most important authentication nowadays. We can meet them every walks of life, for example: ATM, social networks, e-services,... Usually,  passwords are stored as hashcodes rather than plain text in databases, by using some special hashing algorithms, to prevent against thread. 

Password cracking is process of recovering passwords from data that have been stored in the system. A common approach is to try to guess repeatedly for the password and check against an available cryptographic hash of the password. The larger probability password have, the longer time for guessing.GPU is usually used to get faster process because it can operate more guesses per second.

The useful of password cracker: can use to recover a forgotten password, gaining unauthorized access to a system or checking for easily crackable passwords.

In this project, I will introduce one of the best password cracker – John the Ripper,its installation tutorial with GPU and how it useful in crackable password checking.

### Prerequisites
- OpenSSL.
- Cuda.
- GCC.
- John-1.8.0
- OpenMPI

