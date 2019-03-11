#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH


if [ -f /etc/redhat-release ]; then
    release="centos"
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
else
    release=""
fi
echo "当前系统为：${release}"

if [[ x"${release}" == x"centos" ]]; then
    read -p "选择要安装的加速器ServerSpeeder or bbr? [s/b]" speeder
    if [[ ${speeder} == "b" || ${speeder} == "B" ]]; then
        wget -N --no-check-certificate https://raw.githubusercontent.com/ElonBrown/ShadowsocksR/master/ssr_bbr/ssr_bbr.sh
        bash ssr_bbr.sh
    else
        kernel=`uname -r`
        if [[ x"${kernel}" == x"3.10.0-229.1.2.el7.x86_64" ]]; then
            # wget -N --no-check-certificate https://raw.githubusercontent.com/ElonBrown/ShadowsocksR/master/ssr_ServerSpeeder/ssr_ServerSpeeder.sh
            # bash ssr_ServerSpeeder.sh
            wget -N --no-check-certificate https://raw.githubusercontent.com/ElonBrown/ShadowsocksR/master/ssr_ServerSpeeder/serverspeeder-v.sh
            bash serverspeeder-v.sh CentOS 7.1 3.10.0-229.1.2.el7.x86_64 x64 3.11.20.4 serverspeeder_3283
        else
            wget -N --no-check-certificate https://raw.githubusercontent.com/ElonBrown/ShadowsocksR/master/ssr_ServerSpeeder/ssr.sh
            chmod +x ssr.sh
            bash ssr.sh

            wget -N --no-check-certificate https://raw.githubusercontent.com/ElonBrown/ShadowsocksR/master/ssr_ServerSpeeder/centos_replace_kernel.sh
            bash centos_replace_kernel.sh
        fi
    fi
    systemctl stop firewalld.service
    systemctl disable firewalld.service
    
elif [[ x"${release}" == x"debian" || x"${release}" == x"ubuntu" ]]; then
    wget -N --no-check-certificate https://raw.githubusercontent.com/ElonBrown/ShadowsocksR/master/ssr_bbr/ssr_bbr.sh
    bash ssr_bbr.sh
fi