
| Command | Description                                       |
| ------- | ------------------------------------------------- |
| ps      | Report a snapshot of current processes            |
| top     | Show running processes in a table view            |
| htop    | Show running processes in a more interactive view |
| kill    | Send a signal to a process                        |
| pkill   | Kill a process by its name                        |
| nice    | Set the priority of a process before starting it  |
| renice  | Modify the priority of a running process          |

---
##### List all running processes
```bash
ps aux
```
- `ps`: is the process status command.
- `a`: displays information about other users' processes as well as your own.
- `u`: displays the processes belonging to the specified usernames.
- `x`: includes processes that do not have a controlling terminal.
or use `top` for a specific user:
```bash
top -u user
```
---
##### Kill a process
1) Get the process ID (firefox for example)
```bash
ps -e | grep -i firefox
```
or
```bash
pgrep firefox
```
2) Kill the process by sending a kill signal (`SIGKILL`)
```bash
kill -9 [PID]
```
or you can simply do that in 1 step:
```bash
kill -9 $(pgrep firefox)
```
or you can use `pkill` command to kill by process name:
```bash
pkill firefox
```
---
##### Priority of processes
Assume you want to run a script with a higher priority to make the CPU allocate more time and focus on that script.
You can use `nice` command:
```bash
nice -n 3 ./test.sh
```
The higher the nice value, the lower the priority and vice versa.

After some time you want to change the priority of that script **without closing the process**, so you enter `htop` command and start looking for that process's ID, then you can use `renice` command:
```bash
renice -n [new_nice] -p [PID]
```
