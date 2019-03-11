# ShadowsocksR

## 自动安装命令 ShadowsocksR (Centos and Debian)
``` bash
wget -N --no-check-certificate https://raw.githubusercontent.com/ElonBrown/ShadowsocksR/master/install.sh
bash install.sh
```
- Centos 安装内核，需要多次重新运行 bash install.sh
- Centos 可选择serverSpeeder 或 bbr加速
- Debian 默认bbr加速


## 查看 serverSpeeder 运行状况
``` bash
service serverSpeeder status
```

## 查看 ShadowsocksR 运行状况
``` bash
systemctl status ShadowsocksR
# 或者
bash install.sh
```