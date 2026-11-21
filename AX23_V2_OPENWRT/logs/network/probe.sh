#!/bin/bash
exec > /home/user/DuinoCoinUSB_ESP8266/AX23_V2_OPENWRT/logs/network/probe.out 2>&1
uname -r
for m in bridge 8021q sch_cake sch_netem nft_masq nft_flow_offload veth; do modprobe $m && echo "mod $m ok" || echo "mod $m FAIL"; done
ip link add b0 type bridge vlan_filtering 1 && ip link add link b0 name b0.20 type vlan id 20 && echo bridge-vlan-ok
tc qdisc add dev lo root cake && echo cake-ok
nft -v; dnsmasq -v | head -1; iperf3 -v | head -1
