# Use proactive scheduler and change the entrypoint
FROM tobwiens/proactive-scheduler:latest
MAINTAINER Tobias Wiens <tobwiens@gmail.com>

# Run proactive scheduler with zero nodes
ENTRYPOINT ["/data/scheduling/bin/proactive-node", "-Dproactive.useIPaddress=true"]
