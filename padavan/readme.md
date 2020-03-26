# 文件以及参数说明(自理解仅供参考)

- [必看说明](#Should)
- [C 大支持设备](#Device)
- [C 大插件分类和说明](#Plugins)

## Should

1. 设备有关参数见 public.sh 或者自定义的 sh
2. 编译支持同时多个设备编译，padavan有些设备编译比较快
3. 版本号自动根据当天日期实现更改
4. 拷贝模板里面的文件修改模板默认配置
5. 文件夹名字。文件名必须和模板的一样
6. 支持单个编译和多个编译

## Device

- PSG1208 (k1)
- PSG1218 (k2)
- PSG712
- 5K-W20 (USB)
- OYE-001 (USB)
- NEWIFI-MINI (USB)
- MI-MINI (USB)
- MI-3 (USB)
- MI-R3G (USB)
- HC5661A
- HC5761A (USB)
- HC5861B
- 360P2 (USB)
- MI-NANO
- MZ-R13
- MZ-R13P
- RT-AC1200GU (USB)
- XY-C1 (USB)
- WR1200JS (USB)
- NEWIFI3 (USB)
- K2P
- K2P-USB (USB)
- JCG-836PRO (USB)
- JCG-AC860M (USB)
- DIR-882 (USB)
- DIR-878
- MR2600 (USB)
- JDC-1 (京东云)
- GHL (歌华链)
- NEWIFI-D1
- B70
- JCG-AC856M
- JCG-AC836M
- YK-L1(L1、L1C、L1W 通刷)

## Plugins

### 游戏加速

| 名字              | 变量                                |
| ---------------- | ----------------------------------- |
| [SS plus+][ss+]  | CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS |
| [SS server][sss] | CONFIG_FIRMWARE_INCLUDE_SSSERVER    |
| v2ray 执行文件    | CONFIG_FIRMWARE_INCLUDE_V2RAY       |
| trojan 执行文件   | CONFIG_FIRMWARE_INCLUDE_TROJAN      |

[ss+]: https://github.com/coolsnowwolf/lede
[sss]: https://github.com/shadowsocks/shadowsocks-libev

> 备注
>
> - 集成 v2ray 执行文件（3.8M 左右)，如果不集成，会从网上下载下来执行，不影响正常使用
> - 集成 trojan 执行文件(1.1M 左右)，如果不集成，会从网上下载下来执行，不影响正常使用

### 广告

| 名字                 | 变量                                |
| ------------------- | ----------------------------------- |
| [adbyby plus+][adb] | CONFIG_FIRMWARE_INCLUDE_ADBYBY      |
| [Kool][kp]          | CONFIG_FIRMWARE_INCLUDE_KOOLPROXY   |
| [ADGUARD][adg]      | CONFIG_FIRMWARE_INCLUDE_ADGUARDHOME |

[adb]: https://github.com/coolsnowwolf/lede
[kp]: http://koolshare.cn/thread-64086-1-1.html
[adg]: https://github.com/coolsnowwolf/lede

> 备注

### DNS 有关

| 名字                        | 变量                                 |
| -------------------------- | ------------------------------------ |
| [adbyby plus+][adb]        | CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER |
| [smartdns][kp]             | CONFIG_FIRMWARE_INCLUDE_SMARTDNS     |
| [smartdns-二进制文件][adg]   | CONFIG_FIRMWARE_INCLUDE_SMARTDNSBIN  |

> 备注

### 文件

| 名字                            | 变量                          |
| -------------------------------| ----------------------------- |
| [CADDY 在线文件管理服务][caddy]   | CONFIG_FIRMWARE_INCLUDE_CADDY |
| caddy 执行文件                   | CONFIG_FIRMWARE_INCLUDE_CADDY |

[caddy]: https://github.com/hacdias/filebrowser

> 备注
>
> - caddy 执行文件，此文件有 13M,请注意固件大小。如果不集成，会从网上下载下来执行，不影响正常使用

### 穿透

| 名字                  | 变量                             |
| --------------------- | ------------------------------- |
| 阿里 DDNS             | CONFIG_FIRMWARE_INCLUDE_ALIDDNS |
| [穿透客户端 FRPC][fr]  | CONFIG_FIRMWARE_INCLUDE_FRPC    |
| [穿透服务端 FRPS][fr]  | CONFIG_FIRMWARE_INCLUDE_FRPS    |

[fr]: https://github.com/fatedier/frp

> 备注

### 代理

| 名字                        | 变量                                        |
| -------------------------- | ------------------------------------------- |
| [TUNSAFE][tunsafe]         | CONFIG_FIRMWARE_INCLUDE_TUNSAFE             |
| KUMA                       | CONFIG_FIRMWARE_INCLUDE_KUMASOCKS           |
| [srelay][srelay]           | CONFIG_FIRMWARE_INCLUDE_SRELAY              |
| IPT2                       | CONFIG_FIRMWARE_INCLUDE_IPT2SOCKS           |
| MICRO                      | CONFIG_FIRMWARE_INCLUDE_MICROSOCKS          |
| [softether-vpnserver][sevpn] | CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_SERVER |
| [softether-vpnclient][sevpn] | CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CLIENT |
| [softether-vpncmd][sevpn]    | CONFIG_FIRMWARE_INCLUDE_SOFTETHERVPN_CMD    |

[tunsafe]: https://github.com/TunSafe/TunSafe
[srelay]: https://socks-relay.sourceforge.io/
[sevpn]: https://github.com/SoftEtherVPN/SoftEtherVPN_Stable

> 备注

### 校园网

| 名字                                  | 变量                                 |
| ------------------------------------- | ----------------------------------- |
| [dogcom 校园网][dogcom]                | CONFIG_FIRMWARE_INCLUDE_DOGCOM      |
| [锐捷认证][tunsafe]                    | CONFIG_FIRMWARE_INCLUDE_MENTOHUST   |
| [minieap][minieap]                    | CONFIG_FIRMWARE_INCLUDE_MINIEAP     |
| [SCUT][scutclient]                    | CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT  |
| [drcom][drcom]                        | CONFIG_FIRMWARE_INCLUDE_GDUT_DRCOM  |
| [njit-client][njit-client]            | CONFIG_FIRMWARE_INCLUDE_NJIT_CLIENT |
| [NAPT66 教育网 ipv6][napt66]           | CONFIG_FIRMWARE_INCLUDE_NAPT66      |
| [mentohust-锐捷、赛尔认证][mentohust]   | CONFIG_FIRMWARE_INCLUDE_MENTOHUST   |

[minieap]: https://github.com/hanwckf/minieap
[dogcom]: https://github.com/hanwckf/dogcom
[drcom]: https://github.com/chenhaowen01/gdut-drcom
[scutclient]: https://github.com/hanwckf/scutclient
[njit-client]: https://github.com/hanwckf/njit8021xclient
[napt66]: https://github.com/mzweilin/napt66
[mentohust]: https://github.com/hanwckf/mentohust-1

> 备注
>
> - minieap 扩展的 802.1x 客户端，带有锐捷 v3 (v4) 算法插件支持
> - scutclient 华南理工大学
> - njit-client 南京工程学院 802.1X 客户端

### 其他

| 名字                                           | 变量                             |
| --------------------------------------------- | -------------------------------- |
| [vlmcsd-KMS 服务器][vlmc]                            | CONFIG_FIRMWARE_INCLUDE_VLMCSD   |
| [ttyd-网页终端][ttyd]                          | CONFIG_FIRMWARE_INCLUDE_TTYD     |
| [lrzsz-文件互传][lrzse]                        | CONFIG_FIRMWARE_INCLUDE_LRZSZ    |
| [curl][curl]                                  | CONFIG_FIRMWARE_INCLUDE_CURL     |
| [htop-进程浏览][htop]                          | CONFIG_FIRMWARE_INCLUDE_HTOP     |
| [nano-文本编辑器][nano]                        | CONFIG_FIRMWARE_INCLUDE_NANO     |
| [iperf3-网络测试][ipres3]                      | CONFIG_FIRMWARE_INCLUDE_IPERF3   |
| [dump1090-RTLSDR 设备模式 S 解码器][dump1090]   | CONFIG_FIRMWARE_INCLUDE_DUMP1090 |
| [rtl-sdr][rtl-sdr]                            | CONFIG_FIRMWARE_INCLUDE_RTL_SDR  |
| [samba3.6][samba3.6]                          | CONFIG_FIRMWARE_INCLUDE_SMBD36   |
| [mtr-网络诊断工具][mtr]                         | CONFIG_FIRMWARE_INCLUDE_MTR      |
| [socat][socat]                                | CONFIG_FIRMWARE_INCLUDE_SOCAT    |

[curl]: https://github.com/curl/curl
[vlmc]: https://github.com/hanwckf/vlmcsd
[ttyd]: https://github.com/tsl0922/ttyd
[lrzse]: https://ohse.de/uwe/software/lrzsz.html
[htop]: https://hisham.hm/htop/releases/
[nano]: https://www.nano-editor.org/dist/
[ipres3]: https://github.com/esnet/iperf
[dump1090]: https://github.com/hanwckf/dump1090
[rtl-sdr]: https://github.com/osmocom/rtl-sdr
[samba3.6]: https://gitlab.com/padavan-ng/padavan-ng/tree/master/trunk/user/samba36
[rtl-sdr]: https://github.com/osmocom/rtl-sdr
[mtr]: https://github.com/traviscross/mtr
[socat]: http://www.dest-unreach.org/socat

> 备注
>
> - rtl-sdr 实现 USB 接口的接收机
> - samba3.6 实现 SMB 协议
> - socat 个多功能的网络工具
