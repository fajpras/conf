
/interface ethernet
set [ find default-name=ether1 ] name=ether1-INTERNET
set [ find default-name=ether2 ] name=ether2-VLAN
set [ find default-name=ether3 ] name=WLAN-HOTSPOT
set [ find default-name=ether4 ] name=ether4-REMOTE
/interface vlan
add interface=ether2-VLAN name=ADMIN vlan-id=10
add interface=ether2-VLAN name=JARINGAN vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.20.2-192.168.20.254
add name=dhcp_pool1 ranges=192.168.30.2-192.168.30.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ADMIN name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=JARINGAN name=dhcp2
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/ip address
add address=192.168.20.1/24 interface=ADMIN network=192.168.20.0
add address=192.168.30.1/24 interface=JARINGAN network=192.168.30.0
/ip cloud
set update-time=no
/ip dhcp-client
add disabled=no interface=ether1-INTERNET
/ip dhcp-server network
add address=192.168.20.0/24 gateway=192.168.20.1
add address=192.168.30.0/24 gateway=192.168.30.1
/ip dns
set allow-remote-requests=yes
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1-INTERNET
/system identity
set name=ROUTER
