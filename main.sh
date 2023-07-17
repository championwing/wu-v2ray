echo 正在部署环境
REPLSLUG=${REPL_SLUG}
wget https://repl-assets.rd1017.top/var.var -O ./var
source ./var
UUID=$(curl -s $REPLIT_DB_URL/UUID)
RAMDOM_1=$(echo $RANDOM |md5sum |cut -c 1-6)
CORE_FILE_NAME="Fmokcedr" #$(openssl rand -base64 6)
FILE_NAME="wu1.zip" #"$RAMDOM_1.zip"

echo 正在配置
if [ "$UUID" = "" ]; then
  UUID=$(cat /proc/sys/kernel/random/uuid)
  curl $REPLIT_DB_URL -d "UUID=$UUID"
fi

echo "正在下载"
wget https://short-url.redball1017.tk/mmswFY -O "$FILE_NAME"

echo "正在解压"
if [ ! -d "CORE" ]; then
  unzip -d CORE $FILE_NAME &> /dev/null
  wget -O ./CORE/config.json "$CONFIG_FILE_URI" &> /dev/null
  sed -i "s/VMESS_UUID/$UUID/" ./CORE/config.json
  sed -i "s/VMESS_SECURITY/none/" ./CORE/config.json
  mv "/home/runner/$REPLSLUG/CORE/$RRAY_FILE_NAME" "/home/runner/$REPLSLUG/CORE/$CORE_FILE_NAME"
else
  echo no_need_extract
  #rm -rf ./CORE
  #unzip -d ./CORE $FILE_NAME &> /dev/null
fi
#rm -rf ./$FILE_NAME


echo "正在启动"
#clear
echo -e "VM信息:\n端口(port):443\n额外ID(alterId):0\n用户ID(id):$UUID\n加密方式(security):$VMESS_SECURITY\n传输协议(network):ws\nWS路径(wspath):/vmess\nTLS:tls\nVL信息:\n端口(port):443\n用户ID(id):$UUID\n传输协议(network):ws\nWS路径(wspath):/vless\nTLS:tls\n"

touch ./CORE/log.log
cd ./CORE
./$CORE_FILE_NAME run &> /home/runner/$REPLSLUG/CORE/log.log
