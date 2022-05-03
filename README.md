# Description
Allows you to use ssh keys through ssh-agent on Windows in WSL2 machine.
Works with Keepass [KeeAgent](https://github.com/dlech/KeeAgent) plugin or open-ssh-agent.
This approach uses [npiperelay.exe](https://github.com/jstarks/npiperelay) to forward Windows named pipe into WSL2.

# Dependencies
- WSL2. You can check version with `wsl --list --verbose`
- `socat` installed in your WSL.
```
sudo apt install socat
```

# Installation
- Dowload repository as zip
- Extract files
- Run install.sh in WSL2
```
sudo install.sh
```

# Manual installation
- download [npiperelay](https://github.com/jstarks/npiperelay) and extract `npiperelay.exe` to `/usr/local/bin/npiperelay.exe`
- copy `wsl-ssh-agent-forwarder` to `/usr/local/bin/wsl-ssh-agent-forwarder`
- set execution permissions to `wsl-ssh-agent-forwarder` and `npiperelay.exe`
- add line `. /usr/local/bin/wsl-ssh-agent-forwarder` to `~/.bashrc`

# Origin
Based on [strarsis Gist](https://gist.github.com/strarsis/e533f4bca5ae158481bbe53185848d49)
