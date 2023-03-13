Task 1
Ans 1:
Output of Nodes:
mininet> nodes
available nodes are: 
c0 h1 h2 h3 h4 h5 h6 h7 h8 s1 s2 s3 s4 s5 s6 s7

Output of net:
mininet> net
h1 h1-eth0:s3-eth2
h2 h2-eth0:s3-eth3
h3 h3-eth0:s4-eth2
h4 h4-eth0:s3-eth4
h5 h5-eth0:s6-eth2
h6 h6-eth0:s6-eth3
h7 h7-eth0:s7-eth2
h8 h8-eth0:s7-eth3
s1 lo:  s1-eth1:s2-eth1 s1-eth2:s5-eth1
s2 lo:  s2-eth1:s1-eth1 s2-eth2:s3-eth1 s2-eth3:s4-eth1
s3 lo:  s3-eth1:s2-eth2 s3-eth2:h1-eth0 s3-eth3:h2-eth0 s3-eth4:h4-eth0
s4 lo:  s4-eth1:s2-eth3 s4-eth2:h3-eth0
s5 lo:  s5-eth1:s1-eth2 s5-eth2:s6-eth1 s5-eth3:s7-eth1
s6 lo:  s6-eth1:s5-eth2 s6-eth2:h5-eth0 s6-eth3:h6-eth0
s7 lo:  s7-eth1:s5-eth3 s7-eth2:h7-eth0 s7-eth3:h8-eth0
c0
mininet> 

Ans 2:
Output of h7 ifconfig
mininet> h7 ifconfig
h7-eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.7  netmask 255.0.0.0  broadcast 10.255.255.255
        inet6 fe80::4c1e:4fff:fe9d:b37e  prefixlen 64  scopeid 0x20<link>
        ether 4e:1e:4f:9d:b3:7e  txqueuelen 1000  (Ethernet)
        RX packets 97  bytes 7786 (7.7 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 8  bytes 656 (656.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Task 2:
Ans 1:
Function call graph:

 packet comes in -> _handle_PacketIn -> act_like_hub() -> resend_packet() -> connection.send()(forward message to the port)
	

Ans 2:
-- 10.0.0.2 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99269ms
rtt min/avg/max/mdev = 2.654/5.734/8.765/1.119 ms

--- 10.0.0.8 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99385ms
rtt min/avg/max/mdev = 8.209/19.877/32.056/3.643 ms

Ans 2a.
Average time to ping -  h1 and h2 - 5.789 ms
Average time to ping - h1 and h8 - 19.642 ms

Ans 2b. 
Minimum ping between h1 and h2 - 2.618 ms
Minimum ping between h1 and h8 - 8.347 ms
Maximum ping between h1 and h2 - 8.278 ms
Maximum ping between h1 and h8 - 32.087 ms

Ans 2c.
Pinging h1 to h2 typically takes lesser time than pinging h8. This is because a packet must travel significantly more hops to reach h8 than to reach h2.

Ans 3.

Ans 3a. 
IPERF is a tool to test network performance and bandwidth.It supports tuning of various parameters like timing, buffers and protocols. It measures the throughput between any two nodes in a network line.

Ans 3b. 
mininet> iperf h1 h2
*** Iperf: testing TCP bandwidth between h1 and h2 
*** Results: ['4.89 Mbits/sec', '4.79 Mbits/sec']


mininet> iperf h1 h8
*** Iperf: testing TCP bandwidth between h1 and h8 
*** Results: ['2.12 Mbits/sec', '2.56 Mbits/sec']

Ans 3c.
The throughput is higher between h1 and h2 than h1 and h8 because there are fewer no. of switches between h1 and h2. Thus, a longer time is required to transfer the data from h1 to h8 than on h1 to h2. 

Ans 4.
By adding log.info("Switch observing traffic: %s" % (self.connection)) in the line number 107 "of_tutorial" controller we can get the details, which help us to observe the traffic. Once we run the of_tutorial.py file we can observe that all switches receive traffic, and are flooded with packets as h1 to h8 is connected with switches.


Task 3:
Ans 1.
The code portrays the activity of building rules in OpenFlow regulator connected to mininet. The act_like_switch function will be capable of mapping or locating MAC addresses. The controller will be able to map the MAC address to the port if it finds a MAC address that corresponds to the address the source sends to. By directing the packets to known ports, this speeds up the process. It simply floods the packet to all destinations in the event that the destination is not already known. Since flooding occurs less frequently, the MAC Learning Controller also contributes to the improvement of ping times and throughputs.


Ans 2:
--- 10.0.0.2 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99734ms
rtt min/avg/max/mdev = 2.916/6.342/11.890/1.657 ms

--- 10.0.0.8 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99358ms
rtt min/avg/max/mdev = 8.151/20.185/27.693/2.864 ms

Ans 2a.
Average time to ping h1 and h2 - 6.963 ms
Average time to ping h1 and h8 - 20.904 ms

Ans 2b. 
Minimum ping between h1 and h2 - 2.961 ms
Minimum ping between h1 and h8 - 8.267 ms
Maximum ping between h1 and h2 - 11.968 ms
Maximum ping between h1 and h8 - 27.856 ms

Ans 2c.
The pings are quite faster in Task 2, than in switches.The maximum RTT for h1-h2 is larger as the controller is introducing the rule. The change was visible because of the controller as it was able to distinguish the port numbers and build the forwarding rules. 


Ans 3:
Ans 3a.
mininet> iperf h1 h2
*** Iperf: testing TCP bandwidth between h1 and h2 
*** Results: ['4.98 Mbits/sec', '5.18 Mbits/sec']

mininet> iperf h1 h8
*** Iperf: testing TCP bandwidth between h1 and h8 
*** Results: ['2.40 Mbits/sec', '2.76 Mbits/sec']

Ans 3b.
Because Task 3 has less network congestion, the throughput in Task 3 is higher. The mac_to_port mapping will lighten the load on all ports and switches once they understand it. 
