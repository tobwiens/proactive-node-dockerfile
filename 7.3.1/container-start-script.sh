#!/bin/bash

# This bash script will be set as ENTRYPOINT, all additional arguments to the proactive node
# can be set in the COMMAND/CMD which will be propagated to the bash script as argument. 
# Those arguments will be added to the ProActive node exeuction via $@

echo "Start docker daemon"
service docker start

echo "Start ProActive node: /data/scheduling/bin/proactive-node $@"
/data/scheduling/bin/proactive-node "$@"
