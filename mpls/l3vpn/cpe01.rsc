# 2024-11-07 12:12:11 by RouterOS 7.11.2
# software id = 
#
/interface bridge
add name=lo0
add name=lo1
add name=lo2
add name=lo3
add name=lo4
add name=lo5
/interface ethernet
set [ find default-name=ether1 ] name=ether5
set [ find default-name=ether2 ] name=ether6
set [ find default-name=ether3 ] name=ether7
set [ find default-name=ether4 ] name=ether8
/interface vlan
add interface=ether5 name=VLAN254 vlan-id=254
add interface=ether5 name=VLAN1000 vlan-id=1000
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/port
set 0 name=serial0
set 1 name=serial1
/routing ospf instance
add disabled=no name=L3VPN router-id=1.1.1.100
/routing ospf area
add disabled=no instance=L3VPN name=backbone
/ip address
add address=103.165.113.10/30 interface=ether6 network=103.165.113.8
add address=100.70.89.2/30 interface=VLAN1000 network=100.70.89.0
add address=1.1.1.100 interface=lo0 network=1.1.1.100
add address=172.16.32.1/24 interface=lo1 network=172.16.32.0
add address=172.16.33.1/24 interface=lo2 network=172.16.33.0
add address=172.16.34.1/24 interface=lo4 network=172.16.34.0
add address=172.16.35.1/24 interface=lo3 network=172.16.35.0
add address=172.16.36.1/24 interface=lo5 network=172.16.36.0
add address=172.16.254.254/30 interface=VLAN254 network=172.16.254.252
/ip dhcp-client
add interface=*1
add interface=ether7
/ip route
add disabled=no dst-address=0.0.0.0/0 gateway=100.70.89.1 routing-table=main \
    suppress-hw-offload=no
/routing ospf interface-template
add area=backbone disabled=no interfaces=VLAN254 networks=172.16.254.252/30
add area=backbone disabled=no interfaces=lo0,lo1,lo2,lo3,lo4,lo5
/system note
set show-at-login=no
