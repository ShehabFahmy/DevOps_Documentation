1) Create a user account with the following attribute
	- Username: `gooduser`
	- Full name/comment: `Good User`
	- Password: `gooduser`
```
sudo useradd gooduser -c "Good User"
sudo passwd gooduser
```
2) Create a user account with the following attribute
	- Username: `baduser`
	- Full name/comment: `Bad User`
	- Password: `baduser`
```
sudo useradd baduser -c "Bad User"
sudo passwd baduser
```
3) Create a supplementary (Secondary) group called `pgroup` with group ID of `30000`
```
sudo groupadd pgroup -g 30000
```
4) Create a supplementary group called `badgroup`
```
sudo groupadd badgroup
```
5) Add `gooduser` to the `pgroup` group as a supplementary group
```
sudo usermod gooduser -a -G pgroup
```
6) Modify the password of `gooduser`'s account to `password`
```
sudo passwd gooduser
```
7) Modify `gooduser`'s account so the password expires after `30` days
```
sudo chage -E 30 gooduser
```
8) Lock `baduser` account so he can't log in
```
sudo passwd -l baduser
```
9) Delete bad user account
```
sudo userdel baduser
```
10) Delete the supplementary group called `badgroup`
```
sudo groupdel badgroup
```
11) Create a folder called `myteam` in your home directory and change its permissions to read only for the owner
```
cd ~
mkdir myteam
chmod 400 myteam
```
or if you want to keep other permissions except user
```
chmod u=r myteam
```
==12)== Log out and log in by another user
```

```
13) List the available shells in your system
```
cat /etc/shells
```
==14)== List the environment variables in your current shell
```
set
```
15) List all of the environment variables for the bash shell
```
env
```
16) What are the commands that list the value of a specific variable?
```
echo $VARIABLE
printenv VARIABLE
```
17) Display your current shell name
```
echo $SHELL
```
==18)== State the initialization files of: sh, ksh, bash
```

```