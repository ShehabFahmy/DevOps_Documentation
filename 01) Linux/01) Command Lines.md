|     | Command                            | Description                                                                                     |
| :-: | ---------------------------------- | ----------------------------------------------------------------------------------------------- |
|  A  | apt                                | Package Manager for downloading                                                                 |
|  C  | cal                                | Prints the calendar                                                                             |
|     | cal 10 1999                        | Prints the calendar of October, 1999                                                            |
|     | cat xFile                          | Views "xFile"                                                                                   |
|     | cd xFolder                         | Change directory to go to "xFolder"                                                             |
|     | cd ..                              | Go back in directory tree                                                                       |
|     | cd ../..                           | Go back Twice in directory tree                                                                 |
|     | cd \| cd / \| cd $home \| cd $HOME | Go back to root                                                                                 |
|     | cd -                               | Go back to the last visited folder (even if not in directory tree)                              |
|     | clear \| Ctrl + l                  | Clears the terminal                                                                             |
|     | cp xFile /root/xFolder             | Copy "xFile" to "xFolder"                                                                       |
|     | cp xFile ..                        | Copy "xFile" to parent directory                                                                |
|  D  | date                               | Prints the date                                                                                 |
|     | diff xFile.txt yFile.txt           | Shows the differences between "xFile.txt" and "yFile.txt" by comparing them line by line        |
|  E  | echo 'Hello World'                 | Prints "Hello World"                                                                            |
|     | echo $HOME                         | Prints root path                                                                                |
|     | echo "Hello" >> xFile              | Appends "Hello" to "xFile"                                                                      |
|     | echo "Hello" > xFile               | Creates/Overwrites "xFile" to contain "Hello" only                                              |
|  F  | file xFile.txt                     | Shows the file type of xFile.txt                                                                |
|     | find [path] [expression]           | Searches for files and directories in a directory hierarchy                                     |
|     | find . -name "*.txt"               | Find all .txt files in the current directory and its sub-directories                            |
|     | find . -type f -mtime -7           | Find all files modified in the last 7 days                                                      |
|     | find . -name "*.log" -delete       | Find and delete all .log files                                                                  |
|  G  | grep [options] [pattern] [file]    | Searches for patterns in files                                                                  |
|     | grep "error" xFile.txt             | Search for the word "error" in xFile.txt                                                        |
|     | grep -r "error"                    | Search recursively in all files under the current directory                                     |
|  I  | id [username]                      | Shows User ID, Group ID and group memberships                                                   |
|  L  | ls                                 | List files in the current directory                                                             |
|     | ls -a                              | List files with more details                                                                    |
|     | ls -d */                           | List directories only                                                                           |
|     | ls -l                              | List hidden files too                                                                           |
|     | ls -al \| ls -la                   | List all files with more details                                                                |
|     | ls -R                              | List all directories and sub-directories                                                        |
|     | ls *s                              | List anything that ends with letter "s" (Regex)                                                 |
|  M  | man [any command]                  | Opens the manual of a certain command                                                           |
|     | mkdir xFolder                      | Creates a directory named "xFolder"                                                             |
|     | mkdir -p xF/yF/zF                  | Creates a tree of directories (zF in yF in xF)                                                  |
|     | mv xFile /root/xFolder             | Moves "xFile" from current directory to "xFolder"                                               |
|     | mv xFile yFile                     | Renames "xFile" to "yFile"                                                                      |
|  P  | pwd                                | Prints the path name for our ==p==resent ==w==orking ==d==irectory                              |
|  R  | rm xFile                           | Removes "xFile"                                                                                 |
|     | rm *                               | Removes all files in current directory                                                          |
|     | rm -r xFolder                      | Removes a non-empty directory Recursively                                                       |
|     | rm xFile\[1-4]                     | Removes files named "xFile1", "xFile2", ..., "xFile4"                                           |
|     | rmdir xFolder                      | Removes the directory named "xFolder"                                                           |
|  S  | stat xFile.txt                     | Displays information such as file size, permissions, and last modification time                 |
|     | sudo su                            | Switch to Super User                                                                            |
|  T  | touch xFile                        | Creates a file called "xFile"                                                                   |
|     | touch file{1..10}                  | Creates 10 files named "file1", ..., "file10"                                                   |
|     | touch .secret_file                 | Creates a hidden file named "secret_file"                                                       |
|     | type [command]                     | Indicates whether that command is a shell builtin, an alias, a function, or an external command |
|  V  | vi xFile                           | Opens "xFile"                                                                                   |
|  W  | which [command]                    | Displays the path to that command binary                                                        |
|     | who                                | Displays the list of users currently logged in, with some details                               |
|     | whoami                             | Prints the name of the user executing the command                                               |
|     | :wq!                               | Closes a  file in Vim (w: save, q: close, !: force)                                             |
