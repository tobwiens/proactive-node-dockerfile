# Use proactive scheduler and change the entrypoint
FROM tobwiens/proactive-scheduler:latest
MAINTAINER Tobias Wiens <tobwiens@gmail.com>

# Install the docker deamon inside the node; for the docker support.
RUN wget -qO- https://get.docker.com/ | sh

# Install docker compose
RUN curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Run proactive scheduler with zero nodes
ENTRYPOINT ["/data/scheduling/bin/proactive-node", "-Dproactive.useIPaddress=true"]
