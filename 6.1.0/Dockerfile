# Use proactive scheduler and change the entrypoint
FROM tobwiens/proactive-scheduler:6.1.0
MAINTAINER Tobias Wiens <https://github.com/tobwiens/proactive-node-dockerfile/>

# Install tools
RUN ["/bin/bash", "-c", "apt-get install curl -y"]

# Install the docker deamon inside the node; for the docker support.
RUN wget -qO- https://get.docker.com/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Install docker compose
RUN curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Add docker-compose addon to the ProActive node
ADD addons/jsr223-docker-compose-0.1.jar /data/scheduling/addons/

# Add docker compose addon configuration file
ADD config/docker-compose.properties /data/scheduling/addons/config/

### VOLUMES
VOLUME /var/lib/docker # It cannot be AUFS - so make it a volume

# Run proactive scheduler with zero nodes and start the docker daemon with /usr/local/bin/wrapdocker
ADD container-start-script.sh /
RUN chmod +x /container-start-script.sh
ENTRYPOINT ["/container-start-script.sh", "-Dproactive.useIPaddress=true"]
