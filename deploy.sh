#!/bin/bash
echo "开始部署"
while read ip role port master_info
do
echo "部署进度："
echo $ip $role $port $master_info
echo "[redis]
$ip  role=$role  port=$port  master_info=$master_info" > hosts
ansible-playbook -i hosts init.yml
done < iplist
echo "部署完成"
