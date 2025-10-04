#/bin/bash

while IFS= read -r line; do
  tmux send-keys -t .+ -l " $line "
  #tmux send-keys -t .+ -H $(echo -n $line | xxd -p -u)
done
tmux send-keys -t .+ Enter
