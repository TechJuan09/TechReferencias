#!/bin/sh

for i in $(seq 4 21); do
    uci add nft-qos download
    uci set nft-qos.@download[-1].hostname="Cliente$i"
    uci set nft-qos.@download[-1].ipaddr="192.168.1.$i"
    uci set nft-qos.@download[-1].rate="200"
    uci set nft-qos.@download[-1].unit="kbytes"

    uci add nft-qos upload
    uci set nft-qos.@upload[-1].hostname="Cliente$i"
    uci set nft-qos.@upload[-1].ipaddr="192.168.1.$i"
    uci set nft-qos.@upload[-1].rate="200"
    uci set nft-qos.@upload[-1].unit="kbytes"
done

uci commit nft-qos

echo "Reglas creadas correctamente."