# nov/25/2024 11:24:50 by RouterOS 6.49rc2
# software id = 3DHC-XIH3
#
#
#
/interface bridge
add name=VLAN vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] name=ether1-VLAN
set [ find default-name=ether2 ] name=ether2-ADMIN
set [ find default-name=ether3 ] name=ether3-JARINGAN
set [ find default-name=ether4 ] name=ether4-REMOTE
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik

/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/interface bridge port
add bridge=VLAN interface=ether1-VLAN
add bridge=VLAN interface=ether2-ADMIN pvid=10
add bridge=VLAN interface=ether3-JARINGAN pvid=20
/interface bridge vlan
add bridge=VLAN tagged=ether1-VLAN untagged=ether2-ADMIN vlan-ids=10
add bridge=VLAN tagged=ether1-VLAN untagged=ether3-JARINGAN vlan-ids=20
/ip cloud
set update-time=no
/system identity
set name=SWITCH
/system lcd
set contrast=0 enabled=no port=parallel type=24x4
/system lcd page
set time disabled=yes display-time=5s
set resources disabled=yes display-time=5s
set uptime disabled=yes display-time=5s
set packets disabled=yes display-time=5s
set bits disabled=yes display-time=5s
set version disabled=yes display-time=5s
set identity disabled=yes display-time=5s
set VLAN disabled=yes display-time=5s
set ether1-VLAN disabled=yes display-time=5s
set ether2-ADMIN disabled=yes display-time=5s
set ether3-JARINGAN disabled=yes display-time=5s
set ether4 disabled=yes display-time=5s
/tool user-manager database
set db-path=user-manager
