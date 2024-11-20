Lets assume you are trying to use the `ls` command and we already know that commands are binary files stored in `/bin` directory but you didn't type `/bin/ls` you just used `ls`. So here comes the definition of PATH environment variable `$PATH`.
When you enter
```bash
echo $PATH
```
the output should look like
```bash
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin:/snap/bin
```
these are the paths that the shell searches in for the entered command.
In our example, the `ls` command will be found at `/bin`. You can see that by entering
```bash
which ls
```
Now lets say, you want to create your own command without typing the full path to that command every time.

---
## Adding Commands to PATH
- You can use the `export` command
```bash
export PATH="$PATH:[yourPath without the squared brackets]"
```

^57fed7

but the problem is that the path will be saved for the current session only, that means if you close the terminal or open another one, you won't find your path in `$PATH`.

- Modify `~/.bashrc` file
```bash
vim ~/.bashrc
```
scroll down until you find PATHs (you can type anywhere but try to keep it organized), then add the same [[05. PATH Environment Variable#^57fed7|export]] command and save.
To reprocess the file you can use `source`
```bash
source ~/.bashrc
```
or its shortcut `.`
```bash
. ~/.bashrc
```