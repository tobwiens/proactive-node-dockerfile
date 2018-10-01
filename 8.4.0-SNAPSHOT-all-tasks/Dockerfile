# Use proactive scheduler image and change the entrypoint
FROM tobwiens/proactive-scheduler:8.4.0-SNAPSHOT-all-tasks

RUN ["/bin/bash", "-c", "apt-get update && apt-get install -y python curl"]

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py
RUN python /usr/local/bin/pip install py4j
RUN python /usr/local/bin/pip install numpy
RUN apt-get install -y libssl-dev libcurl4-openssl-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y scilab
RUN apt-get install -y mpi-default-bin

RUN ["/bin/bash", "-c", "apt-get update && \
apt-get install r-base \
-y"]


RUN ["/bin/bash", "-c", "apt-get install r-cran-rjava -y"]

# RUN ["/bin/bash", "-c", "apt-get build-dep r-cran-rgl -y"]

RUN apt-get install -y php

RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

ENTRYPOINT ["/home/paserver/data/scheduling/bin/proactive-node", "-Dproactive.useIPaddress=true"]
