## Managing Users

| Command                             | Description                                                                |
| ----------------------------------- | -------------------------------------------------------------------------- |
| sudo ==adduser== xUser              | Create a new user                                                          |
| sudo ==usermod== -aG sudo xUser     | Modify "xUser" to be in the sudo group (wheel: group of sudoers)           |
| ==passwd==<br>sudo ==passwd== xUser | Change current user's password<br>Change "xUser"'s password from root user |
| sudo ==userdel== xUser              | Delete "xUser"                                                             |
you can switch to a user using this command:
```bash
su xUser
```

In the below table, we can see the files carrying the information of users and groups.

| File         | Description                                                               |
| ------------ | ------------------------------------------------------------------------- |
| /etc/passwd  | Contains users accounts information                                       |
| /etc/shadow  | Contains security information of users accounts (e.g. encrypted password) |
| /etc/group   | Contains groups accounts information                                      |
| /etc/gshadow | Contains security information of groups accounts                          |

---
#### `/etc/passwd` File
is a text file that contains information about all user accounts on the system.
For each user there is a line of information in the below format:
`username:x:uid:gid:comment:home_directory:shell`
- `username`: Login name of the user.
- `x`: Placeholder for the password (hidden for security, located in `/etc/shadow` file).
- `uid`: User ID number.
- `gid`: Group ID number, which links to an entry in `/etc/group` file.
- `comment`: Comment field, typically used for user's full name or other descriptive information.
- `home_directory`: Absolute path to the user's home directory.
- `shell`: Absolute path to the user's login shell.
---
#### `/etc/shadow` File
is a text file that contains security information about all user accounts on the system.
For each user there is a line of information in the below format:
`username:encrypted_password:last_modifi_date:min_age:max_age:warn_period:lock_period`
- `username`: Login name of the user.
- `encrypted_password`: Password encrypted for security.
- `last_modifi_date`: Last modification date (number of days from 1-jan-1970 to the modification date).
- `min_age`: Minimum number of days to wait to change the password again.
- `max_age`: Number of days for the password to expire.
- `warn_period`: Number of days given to the user to change their password before it expires and their account locked as described by next field.
- `lock_period`: Number of days after a password expires before it is locked.

| Command | Description                             |
| ------- | --------------------------------------- |
| chage   | Change user password expiry information |

---
#### `/etc/gshadow` File
is a text file that contains security group account information, including group passwords and administrative rights.
For each group there is a line of information in the below format:
`group_name:password:group_admins:group_members`
- `group_name`: Name of the group.
- `password`: Password of the group, if set (rarely used).
- `group_admins`: Comma-separated list of usernames who are group administrators.
- `group_members`: Comma-separated list of usernames who are members of the group.
---
## Managing Groups

| Command  | Description                                      |
| -------- | ------------------------------------------------ |
| groupadd | Create a new group                               |
| groupmod | Modify a group                                   |
| gpasswd  | Administer `/etc/group` and `/etc/gshadow` files |
| groupdel | Delete a group                                   |
You can show the group of a user using:
```bash
groups xUser
```