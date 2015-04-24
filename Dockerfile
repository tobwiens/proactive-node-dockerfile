# Use proactive scheduler and change the entrypoint
FROM tobwiens/proactive-scheduler:latest
MAINTAINER Tobias Wiens <tobwiens@gmail.com>

# Install the docker deamon inside the node; for the docker support.
RUN wget -qO- https://get.docker.com/ | sh

# Run proactive scheduler with zero nodes
ENTRYPOINT ["/data/scheduling/bin/proactive-node", "-Dproactive.useIPaddress=true"]
