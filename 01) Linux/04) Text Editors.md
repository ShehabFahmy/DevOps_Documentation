Command-line text editors: `GNU Nano`, `Vi`, `Vim`
GUI-based text editors: `gedit`
Both: `emacs`
## Updating your package index files from their sources
```bash
sudo apt update
```
---
## Vim
#### Installing Vim
```bash
sudo apt install vim
```
#### Create/Open a file using Vim
```bash
vim xFile.txt
```
#### Vim has 2 modes:
1. Insert: where you enter text
2. Command: where you do everything else
Command mode ***--press `i`-->*** Insert mode ***--press `esc`-->*** Command mode

| Command mode arguments | Description                      |
| ---------------------- | -------------------------------- |
| :w                     | Save                             |
| :q                     | Quit                             |
| :wq                    | Save and quit                    |
| :q!                    | Force quit / quit without saving |
| :set number            | Show row number                  |
| dd                     | Delete line                      |
| yy                     | Yank (copy) line                 |
| p                      | Paste                            |
| u                      | Undo                             |
| /                      | Search                           |
- You can can customize Vim using `.vimrc` file
---
## Nano
#### Upgrading Nano
```bash
sudo apt upgrade nano
```
#### Create/Open a file using Nano
```bash
nano xFile.txt
```
#### At the bottom of the opened file you can see:

| Key combinations | Description        |
| ---------------- | ------------------ |
| Ctrl + O         | Save               |
| Ctrl + X         | Exit               |
| Ctrl + K         | Cut text           |
| Ctrl + U         | Uncut (paste) text |
| Ctrl + W         | Search             |
| Ctrl + G         | Get help           |
- You can can customize Nano using `.nanorc` file