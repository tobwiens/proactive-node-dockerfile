# Use proactive scheduler image and change the entrypoint
FROM tobwiens/proactive-scheduler:8.4.0-SNAPSHOT-examples

RUN ["/bin/bash", "-c", "apt-get update && apt-get install python-pip -y"]

RUN pip install py4j

ENTRYPOINT ["/home/paserver/data/scheduling/bin/proactive-node", "-Dproactive.useIPaddress=true"]
