1. `ssh-keygen -t rsa -b 4096 -C "[your email]"`
2. `cat ~/.ssh/id-rsa.pub`: to view the ssh file's content.
3. Copy the ssh file and go to profile settings -> ssh and gpg keys -> Paste the key.
4. `ssh -T git@github.com`: to test your public key.