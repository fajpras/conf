
/ip hotspot profile
add dns-name=fajri.net hotspot-address=192.168.30.1 login-by=\
    http-chap,http-pap name=hsprof1
/ip hotspot
add address-pool=dhcp_pool2 disabled=no interface=WLAN-HOTSPOT name=hotspot1 \
    profile=hsprof1
/ip hotspot user profile
add address-pool=dhcp_pool2 name=GURU rate-limit=1m/1m
add address-pool=dhcp_pool2 name=SISWA rate-limit=512k/512k
/ip hotspot user
add name=guru password=123 profile=GURU server=hotspot1
add name=siswa password=123 profile=SISWA server=hotspot1
