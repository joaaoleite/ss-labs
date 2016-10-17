
# SS

## Lab3

#### Documentation
* [Homepage](http://www.cis.syr.edu/~wedu/seed/Labs_12.04/Software/Buffer_Overflow/)
* [Description](http://www.cis.syr.edu/~wedu/seed/Labs_12.04/Software/Buffer_Overflow/Buffer_Overflow.pdf)

#### Required
* [Ubuntu Virtual Machine](http://www.cis.syr.edu/~wedu/SEEDUbuntu12.04.zip)
* `stack.c`
* `call_shellcode.c`
* `exploit.c`

#### Task
Develop a scheme to exploit the Buffer Overflow vulnerability in the program `stack.c` and finally gain the root privilege

#### Solution

1. Disable Ubuntu protections
```
su root
sysctl -w kernel.randomize_va_space=0  # disable space address randomization
exit
```

2. Compile `call_shellcode.c` 
```
gcc -z execstack -o call_shellcode call_shellcode.c
```

3. Compile `stack.c`
```
su root
gcc -o stack -z execstack -fno-stack-protector stack.c
chmod 4755 stack
exit
```

4. Generate `badfile` with `exploit.c`
```
gcc -o exploit exploit.c
./exploit   # create the badfile
```

5. Run
```
./stack
```
