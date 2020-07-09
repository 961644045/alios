#!/usr/bin/bash
read -p "my_bucket:" my_bucket
read -p "EndPoint（地域节点）:" EndPoint
read -p "my_access_key_id"  my_access_key_id
read -p "my_access_key_secret" my_access_key_secret
echo "$my_bucket:$my_access_key_id:$my_access_key_secret" > /etc/passwd-ossfs
chmod 640 /etc/passwd_ossfs
mkdir /alios
echo -n "安装："
wget http://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/assets/attach/32196/cn_zh/1507811577850/ossfs_1.80.3_centos7.0_x86_64.rpm
yum localinstall ossfs_1.80.3_centos7.0_x86_64.rpm -y
#启动挂载
ossfs $my_bucket /alios -ourl=$EndPoint
echo "挂载路径为  /alios"
echo "增加开机自启："
echo "ossfs $my_bucket /alios -ourl=$EndPoint" >>  /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local
echo "挂载状态如下i(出现ossfs字样则成功挂载)："
df -h |grep ossfs
