# GitHub Action 学习实例 - 自动编译 padavan 和 openWrt

## 前言

- 目前本人手上只有这几个设备，所以只测试这几个
  - PSG1218(k2，超频600，按我的参数编译16-22分钟，~7.07mb)
  - NEWIFI3(新三，按我的参数编译大概28-35分钟，~25.5mb，集成了v2二进制文件和frp所以大)
  - G-DOCK(竞斗云 2.0，按我的参数编译大概3小时30分钟，~57mb(ubi包),ssp,openClash,passwall,hellword等)
  - 编译好的固件最好双清或者breed，opboot，uboot，清除后刷入，防止残余
  - 默认参数看设备或者固件对应sh文件

- 固件按理通用编译，但是还需测试，目前测试了的有，coolsnowwolf(雕大)的 openwrt(还集成了Lienol的包和openclash，在public.sh里面)，chongshengB(C大)的 padavan

- 特别说明，如果不需要编译某个固件删除相应的 yml 文件即可，添加请仔细阅读有关固件的文档

- 如果有啥问题欢迎提交 [Lssues](https://github.com/HuaZhuangNan/actions-build-padavan-openwrt/issues) 反馈或者TG:[https://t.me/huazhuangnan](https://t.me/huazhuangnan)邮箱：huazhuangnan@foxmail.com

- 历史自编译网盘地址：[https://pan.baidu.com/s/1JM3bcyOBvK6yx\_-B_IaQrA](https://pan.baidu.com/s/1JM3bcyOBvK6yx_-B_IaQrA);提取码：**7a0u**

- 恩山: [https://www.right.com.cn/forum/?567122](https://www.right.com.cn/forum/?567122)

- B站(有视频): [https://space.bilibili.com/436465779](https://space.bilibili.com/436465779)

- 整理编写不易，喜欢给个 star ，本人主学 WEB，大专，现读大三找实习中，有啥好工作引荐下呗；

### [openwrt 单独参数及功能说明](/openwrt/readme.md)

### [padavan 单独参数及功能说明](/padavan/readme.md)

## 编译方法

### 默认编译

- fork 到自己仓库后(按需修改配置文件)然后点击 star (星标开始全部编译)；依赖这句判断:`github.event.repository.owner.id == github.event.sender.id`
- 文件打包完会在action的任务里面
- [Action下载](https://github.com/HuaZhuangNan/actions-build-padavan-openwrt/actions)
- [具体下载图示](./screenshots/readme.md)

### 定时编译

- 定时编译方法 [GitHub官方文档](https://help.github.com/en/actions/reference/events-that-trigger-workflows#scheduled-events-schedule)
- 编译模板yml文件中有个每天北京时间1点编译的例子

## 目录说明

```json
  |-- .editorconfig     # 编辑规范
  |-- .github           # GitHub 工作目录
  |   |-- workfloms     # 存放 Action 的 YML文件
  |-- openwrt           # openwrt 有关
  |   |-- backups       # openwrt 文件备份 以及 openwrt 编译模板
  |   |-- public        # 公共的修改文件
  |-- padavan           # padavan 有关
  |   |-- backups       # padanvan文件备份 以及 padavan编译模板
  |   |-- public        # 公共的修改文件
  |-- screenshots       # 效果目录
```

## [编译结果欣赏图](./screenshots/readme.md)

## Action 常用参数说明

> - name 自动构建的名字
> - on 触发条件
>   - schedule:
>     - cron: '0 17 * * *'    每天国际时间17点，北京时间1点执行(北京+8)
>   - watch 监视
>     - type: started 类型：点击了星标
>
> - env 环境变量
> - jobs 任务
> - build 工作的 id
> - run-on 工作运行的环境平台
> - if 工作运行的判断
> - steps 包含一系列任务步骤
>   - name 子任务名
>   - user 使用官方的一些库完成一些操作
>   - run 运行脚本
>   - id 运行 id

## 参考项目或文章

- [Github Action 官方 Help](https://help.github.com/cn/actions/)

- [Github Action 官方仓库](https://github.com/actions)

- [openwrt 源码](https://github.com/coolsnowwolf/lede) © coolsnowwolf

- [openwrt 构建参考](https://github.com/P3TERX/Actions-OpenWrt) © P3TERX

- [openwrt 构建参考](https://github.com/ljk4160/GDOCK) © ljk4160

- [openwrt 主题](https://github.com/sypopo/luci-theme-argon-mc) © sypopo

- [openwrt-OpenClash](https://github.com/vernesong/OpenClash) © vernesong

- [openwrt-packages 包](https://github.com/Lienol/openwrt-package) © Lienol

- [adguardhome 插件](https://github.com/rufengsuixing/luci-app-adguardhome)  © rufengsuixing

- [Hello Word 插件](https://github.com/Leo-Jo-My/luci-app-vssr) © Leo-Jo-My

- [openwrt 插件配置参考恩山](https://www.right.com.cn/forum/thread-344825-1-1.html) © xtwz

- [padavan 源码](https://github.com/chongshengB/rt-n56u) © chongshengB

- [padavan 构建参考](https://github.com/chongshengB/Padavan-build) © chongshengB

## License

[MIT](./LICENSE) © HuaZhuangNan(花妆男)
