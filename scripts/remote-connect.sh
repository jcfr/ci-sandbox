#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip
#wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip "$SCRIPT_DIR/ngrok.zip"
{
    mkfifo pipe
    echo "Executing nc"
    nc -l -v 8888 <pipe | bash >pipe
    killall -SIGINT ngrok && echo "ngrok terminated"
} &
{
    echo "Executing ngrok"
    ./ngrok authtoken $NGROK_TOKEN
    ./ngrok tcp 8888 --log=stdout --log-level=debug
} #&
#{
#  while true; do echo "Wait"; sleep 1; done
#}

