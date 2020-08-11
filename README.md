# SSLstrip
An implementation of the SSLstrip library to strip SSL/TLS encryption to perform a Man in the Middle attack.

The library is available here: https://github.com/moxie0/sslstrip
There are 4 scripts that need to be run, script[0-3].sh
Requires the following dependencies:
  - iptables: needed to set up forwarding tables to route DNS/TCP/ARP messages.
  - dns2proxy: needed to spoof thh victim's DNS requests.
  - arpspoof: needed to trick the router into thinking that the victim is the MiTM.
  - nmap: needed to determine what ports are available on the victim's device.

The attack works as follows:
The malicious user sets up forwarding tables to act as a proxy between the gateway router and the victim.
The user will send unencrypted data (over a http connection) to the malicious user, believing it to the router. The malicious user can then view the data, encrypt it with its own keys, and forward it to the router (over a https connection). 
When the server sends a response, the gateway router will look for the IP address of the victim. The arpspoof command is used to poison the router's cache so it believes the malicious user is the victim, and sends data to it. That data can be unencrypted, viewed, and forwarded to the victim. All traffic goes through the malicious user.

Unfortunatley, moderm browsers use HSTS (HTTP Strict Transport Security), in order to force packet transmission over HTTPS connections. This method of attacking establishes a http connection between the victim and the malicious machine, so this attack vector does not work on many devices now :(
