# Use proactive scheduler image and change the entrypoint
FROM tobwiens/proactive-scheduler:8.4.0-SNAPSHOT-examples

RUN ["/bin/bash", "-c", "apt-get update && apt-get install python-pip -y"]

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py
RUN python /usr/local/bin/pip install py4j
RUN python /usr/local/bin/pip install numpy
RUN apt-get install -y libssl-dev libcurl4-openssl-dev
RUN apt-get install -y scilab
RUN apt-get install -y mpi-default-bin

# RUN pip install py4j

ENTRYPOINT ["/home/paserver/data/scheduling/bin/proactive-node", "-Dproactive.useIPaddress=true"]
