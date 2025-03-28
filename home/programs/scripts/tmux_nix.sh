#!/usr/bin/env bash

i=0
sesh="NixDots"

# Check if the session already exists
while tmux has-session -t $sesh 2>/dev/null; do
	((i++))
	sesh="NixDots$i"
done
tmux new -d -s $sesh -c /etc/nixos

tmux new-window -c /etc/nixos 

tmux select-window -t ^ 

tmux send-keys "nv.sh" C-m

tmux attach-session -t $sesh

