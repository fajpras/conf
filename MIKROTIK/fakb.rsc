
/interface bridge
add name=bridge1-VLAN vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] name=ether1-VLAN
set [ find default-name=ether2 ] name=ether2-ADMIN
set [ find default-name=ether3 ] name=ether3-JARINGAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/interface bridge port
add bridge=bridge1-VLAN interface=ether1-VLAN
add bridge=bridge1-VLAN interface=ether2-ADMIN pvid=10
add bridge=bridge1-VLAN interface=ether3-JARINGAN pvid=20
/interface bridge vlan
add bridge=bridge1-VLAN tagged=ether1-VLAN untagged=ether2-ADMIN vlan-ids=10
add bridge=bridge1-VLAN tagged=ether1-VLAN untagged=ether3-JARINGAN vlan-ids=\
    20
/system identity
set name=SWITCH
