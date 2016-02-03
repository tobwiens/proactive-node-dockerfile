# proactive-node-dockerfile
Docker container which starts a ProActive Node. 

## ProActive Options
Parameters given to the ProActive Node container are forwarded to the ProActive Node itself.
Please find a more detailed documentation about the options at www.doc.activeeon.com

The most important parameter is the -r options, which defines the address of the Resource Manager to which
the Node will connect.
The standard setting (pnp protocol) will follow this pattern:
```
-r pnp://[SCHEDULER_IP]:[SCHEDULER_PORT]/
```

## Starting a ProActive Node
The standard configuration of the ProActive node and server is to use the pnp protocol. That protocol supports
only direct communication and promotion of IP addresses. The ProActive Node promotes itself with the
 IP address of the network interface it was bound to. Therefore we need to give the Docker container access
 to the host machines natwork interfaces. We do that with the Docker run host option:
 ```
 --net=host
 ```
 
 The ProActive Node needs to bind to a network interface. If none standart interface is defined the Node will
 choose one. That is helpful if we have only one network interface, but since we have Docker installed the
 host machine has at least two network interfaces. So we need to specify which interface to bind to.
 We can do that with two options:
 ```
 -Dproactive.net.netmask=46.101.209.33/18
 ```
 or
 ```
 -Dproactive.net.interface=eth0
 ```
 
 The first option takes the interfaces IP address with its netmask in CIDR notation.
 The second option takes the network interface.
 
 Furthermore we want to prevent the ProActive Node to translate hostnames into IP addresses we do that with:
 ```
 -Dproactive.useIPaddress=true
 ```
 The reason is that some networks have private and public IP addresses. We discovered some problems with 
 specific network configurations on public cloud providers. To prevent any issues with public cloud 
 providers or similar network configurations use this options. 
 
 ### Example Docker Command
 ```
 docker run -d --privileged --name pa-node1 --net=host tobwiens/proactive-node:latest -Dproactive.net.netmask=46.101.209.33/18  -Dproactive.useIPaddress=true -r  pnp://46.101.208.219:64738
 ```
 
 ## Why does the ProActive Node container run with --privileged
 
The reason is that ProActive Nodes can start Docker containers. In order to run Docker inside Docker, 
the container needs to have --privileged rights.
If you don't want to give those right to a container, you don't need to. But the Docker feature of
ProActive won't work. 

## How to run without --net=host
The PAMR protocol allows ProActive Nodes to run behind a NAT (the same as inside a Docker container). 
You can find more information about PAMR in the activeeon documentation at: www.doc.activeeon.com

Further, you can contact me through our www.activeeon.com website. Sign up or use the contact form.