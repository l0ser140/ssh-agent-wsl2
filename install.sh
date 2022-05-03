#!/bin/bash
set -e

if ! [ -x "$(command -v socat)" ]; then
    echo 'Error: socat is not installed.' >&2
    exit 1
fi

if ! [ -x "$(command -v unzip)" ]; then
    echo 'Error: unzip is not installed.' >&2
    exit 1
fi

cp wsl-ssh-agent-forwarder /usr/local/bin/
chmod +x /usr/local/bin/wsl-ssh-agent-forwarder

wget https://github.com/jstarks/npiperelay/releases/download/v0.1.0/npiperelay_windows_amd64.zip -O /tmp/npiperelay.zip
unzip -u /tmp/npiperelay.zip npiperelay.exe -d /usr/local/bin/
rm /tmp/npiperelay.zip
chmod +x /usr/local/bin/npiperelay.exe

if [ -z ${SUDO_USER+x} ]; then
    USER_HOME=$HOME
else
    USER_HOME=$(eval echo ~$SUDO_USER)
fi

grep -qxF '. /usr/local/bin/wsl-ssh-agent-forwarder' $USER_HOME/.bashrc || echo -e '# WSL-SSH-agent\n. /usr/local/bin/wsl-ssh-agent-forwarder\n' >> $USER_HOME/.bashrc

if [ ! -d $USER_HOME/.ssh ]; then
    mkdir $USER_HOME/.ssh

    if [ ! -z ${SUDO_USER+x} ]; then
        chown $SUDO_USER:$SUDO_USER $USER_HOME/.ssh
    fi
fi

echo "-----------------------------
Installed.

To reload .bashrc config in current shell run:
source ~/.bashrc

To test ssh-forwarding run:
ssh-add -l"
