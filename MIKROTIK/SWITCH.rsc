:delay 3
/interface bridge
add name=BRIDGE vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full name=ether1-VLAN speed=100Mbps
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full name=ether2-ADMIN speed=100Mbps
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full name=ether3-JARINGAN speed=100Mbps
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full name=ether4-REMOTE speed=100Mbps
/interface bridge port
add bridge=BRIDGE interface=ether1-VLAN
add bridge=BRIDGE interface=ether2-ADMIN pvid=10
add bridge=BRIDGE interface=ether3-JARINGAN pvid=20
/interface bridge vlan
add bridge=BRIDGE tagged=ether1-VLAN untagged=ether2-ADMIN vlan-ids=10
add bridge=BRIDGE tagged=ether1-VLAN untagged=ether3-JARINGAN vlan-ids=20
/system identity
set name=SWITCH
