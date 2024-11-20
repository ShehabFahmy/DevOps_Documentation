==[[13. Regular Expressions]] lesson is a prerequisite for this lesson.==
## `grep` and `egrep`
- `grep`: Unix utility that searches a pattern through either information piped to it or files.
- `egrep`: extended grep, same as `grep –E`.
- `zgrep`: compressed files.
- Usage: `grep <options> <pattern> <files>`
#### Options:

| Option | Description                                                           |
| ------ | --------------------------------------------------------------------- |
| -i     | Ignore case during search                                             |
| -r, -R | Search recursively                                                    |
| -v     | Invert match i.e. match everything except pattern                     |
| -l     | List files that match pattern                                         |
| -L     | List files that do not match pattern                                  |
| -n     | Prefix each line of output with the line number within its input file |
| -A num | Print num lines of trailing context after matching lines              |
| -B num | Print num lines of leading context before matching lines              |

#### Examples:
- Search files containing the word `bash` in current directory:
```bash
grep bash *
```
- Search files NOT containing the word `bash` in current directory:
```bash
grep -v bash *
```
- Repeat above search using a case insensitive pattern match and print line number that matches the search pattern:
```bash
grep -in bash *
```
- Search files not matching certain name pattern:
```bash
ls | grep -vi name
```
## `sed`
- "stream editor" to parse and transform information –information piped to it or from files.
- Line-oriented, operate one line at a time and allow regular expression matching and substitution.
#### Options/Flags:

| Flag | Description                                                                     |
| ---- | ------------------------------------------------------------------------------- |
| -e   | Combine multiple commands                                                       |
| -f   | Read commands from file                                                         |
| -h   | Print help info                                                                 |
| -n   | Disable printing of whole file (Suppresses automatic printing of pattern space) |
| -V   | Print version info                                                              |
| -r   | Use extended regex                                                              |
#### Commands:

| Command | Description                       |
| ------- | --------------------------------- |
| s       | Substitution                      |
| g       | Global replacement                |
| p       | Print                             |
| i       | Ignore case                       |
| d       | Delete                            |
| G       | Add newline                       |
| w       | Write to file                     |
| x       | Exchange pattern with hold buffer |
| h       | Copy pattern to hold buffer       |
| ;       | Separate commands                 |
#### Examples:
Suppose we have this `hello.sh` script:
```bash
#!/bin/bash

# My First Script

echo "Hello World!”
```
- Delete blank lines from a file:
```bash
sed '/^$/d' hello.sh
```
```
#!/bin/bash
# My First Script
echo "Hello World!"
```
- Delete line n through m in a file (From n to m, including both):
```bash
sed '2,4d' hello.sh
```
```
#!/bin/bash
echo "Hello World!"
```
- Add flag -e to carry out multiple matches:
```bash
cat hello.sh | sed -e 's/bash/tcsh/g' -e 's/First/Second/g'
```
```
#!/bin/tcsh
# My Second Script
echo "Hello World!"
```
Alternate form:
```bash
sed 's/bash/tcsh/g; s/First/Second/g' hello.sh
```
```
#!/bin/tcsh
# My Second Script
echo "Hello World!"
```
- The default delimiter is slash (/), can be changed:
```bash
sed 's:/bin/bash:/bin/tcsh:g' hello.sh
```
```
#!/bin/tcsh
# My First Script
echo "Hello World!"
```
- Replace-in-place with a backup file:
```bash
sed –i.bak '/First/Second/i' hello.sh
```
- `echo` with `sed`:
```bash
echo "shell scripting" | sed "s/[si]/?/g”
```
`?hell ?cr?pt?ng`
```bash
echo "shell scripting 101" | sed "s/[0-9]/#/g”
```
`shell scripting ###`
## `awk`
The `awk` text-processing language is useful for tasks such as:
- Tallying information from text files and creating reports from the results.
- Translating files from one format to another.
- Creating small databases.
- Performing mathematical operations on files of numeric data.
#### How Does `awk` Work?
- `awk` reads the file being processed line by line.
- The entire content of each line is split into columns with space or tab as the delimiter.
- `$0` Prints the entire line.
- `$1`, `$2`, `$3`, ... for each column (if exists).
- `NR`: Number of records (lines).
- `NF`: Number of fields or columns in the current line.
- By default the field delimiter is space or tab. To change the field delimiter use the `-F<delimiter>` command.
#### Syntax:
`awk '<pattern> {action}'`: pattern decides when action is performed.
##### Actions:
- Most common action: `print`
#### Examples:
- Print list of files that are bash script files:
```bash
awk '/^#\!\/bin\/bash/{print $0, FILENAME}' *
```
- Print the lines with `sh` in it and the line after it:
```bash
awk '/sh/{print;getline;print}' < hello.sh
```