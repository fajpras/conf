
/interface ethernet
set [ find default-name=ether3 ] name=WLAN-HOTSPOT
set [ find default-name=ether1 ] name=ether1-INTERNET
set [ find default-name=ether2 ] name=ether2-VLAN
set [ find default-name=ether4 ] name=ether4-REMOTE
/interface vlan
add interface=ether2-VLAN name=ADMIN vlan-id=10
add interface=ether2-VLAN name=JARINGAN vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
add dns-name=fajri.net hotspot-address=192.168.40.1 login-by=\
    http-chap,http-pap name=hsprof1
/ip pool
add name=dhcp_pool0 ranges=192.168.20.2-192.168.20.254
add name=dhcp_pool1 ranges=192.168.30.2-192.168.30.254
add name=dhcp_pool2 ranges=192.168.40.2-192.168.40.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ADMIN name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=JARINGAN name=dhcp2
add address-pool=dhcp_pool2 disabled=no interface=WLAN-HOTSPOT name=dhcp3
/ip hotspot
add address-pool=dhcp_pool2 disabled=no interface=WLAN-HOTSPOT name=HOTSPOT \
    profile=hsprof1
/ip hotspot user profile
add address-pool=dhcp_pool2 name=GURU rate-limit=1m/1m
add address-pool=dhcp_pool2 name=SISWA rate-limit=512k/512k
/ip address
add address=192.168.20.1/24 interface=ADMIN network=192.168.20.0
add address=192.168.30.1/24 interface=JARINGAN network=192.168.30.0
add address=192.168.40.1/24 interface=WLAN-HOTSPOT network=192.168.40.0

/ip dhcp-client
add disabled=no interface=ether1-INTERNET
/ip dhcp-server network
add address=192.168.20.0/24 gateway=192.168.20.1
add address=192.168.30.0/24 gateway=192.168.30.1
add address=192.168.40.0/24 gateway=192.168.40.1
/ip dns
set allow-remote-requests=yes
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=ether1-INTERNET
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.40.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.40.0/24
/ip hotspot user
add name=guru password=123 profile=GURU server=HOTSPOT
add name=siswa password=123 profile=SISWA server=HOTSPOT
add name=admin password=admin
/system identity
set name=ROUTER
