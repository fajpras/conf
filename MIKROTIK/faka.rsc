
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n disabled=no frequency=auto \
    mode=ap-bridge name=wlan-HOTSPOT ssid=WLAN-FAN
/interface ethernet
set [ find default-name=ether1 ] name=ether1-INTERNET
set [ find default-name=ether2 ] name=ether2-VLAN
/interface vlan
add interface=ether2-VLAN name=vlan1-ADMIN vlan-id=10
add interface=ether2-VLAN name=vlan2-JARINGAN vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
add dns-name=tekaje3.net hotspot-address=192.168.40.1 login-by=http-chap \
    name=hsprof1
/ip hotspot user profile
set [ find default=yes ] shared-users=5
/ip pool
add name=dhcp_pool0 ranges=192.168.20.2-192.168.20.254
add name=dhcp_pool1 ranges=192.168.30.2-192.168.30.254
add name=dhcp_pool2 ranges=192.168.40.2-192.168.40.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=vlan1-ADMIN name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=vlan2-JARINGAN name=dhcp2
add address-pool=dhcp_pool2 disabled=no interface=wlan-HOTSPOT name=dhcp3
/ip hotspot
add address-pool=dhcp_pool2 addresses-per-mac=1 disabled=no interface=\
    wlan-HOTSPOT name=hotspot1 profile=hsprof1
/ip address
add address=192.168.100.122/24 interface=ether1-INTERNET network=192.168.100.0
add address=192.168.20.1/24 interface=vlan1-ADMIN network=192.168.20.0
add address=192.168.30.1/24 interface=vlan2-JARINGAN network=192.168.30.0
add address=192.168.40.1/24 interface=wlan-HOTSPOT network=192.168.40.0
/ip dhcp-server network
add address=192.168.20.0/24 dns-server=8.8.8.8 gateway=192.168.20.1
add address=192.168.30.0/24 dns-server=8.8.8.8 gateway=192.168.30.1
add address=192.168.40.0/24 dns-server=8.8.8.8 gateway=192.168.40.1
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
/ip route
add distance=1 gateway=192.168.100.1
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=ROUTER
/system routerboard settings
set silent-boot=no
