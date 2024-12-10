:delay 3
/interface ethernet
set [ find default-name=ether1 ] name=ether1-INTERNET 
set [ find default-name=ether2 ] name=ether2-VLAN
set [ find default-name=ether3 ] name=WLAN-HOTSPOT
set [ find default-name=ether4 ] name=ether4-REMOTE
/interface vlan
add interface=ether2-VLAN name=ADMIN vlan-id=10
add interface=ether2-VLAN name=JARINGAN vlan-id=20
/ip hotspot profile
add dns-name=tekaje3.net hotspot-address=192.168.40.1 login-by=http-chap \
    name=hsprof1
/ip hotspot user profile
add name=CLIENT shared-users=5
/ip pool
add name=dhcp_pool0 ranges=0.0.0.2-255.255.255.254
add name=dhcp_pool1 ranges=0.0.0.2-255.255.255.254
add name=dhcp_pool2 ranges=192.168.20.2-192.168.20.254
add name=dhcp_pool3 ranges=192.168.30.2-192.168.30.254
add name=hs-pool-3 ranges=192.168.40.2-192.168.40.254
/ip dhcp-client
	add interface=ether1-INTERNET use-peer-dns=yes use-peer-ntp=yes add-default-route=yes disabled=no
/ip dhcp-server
add address-pool=dhcp_pool2 disabled=no interface=ADMIN name=dhcp1 
add address-pool=dhcp_pool3 disabled=no interface=JARINGAN name=dhcp2 
add address-pool=hs-pool-3 disabled=no interface=WLAN-HOTSPOT lease-time=1h \
    name=dhcp3
/ip hotspot
add address-pool=hs-pool-3 addresses-per-mac=1 disabled=no interface=\
    WLAN-HOTSPOT name=hotspot1 profile=hsprof1
/ip address
add address=192.168.20.1/24 interface=ADMIN network=192.168.20.0
add address=192.168.30.1/24 interface=JARINGAN network=192.168.30.0
add address=192.168.40.1/24 interface=WLAN-HOTSPOT network=192.168.40.0
/ip dhcp-server network
add dns-server=192.168.1.1,8.8.8.8 gateway=0.0.0.1
add address=192.168.20.0/24 dns-server=192.168.1.1,8.8.8.8 gateway=\
    192.168.20.1
add address=192.168.30.0/24 dns-server=192.168.1.1,8.8.8.8 gateway=\
    192.168.30.1
add address=192.168.40.0/24 comment="hotspot network" gateway=192.168.40.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=ether1-INTERNET
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.40.0/24
/ip hotspot user
add name=admin password=123
add  name=client password=LSD profile=CLIENT server=\
    hotspot1
/system identity
set name=ROUTER

