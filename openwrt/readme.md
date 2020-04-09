# 文件以及参数说明(自理解仅供参考)

## 固件说明--只提供说明，建议自己选择好配置文件替换来编译

- 设备有关参数见 public.sh 或者对应设备的 sh
- openwrt 编译较慢，所以需要编译多设备自己根据 backups 的模板修改

## 主题

| 变量                                 | 名字      |
| ----------------------------------- | --------- |
| CONFIG_PACKAGE_luci-theme-bootstrap | bootstrap |
| CONFIG_PACKAGE_luci-theme-material  | material  |
| CONFIG_PACKAGE_luci-theme-netgear   | netgear   |
| CONFIG_PACKAGE_luci-theme-argon     | argon     |

## 插件说明 CONFIG*PACKAGE*

| 变量                               | 名字                                             |
| --------------------------------- | -------------------------------------------------|
| luci-app-music-remote-center      |   音乐远程中心                                     |
| luci-app-accesscontrol            | 访问时间控制                                       |
| luci-app-adbyby-plus              | 广告屏蔽大师 Plus +                                |
| luci-app-arpbind                  | IP/MAC 绑定                                       |
| luci-app-ddns                     | 动态域名 DNS（集成阿里 DDNS 客户端）                 |
| luci-app-filetransfer             | 文件传输（可 web 安装 ipk 包）                      |
| luci-app-firewall                 | 添加防火墙                                         |
| luci-app-flowoffload              | Turbo ACC 网络加速（集成 FLOW,BBR,NAT,DNS...        |
| luci-app-frpc                     | 内网穿透 Frp                                       |
| luci-app-guest-wifi               | WiFi 访客网络                                      |
| luci-app-ipsec-virtual            | **dvirtual**服务器 IPSec                           |
| luci-app-mwan3                    | MWAN3 负载均衡                                     |
| luci-app-mwan3helper              | MWAN3 分流助手                                     |
| luci-app-ramfree                  | 释放内存                                           |
| luci-app-sqm                      | 流量智能队列管理（QOS）                              |
| luci-app-乳酸菌饮料-plus            | 乳酸菌饮料低调上网 Plus+                            |
| s-s New Versiong                  | 新 SS 代理                                         |
| s-s Simple-obfs Plugin            | simple-obfs 简单混淆工具                            |
| s-s v 贰瑞 Plugin                 | SS v 贰瑞插件                                       |
| v 贰瑞                            | v 贰瑞代理                                          |
| Trojan                            | Trojan 代理                                        |
| red---socks2                      | red---socks2 代理                                  |
| Kcptun                            | Kcptun 加速                                        |
| 敏感词 Server                      | 乳酸菌饮料服务器                                     |
| DNS2SOCKS                         | DNS 服务器                                         |
| luci-app-syncdial                 | 多拨虚拟网卡（原 macvlan）                           |
| luci-app-upnp                     | 通用即插即用 UPnP（端口自动转发）                     |
| luci-app-vlmcsd                   | KMS 服务器设置                                     |
| luci-app-vsftpd                   | FTP 服务器                                        |
| luci-app-wifischedule             | WiFi 计划                                         |
| luci-app-wirele                   | 敏感词 egdb                                        |
| luci-app-wol                      | WOL 网络唤醒                                       |
| luci-app-wrtbwmon                 | 实时流量监测                                        |
| luci-app-xlnetacc                 | 迅雷快鸟                                           |
| luci-app-zerotier                 | ZeroTier 内网穿透                                  |
| Utilities ---> open-vm-tools      | 打开适用于 VMware 的 VM Tools                       |
| luci-app-acme                     | ACME 自动化证书管理环境                              |
| luci-app-adblock                  | ADB 广告过滤                                       |
| luci-app-advanced-reboot          | Linksys 高级重启                                   |
| luci-app-ahcp                     | 支持 AHCPd                                         |
| luci-app-amule                    | aMule 下载工具                                     |
| luci-app-aria2                    | Aria2 下载工具                                     |
| luci-app-asterisk                 | 支持 Asterisk 电话服务器                            |
| luci-app-attendedsysupgrade       | 固件更新升级相关                                    |
| luci-app-autoreboot               | 支持计划重启                                       |
| luci-app-baidupcs-web             | 百度网盘管理                                       |
| luci-app-bcp38                    | BCP38 网络入口过滤（不确定）                         |
| luci-app-bird1-ipv4               | 对 Bird1-ipv4 的支持                               |
| luci-app-bird1-ipv6               | 对 Bird1-ipv6 的支持                               |
| luci-app-bmx6                     | BMX6 路由协议                                      |
| luci-app-bmx7                     | BMX7 路由协议                                      |
| luci-app-cifsd                    | 网络共享 CIFS/SMB 服务器                            |
| luci-app-cjdns                    | 加密 IPV6 网络相关                                 |
| luci-app-clamav                   | ClamAV 杀毒软件                                    |
| luci-app-commands                 | Shell 命令模块                                     |
| luci-app-cshark                   | CloudShark 捕获工具                                |
| luci-app-diag-core                | core 诊断工具                                      |
| luci-app-dnscrypt-proxy           | DNSCrypt 解决 DNS 污染                             |
| luci-app-dnsforwarder             | DNSForwarder 防 DNS 污染                           |
| luci-app-dockerman                | Docker 容器                                        |
| luci-app-dump1090                 | 民航无线频率（不确定）                               |
| luci-app-dynapoint                | DynaPoint（未知）                                  |
| luci-app-e2guardian               | Web 内容过滤器                                     |
| luci-app-familycloud              | 家庭云盘                                           |
| luci-app-freifunk-diagnostics     | freifunk 组件 诊断（未知）                          |
| luci-app-freifunk-policyrouting   | freifunk 组件 策略路由（未知）                       |
| luci-app-freifunk-widgets         | freifunk 组件 索引（未知）                          |
| luci-app-fwknopd                  | Firewall Knock Operator 服务器                     |
| luci-app-haproxy-tcp              | HAProxy 负载均衡-TCP                               |
| luci-app-hd-idle                  | 硬盘休眠                                           |
| luci-app-hnet                     | Homenet Status 家庭网络控制协议                     |
| luci-app-kodexplorer              | KOD 可道云私人网盘                                  |
| luci-app-lxc                      | LXC 容器管理                                       |
| luci-app-meshwizard               | 网络设置向导                                       |
| luci-app-minidlna                 | 完全兼容 DLNA / UPnP-AV 客户端的服务器软件           |
| luci-app-mjpg-streamer            | 兼容 Linux-UVC 的摄像头程序                         |
| luci-app-mtwifi                   | MTWiFi 驱动的支持                                  |
| luci-app-n2n_v2                   | N2N 内网穿透 N2N v2 virtual\*\*服务                |
| luci-app-netdata                  | Netdata 实时监控（图表）                            |
| luci-app-nft-qos                  | QOS 流控 Nftables 版                               |
| luci-app-nlbwmon                  | 网络带宽监视器                                      |
| luci-app-noddos                   | NodDOS Clients 阻止 DDoS 攻击                      |
| luci-app-nps                      | 内网穿透 nps                                       |
| luci-app-ntpc                     | NTP 时间同步服务器                                  |
| luci-app-ocserv                   | OpenConnect virtual\*\*服务                        |
| luci-app-olsr                     | OLSR 配置和状态模块                                 |
| luci-app-olsr-services            | OLSR 服务器                                        |
| luci-app-olsr-viz                 | OLSR 可视化                                        |
| luci-app-openvirtual\*\*          | Openvirtual\*\*客户端                              |
| luci-app-openvirtual\*\*-server   | 易于使用的 Openvirtual\*\*服务器 Web-UI              |
| luci-app-p910nd                   | 打印服务器模块                                      |
| luci-app-pagekitec                | Pagekite 内网穿透客户端                             |
| luci-app-polipo                   | Polipo 代理(是一个小型且快速的网页缓存代理)            |
| luci-app-pppoe-relay              | PPPoE NAT 穿透 点对点协议（PPP）                     |
| luci-app-privoxy                  | Privoxy 网络代理(带过滤无缓存)                       |
| luci-app-qbittorrent              | BT 下载工具（qBittorrent）                          |
| luci-app-qos                      | 流量服务质量(QoS)流控                                |
| luci-app-radicale                 | CalDAV/CardDAV 同步工具                            |
| luci-app-rp-pppoe-server          | Roaring Penguin PPPoE Server 服务器                |
| luci-app-samba4                   | 网络共享（Samba4）                                  |
| luci-app-sfe                      | Turbo ACC 网络加速（flowoffload 二选一）             |
| luci-app-s-s-libes                | SS-libev 服务端                                    |
| luci-app-shairplay                | 支持 AirPlay 功能                                  |
| luci-app-siitwizard               | SIIT 配置向导 SIIT-Wizzard                         |
| luci-app-simple-adblock           | 简单的广告拦截                                      |
| luci-app-softethervirtual\*\*     | SoftEther virtual\*\*服务器 NAT 穿透               |
| luci-app-splash                   | Client-Splash 是无线 MESH 网络的一个热点认证系统      |
| luci-app-squid                    | Squid 代理服务器                                   |
| luci-app-乳酸菌饮料 server-python   | 敏感词 Python 服务器                                 |
| luci-app-statistics               | 流量监控工具                                       |
| luci-app-tinyproxy                | Tinyproxy 是 HTTP(S)代理服务器                     |
| luci-app-transmission             | BT 下载工具                                        |
| luci-app-travelmate               | 旅行路由器                                         |
| luci-app-ttyd                     | 网页终端命令行                                     |
| luci-app-udpxy                    | udpxy 做组播服务器                                 |
| luci-app-uhttpd                   | uHTTPd Web 服务器                                  |
| luci-app-unblockmusic             | 解锁网易云灰色歌曲 3 合 1 新版本                      |
| CONFIG_UnblockNeteaseMusic_Go     | Golang 版本                                        |
| CONFIG_UnblockNeteaseMusic_NodeJS | NodeJS 版本                                        |
| luci-app-unbound                  | Unbound DNS 解析器                                 |
| luci-app-usb-printer              | USB 打印服务器                                      |
| luci-app-v 贰瑞-server             | v 贰瑞 服务器                                        |
| luci-app-vnstat                   | vnStat 网络监控（图表）                              |
| luci-app-verysync                 | 微力同步                                            |
| luci-app-watchcat                 | 断网检测功能与定时重启                                |
| luci-app-virtual                  | **bypassvirtual** BypassWebUI 绕过 virtual\*\*设置  |
| luci-app-wireguard                | virtual\*\*服务器 WireGuard 状态                    |
| luci-app-webadmin                 | Web 管理页面设置                                     |

