# 变量
tj_bin_url="https://cdn.jsdelivr.net/gh/vb1980/Padavan-build/ssp/trojan" # tj_bin下载路径
v2_bin_url="https://cdn.jsdelivr.net/gh/vb1980/Padavan-build\/ssp\/v2ray"
export ssp_filename="./user/shadowsocks/scripts/shadowsocks.sh"

# 是否超频
echo "CONFIG_FIRMWARE_CPU_600MHZ=y" >> .config

# 源码替换
echo '源码替换'
sed -i "s#tj_bin=\"/usr/bin/trojan\"/tj_bin=\"/usr/bin/trojan\"\n \
  if [ ! -f \"\$tj_bin\" ]; then\n \
		if [ ! -f \"/tmp/trojan\" ];then\n \
			curl -k -s -o /tmp/trojan --connect-timeout 10 --retry 3 !$tj_bin_url!\n \
			if [ ! -f \"/tmp/trojan\" ]; then\n \
				logger -t \"SS\" \"trojan二进制文件下载失败，可能是地址失效或者网络异常！\"\n \
				nvram set ss_enable=0\n \
				ssp_close\n \
			else\n \
				logger -t \"SS\" \"trojan二进制文件下载成功\"\n \
				chmod -R 777 /tmp/trojan\n \
				tj_bin=\"/tmp/trojan\"\n \
			fi\n \
			else\n \
			tj_bin=\"/tmp/trojan\"\n \
			fi\n \
		fi\n#g" $ssp_filename

sed -i "s#v2_bin=\"/usr/bin/v2ray\"/v2_bin=\"/usr/bin/v2ray\"\n \
  if [ ! -f \"$v2_bin\" ]; then\n \
		if [ ! -f \"/tmp/v2ray\" ];then\n \
			curl -k -s -o /tmp/v2ray --connect-timeout 10 --retry 3 $v2_bin_url\n \
			if [ ! -f \"/tmp/v2ray\" ]; then\n \
				logger -t \"SS\" \"v2ray二进制文件下载失败，可能是地址失效或者网络异常！\"\n \
				nvram set ss_enable=0\n \
				ssp_close\n \
			else\n \
				logger -t \"SS\" \"v2ray二进制文件下载成功\"\n \
				chmod -R 777 /tmp/v2ray\n \
				v2_bin=\"/tmp/v2ray\"\n \
			fi\n \
			else\n \
			v2_bin=\"/tmp/v2ray\"\n \
			fi\n \
		fi\n#g" $ssp_filename

# 拷贝文件测试
if [ ! -d ./images/ ]; then
 echo '创建文件夹'
 mkdir ./images/
fi
cp -r $ssp_filename ./images/
