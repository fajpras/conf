# nov/25/2024 06:59:11 by RouterOS 6.49rc2
# software id = HTRK-J7T3
#
#
#
/interface ethernet
set [ find default-name=ether4 ] name=ether1-INTERNET
set [ find default-name=ether1 ] name=ether2-VLAN
set [ find default-name=ether2 ] name=WLAN-HOTSPOT
set [ find default-name=ether3 ] name=ether4-REMOTE
/interface vlan
add interface=ether2-VLAN name=ADMIN vlan-id=10
add interface=ether2-VLAN name=JARINGAN vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool1 ranges=192.168.20.2-192.168.20.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ADMIN name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=JARINGAN name=dhcp2
/lora servers
add address=eu.mikrotik.thethings.industries down-port=1700 name=TTN-EU \
    up-port=1700
add address=us.mikrotik.thethings.industries down-port=1700 name=TTN-US \
    up-port=1700
add address=eu1.cloud.thethings.industries down-port=1700 name=\
    "TTS Cloud (eu1)" up-port=1700
add address=nam1.cloud.thethings.industries down-port=1700 name=\
    "TTS Cloud (nam1)" up-port=1700
add address=au1.cloud.thethings.industries down-port=1700 name=\
    "TTS Cloud (au1)" up-port=1700
add address=eu1.cloud.thethings.network down-port=1700 name="TTN V3 (eu1)" \
    up-port=1700
add address=nam1.cloud.thethings.network down-port=1700 name="TTN V3 (nam1)" \
    up-port=1700
add address=au1.cloud.thethings.network down-port=1700 name="TTN V3 (au1)" \
    up-port=1700
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/ip address
add address=192.168.10.1/24 interface=ADMIN network=192.168.10.0
add address=192.168.20.1/24 interface=JARINGAN network=192.168.20.0
/ip cloud
set update-time=no
/ip dhcp-client
add disabled=no interface=ether1-INTERNET
/ip dhcp-server network
add address=192.168.10.0/24 gateway=192.168.10.1
add address=192.168.20.0/24 gateway=192.168.20.1
/ip dns
set allow-remote-requests=yes
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1-INTERNET
/system identity
set name=RouterOS
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
set JARINGAN disabled=yes display-time=5s
set ADMIN disabled=yes display-time=5s
set ether1-INTERNET disabled=yes display-time=5s
set ether2-VLAN disabled=yes display-time=5s
set ether3-HOTSPOT disabled=yes display-time=5s
set ether4-REMOTE disabled=yes display-time=5s
/tool user-manager database
set db-path=user-manager
