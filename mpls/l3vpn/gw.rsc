# 2024-11-07 12:42:25 by RouterOS 7.11.2
# software id = 
#
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/port
set 0 name=serial0
set 1 name=serial1
/routing ospf instance
add disabled=no name=ospf-71000 redistribute="" router-id=202.61.78.250
/routing ospf area
add area-id=0.0.0.1 disabled=no instance=ospf-71000 name=ospf-area-1
/routing bgp template
set default as=71000 disabled=no routing-table=main
/ip address
add address=202.61.78.250/30 comment=TO-PE03 interface=ether1 network=\
    202.61.78.248
/ip dhcp-client
add interface=ether1
add interface=ether2
/ip firewall nat
add action=masquerade chain=srcnat to-addresses=192.168.160.158
/ip route
add disabled=yes distance=1 dst-address=0.0.0.0/0 gateway=192.168.160.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10
/routing ospf interface-template
add area=ospf-area-1 disabled=no interfaces=ether1 networks=202.61.78.248/30 \
    type=ptp
add area=ospf-area-1 disabled=yes interfaces=all type=ptp
add area=ospf-area-1 disabled=yes interfaces=ether2 networks=192.168.160.0/24
/system note
set show-at-login=no
