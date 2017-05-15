#!/bin/bash

#wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip
wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok.zip
{
    mkfifo foo
    nc -v -lk 8888 0<foo | /bin/bash 1>foo
    # nc -l -v -p 8888 -e /bin/bash
    killall -SIGINT ngrok && echo "ngrok terminated"
} &
{
    ./ngrok tcp 8888 --authtoken=$NGROK_TOKEN --log=stdout --log-level=debug | grep "tcp.ngrok.io" || true
}

