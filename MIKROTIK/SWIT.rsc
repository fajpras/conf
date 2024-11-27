
/interface bridge
add name=VLAN vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] name=ether1-VLAN
set [ find default-name=ether2 ] name=ether2-ADMIN
set [ find default-name=ether3 ] name=ether3-JARINGAN
set [ find default-name=ether4 ] name=ether4-REMOTE
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
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
