
| Command | Description                  |
| ------- | ---------------------------- |
| chmod   | Change file mode bits        |
| chown   | Change file owner and group  |
| chgrp   | Change group ownership       |
| umask   | Set default file permissions |

---
## File Permissions
When checking a directory details,
```bash
ls -l
```
we can see each file with some information:
1) 10 char placeholders:
	- 1: whether its a directory or not (`d` for directory, `-`for not).
	- 2 to 5: read-write-exec (`rwx`) permissions for user.
	- 5 to 8: read-write-exec (`rwx`) permissions for group.
	- 8 to 10: read-write-exec (`rwx`) permissions for other.
2) Owner of the file/directory.
3) Group owner of the file/directory.
4) Size of file in bytes.
5) Last modification date and time.
6) File/Dir name.

| Permission Letters | Description                                     |
| ------------------ | ----------------------------------------------- |
| `r`                | Read the file's contents                        |
| `w`                | Write or modify the file's contents             |
| `x`                | Execute the file, only if the file is a program |

| Operator | Description                         |
| -------- | ----------------------------------- |
| `+`      | Add permissions                     |
| `-`      | Remove permissions                  |
| `=`      | Set permissions to a specific value |

| Letter | Class     | Description                                                                                                                                     |
| ------ | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `u`    | user      | The user permissions apply only to the owner of the file or directory, they will not impact the actions of other users.                         |
| `g`    | group     | The group permissions apply only to the group that has been assigned to the file or directory, they will not affect the actions of other users. |
| `o`    | others    | The other permissions apply to all other users on the system, this is the permission group that you want to watch the most.                     |
| `a`    | all three | All three (owner, groups, others).                                                                                                              |

---
## Changing File Permissions
Lets assume you want to give "execute" permission to the world ("other") for file "xFile.txt":
```bash
chmod o+x xFile.txt
```
You can also change multiple permissions at once. For example, if you want to take all permissions away from everyone, you would type:
```bash
chmod ugo-rwx xFile.txt
```
Another example, add read(r) and write(w) permission to both user(u) and group(g) and revoke execute(x) permission from others(o):
```bash
chmod ug+rw,o-x xFile.txt
```
or
```bash
chmod ug=rw,o-x xFile.txt
```

##### You can also use octal notations like this:

| Octal | Binary | File Mode |
| ----- | ------ | --------- |
| 0     | 000    | ---       |
| 1     | 001    | --x       |
| 2     | 010    | -w-       |
| 3     | 011    | -wx       |
| 4     | 100    | r--       |
| 5     | 101    | r-x       |
| 6     | 110    | rw-       |
| 7     | 111    | rwx       |
Examples:
```bash
chmod ugo+rwx [file_name]  
chmod 777 [file_name]
```
```bash
chmod u=r,g=wx,o=rx [file_name]  
chmod 435 [file_name]
```

##### Changing Permissions for Multiple Files Simultaneously:
For instance, to set read and write permissions for the owner and read-only permissions for the group and others for all text files in the directory:
```bash
chmod 644 *.txt
```
---
## Changing File Ownership
To change the owner of a file, you can use the `chown` command.
For example : If we want to changes the owner to "new_owner" and the group to "new_group":
```bash
chown new_owner:new_group filename
```
---
## Changing File Group Ownership
To change the group ownership of a file, you can use the `chgrp` command.
For a single file:
```bash
chgrp developers file.txt
```
For multiple files:
```bash
chgrp developers file1.txt file2.txt file3.txt
```
Here, "file1.txt", "file2.txt", and "file3.txt" will all be assigned to the "developers" group.

---
## Changing Default File Permissions
The `umask` command in Linux is used to set default permissions for files or directories the user creates.
Entering `umask` command, :
```bash
umask
```
outputs the default permissions of the present working directory, like:
```bash
0002
```
Here the first digit, 0 is called the sticky bit, it is a special security feature.
The next three digits (002) represent the octal values of the `umask` for a file/dir.
The difference between `chmod` and `umask`:
***`umask` changes the default permissions and thus the permissions for all newly created files and folders, while `chmod` sets permissions for files and folders that already exist**.*
