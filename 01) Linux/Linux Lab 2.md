1. List the user commands and redirect the output to `/tmp/commands.list`:
```bash
man -k . | awk '{print $1}' > /tmp/commands.list
```
2. Count the number of user commands:
```bash
wc -l /tmp/commands.list | awk '{print $1}'
```
3. Get all the users names whose first character in their login is ‘g’:
```bash
awk -F: '{ if ($7 != "/usr/sbin/nologin" && $7 != "/bin/false" && $7 != "/bin/sync" && substr($1, 1, 1) == "g") print $1 }' /etc/passwd
```
4. Get the logins name and full names (comment) of logins starts with “g”:
```bash
awk -F: '{ if ($7 != "/usr/sbin/nologin" && $7 != "/bin/false" && $7 != "/bin/sync" && substr($1, 1, 1) == "g") print "username: " $1, "comment: " $5 }' /etc/passwd
```
5. Save the output of the last command sorted by their full names in a file:
```bash
awk -F: '{ if ($7 != "/usr/sbin/nologin" && $7 != "/bin/false" && $7 != "/bin/sync" && substr($1, 1, 1) == "g") print "username: " $1, "comment: " $5 }' /etc/passwd > users.txt
```
6. Write two commands:
- first: to search for all files on the system that named `.bash_profile`.
```bash
find / -name ".bash_profile"
```
- ==Second==: sorts the output of ls command on / recursively, Saving their output and error in 2 different files and sending them to the background.
```bash

```
7. Display the number of users who is logged now to the system:
```bash
who | wc -l
```
8. Display lines 7 to line 10 of `/etc/passwd` file:
```bash
sed -n '7,10p' /etc/passwd
```
9. What happens if you execute:
```bash
cat filename1 | cat filename2
```
- Prints `filename2` contents
```bash
ls | rm
```
- Error rm: Missing operand
```bash
ls /etc/passwd | wc –l
```
- Prints 1
10. Issue the command sleep 100:
```bash
sleep 100
```
11. Stop the last command:
```bash
^Z   # (SIGSTOP) # ^C to kill it (SIGINT)
```
12. Resume the last command in the background:
```bash
bg [jobID]
```
13. Issue the jobs command and see its output:
```bash
jobs   # Lists the background processes
```
14. Send the sleep command to the foreground and send it again to the background:
```bash
fg [jobID]
^Z   # SIGSTOP
bg [jobID]
```
15. Kill the sleep command:
```bash
ps   # Get the process ID
kill -9 [PID]
```
16. Display your processes only:
```bash
top -u [username]   # get username using $(whoami)
```
17. Display all processes except yours:
```bash
top | grep -v [username]   # get username using $(whoami)
```
18. Use the `pgrep` command to list your processes only:
```bash
pgrep -u [username]   # get username using $(whoami)
```
19. 