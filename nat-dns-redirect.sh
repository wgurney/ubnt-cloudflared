#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

# Redirect outgoing DNS packets and log them
configure

delete service nat rule 1001

set service nat rule 1001 description 'Redirect DNS request from LAN to gateway'
set service nat rule 1001 type destination
set service nat rule 1001 protocol tcp_udp
set service nat rule 1001 destination port 53
set service nat rule 1001 destination address !172.16.1.1
set service nat rule 1001 inbound-interface eth1
set service nat rule 1001 inside-address address 172.16.1.1
set service nat rule 1001 log enable

commit
save
exit
