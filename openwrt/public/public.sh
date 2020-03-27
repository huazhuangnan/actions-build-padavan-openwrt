# cd $WORK_PATH 目录下,先运行的 public.h -> 设备.h -> scripts/feeds install -a
# 必须的文件
# device_name='G-DOCK'      # 设备名，放到了单独设备的sh文件中了
# wifi_name="OpenWrt"       # Wifi 名字 ,放到了单独设备的sh文件中了
lan_ip='192.168.2.1'        # Lan Ip地址
utc_name='Asia\/Shanghai'   # 时区
delete_bootstrap=true       # 是否删除默认主题 true 、false
default_theme='argon_mc1'   # 默认主题 结合主题文件夹名字 
theme_argon='https://github.com/sypopo/luci-theme-argon-mc.git'  # 主题地址
openClash_url='https://github.com/vernesong/OpenClash.git'       # OpenClash包地址 
lienol_url='https://github.com/Lienol/openwrt-package.git'       # Lienol 包地址
# 命令
# echo "修改机器名称"
# sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate

# echo "修改wifi名称"
# sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

echo "设置lan ip"
sed -i "s/192.168.1.1/$lan_ip/g" package/base-files/files/bin/config_generate

echo "修改时区"
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='$utc_name'/g" package/base-files/files/bin/config_generate

echo "修改默认主题"
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci

if [ $delete_bootstrap ] ;then
  echo "去除默认bootstrap主题"
  sed -i '/\+luci-theme-bootstrap/d' feeds/luci/collections/luci/Makefile
  sed -i '/\+luci-theme-bootstrap/d' package/feeds/luci/luci/Makefile
  sed -i '/CONFIG_PACKAGE_luci-theme-bootstrap=y/d' .config
  sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
fi

echo '添加主题argon'
git clone $theme_argon package/lean/luci-theme-argon-mc
rm -rf package/lean/luci-theme-argon-mc/screenshot
rm -rf package/lean/luci-theme-argon-mc/README.md
rm -rf package-temp
echo 'CONFIG_PACKAGE_luci-theme-argon-mc=y' >> .config

echo '添加OpenClash'
mkdir package-temp
git clone $openClash_url package-temp
mv -f package-temp/luci-app-openclash package/lean/

#  OpenClash
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y'  >> .config

echo '添加Lienol包'
rm -rf package-temp
git clone $lienol_url package-temp
mv -f package-temp/lienol/*  package/lean/

echo '添加Passwall'
echo 'CONFIG_PACKAGE_luci-app-passwall=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y' >> .config
echo 'CONFIG_PACKAGE_luci-i18n-passwall-zh-cn=y'  >> .config

echo '删除下载缓存'
rm -rf package-temp