## 支持 iPv6

```sh
CONFIG_PACKAGE_ipv6helper           # ipv6 帮助
CONFIG_PACKAGE_odhcp6c              # ipv6 dhcp
CONFIG_PACKAGE_odhcp6c_ext_cer_id=0 # 暂时未知
CONFIG_PACKAGE_odhcpd-ipv6only      # 仅ipv6 dhcp
CONFIG_PACKAGE_luci-proto-ipv6      # ipv6 端口
CONFIG_PACKAGE_luci-proto-ppp       # ppp 端口
CONFIG_PACKAGE_iputils-traceroute6  # ipv6诊断
```

## 弃用或者合并

```sh
敏感词 Socks and Tunnel（已弃）
Socks Server                        # socks代理服务器（已弃）
luci-app-smartdns                   # SmartDNS本地服务器（已弃）
luci-app-s-s                        # SS低调上网（已弃）
luci-app-p p t p-server             # virtual**服务器 p p t p（已弃）
luci-app-oscam                      # OSCAM服务器（已弃）
luci-app-ngrokc                     # Ngrok 内网穿透（已弃）
luci-app-mmc-over-gpio              # 添加SD卡操作界面（已弃）
luci-app-kooldns                    # virtual**服务器 ddns替代方案（已弃）
luci-app-koolproxy                  # KP去广告（已弃）
luci-app-gfwlist                    # GFW域名列表（已弃）
luci-app-dnspod                     # DNSPod动态域名解析（已弃）
luci-app-caldav                     # 联系人（已弃）
luci-app-bird4                      # Bird 4（未知）（已弃）
luci-app-bird6                      # Bird 6（未知）（已弃）
luci-app-aliddns                    # 阿里DDNS客户端（已弃，集成至ddns）
luci-app-adbyby                     # 广告过滤大师（已弃）
luci-app-adkill                     # 广告过滤（已弃）
luci-app-multiwan                   # 多拨虚拟网卡（已弃，移至syncdial）
luci-app-mwan                       # MWAN负载均衡（已弃）
luci-app-乳酸菌饮料-pro               # 乳酸菌饮料-Pro（已弃）
luci-app-v贰瑞-pro                   # v贰瑞透明代理（已弃，集成乳酸菌饮料）
luci-app-unblockneteasemusic-go     # 解除网易云音乐（合并）
luci-app-unblockneteasemusic-mini   # 解除网易云音乐（合并）
luci-app-webshell                   # 网页命令行终端（已弃）
```
