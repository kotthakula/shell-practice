#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Process instance Id of the script executing now: $$"
sleep 100 &
echo "Process Instance Id of last background command: $!"