# SSLstrip
An implementation of the SSLstrip library to strip SSL/TLS encryption to perform a Man in the Middle attack.


The library is available here: https://github.com/moxie0/sslstrip
There are 4 scripts that need to be run, script[1-4].sh
Requires the following dependencies:
  - iptables: needed to set up forwarding tables to route DNS/TCP/ARP messages
  - dns2proxy: needed to spoof teh victim's DNS requests
  - arpspoof: needed to trick the router into thinking that the victim is the MiTM.

Unfortunatley, moderm browsers use HSTS (HTTP Strict Transport Security), in order to force packet transmission over HTTPS connections. This method of attacking establishes a http connection between the victim and the malicious machine, so this attack vector does not work on many devices now :(
