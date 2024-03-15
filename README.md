# wsl-ssh-agent
## Description
Allows you to use ssh keys through ssh-agent on Windows in WSL2 machine.
Works with Keepass [KeeAgent](https://github.com/dlech/KeeAgent) plugin or open-ssh-agent.
This approach uses [npiperelay.exe](https://github.com/jstarks/npiperelay) to forward Windows named pipe into WSL2.

## Dependencies
- WSL2. You can check version with `wsl --list --verbose`
- `socat` installed in your WSL.
```
sudo apt install socat
```

## Installation
- Dowload repository as zip
- Extract files
- Run install.sh in WSL2
```
sudo install.sh
```

## Manual installation
- download [npiperelay](https://github.com/jstarks/npiperelay) and extract `npiperelay.exe` to `/usr/local/bin/npiperelay.exe`
- copy `wsl-ssh-agent-forwarder` to `/usr/local/bin/wsl-ssh-agent-forwarder`
- set execution permissions to `wsl-ssh-agent-forwarder` and `npiperelay.exe`
- add line `. /usr/local/bin/wsl-ssh-agent-forwarder` to `~/.bashrc`

## Origin
Based on [strarsis Gist](https://gist.github.com/strarsis/e533f4bca5ae158481bbe53185848d49)

## systemd
It is possible to use systemd service on WSL2 0.67+ instead.
Update your wsl by command `wsl --update --web-download`
Check what systemd enabled in `/etc/wsl.conf`
```
[boot]
systemd=true
```

Copy `wsl-ssh-agent-relay.`service to `/etc/systemd/system` folder.
```
systemctl daemon-reload
systemctl start wsl-ssh-agent-relay.service
systemctl enable wsl-ssh-agent-relay.service
```

Add `export SSH_AUTH_SOCK=/var/run/wsl-ssh-agent.sock` into `~/.bashrc`

# WSL docker wrapper
## Description
Wrapper allows using docker command directly from windows converting Windows paths to paths inside WSL.

## Installation
Uninstall docker-cli if it's installed.

Copy `docker.bat` into any location added to PATH. `C:\bin` for example

Copy `wsl-docker-wrapper` into `/usr/local/bin` inside WSL

Set execute permission `chmod +x /usr/local/bin/wsl-docker-wrapper`

Now you will be able to use docker commands from Windows and don't care about paths while mounting volumes.
