## Method #1
1. Switch to master:
```sh
git checkout to master
```
2. Merge the branch with master:
```sh
git merge <branch-name>
```
3. Merge master with the centralized server:
```sh
git push origin master
```
## Method #2
Making a Pull Request when merging the branch with origin:
```sh
git push origin <branch-name>
```