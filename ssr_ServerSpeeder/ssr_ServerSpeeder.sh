# Only Centos
# install ServerSpeeder
wget -N --no-check-certificate https://github.com/ElonBrown/ShadowsocksR/ssr_ServerSpeeder/serverspeeder-v.sh 
bash serverspeeder-v.sh CentOS 7.1 3.10.0-229.1.2.el7.x86_64 x64 3.11.20.4 serverspeeder_3283

# install ShadowsocksR
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh
chmod +x ssr.sh
bash ssr.sh