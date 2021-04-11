# GitHub Action 学习实例 - 自动编译 padavan 和 openWrt

## 前言

- 目前本人手上只有这几个设备，所以只测试这几个

  - PSG1218(k2，超频 600，按我的参数编译 16-22 分钟，~7.07mb)
  - NEWIFI3(新三，按我的参数编译大概 28-35 分钟，~25.5mb，集成了 v2 二进制文件和 frp 所以大)
  - G-DOCK(竞斗云 2.0，按我的参数编译大概 3 小时 30 分钟，~57mb(ubi 包)。
  - 编译好的固件最好双清或者 breed，opboot，uboot，清除后刷入，防止修改了配置残余
  - 有关参数看设备的配置文件、sh文件、padavan或者openwrt对应 public.sh 文件

- 固件按理通用编译，但是还需测试，目前测试了的有，coolsnowwolf(雕大)的 openwrt(还集成了 Lienol 的包和 openclash，在 public.sh 里面)，chongshengB(C 大)的 padavan

- 特别说明，如果不需要编译某个固件删除相应的 yml 文件即可，添加请仔细阅读有关固件的文档

- 如果有啥问题欢迎提交 [Lssues](https://github.com/HuaZhuangNan/actions-build-padavan-openwrt/issues) 反馈或者 TG:[https://t.me/huazhuangnan](https://t.me/huazhuangnan)邮箱：huazhuangnan@foxmail.com

- 历史自编译网盘地址：[https://pan.baidu.com/s/10_4qsIDBsLracQb_4QK6Gg](https://pan.baidu.com/s/10_4qsIDBsLracQb_4QK6Gg);提取码：**r6ie**

- 恩山: [https://www.right.com.cn/forum/?567122](https://www.right.com.cn/forum/?567122)

- B 站(有视频): [https://space.bilibili.com/436465779](https://space.bilibili.com/436465779)

- 整理编写不易，喜欢的话右上角给个 **star** 呗

## [openwrt 单独参数及功能说明](/openwrt/readme.md)

## [padavan 单独参数及功能说明](/padavan/readme.md)

## 下载编译完成固件

- [Action 下载](https://github.com/HuaZhuangNan/actions-build-padavan-openwrt/actions)
- [具体下载图示](./screenshots/readme.md)

## 更新日志

- [PSG1218](./logs/k2.md)
- [NEWIFI3](./logs/n3.md)
- [G-DOCK2.0](./logs/g-dock.md)

## 本地编译

```bash
git clone https://github.com/HuaZhuangNan/actions-build-padavan-openwrt.git --depth=1 # 下载
cd actions-build-padavan-openwrt/scripts  # 进入目录        
chmod +x ./*.sh                       # 添加编译sh执行权限
./padavan.sh PSG1218 -s -p -l -o ./   # 编译 PSG1218 详细日志 开启代理 修改登录页
```

## github 编译方法

- 注：所有固件都是下载的，所以需要编译其他版本的yml去改连接和编译的配置就好
- **Fork** 到自己仓库后(按需修改配置文件)
- 需要哪种方式编译，打开 yml 文件里面的注释就好(就是删除#号)
- 文件打包完会在 action 的任务里面

### 监听文件 `push` 编译（默认编译，需要其他方式，打开注释修改或自己添加就好）

- 选择按log文件默认的原因
  1. 方便查看管理
  2. 防止多次的push多次编译
  3. 防止不是自己点击 star 之后 Actions 还是会有显示

- 编译模板 yml 里面也有例子

```yml
push:                     # push 操作
  branches:               # 分支
    - master              # 主分支
  # paths:                # 路径
  #   - padavan/*         # 监听padavan目录下所有文件的push操作
  paths:                  # 路径
    - logs/k2.md          # 监听logs目录下 k2.md 的push操作 (默认)
```

### 星标 `star` 编译

- yml文件打开注释点击 **star** (星标开始全部编译)；依赖这句判断是仓库持有者点击:`github.event.repository.owner.id == github.event.sender.id`

```yml
watch:                     # 监视操作
    types: started         # 点击 star 之后,可以写数组形式，具体可以参考官方文档
```

### 定时 `schedule` 编译

- 定时编译方法 [GitHub 官方文档](https://help.github.com/en/actions/reference/events-that-trigger-workflows#scheduled-events-schedule)
- 编译模板 yml 文件中有个每天北京时间凌晨 3 点编译的例子

```yml
schedule:                 # 时间表
  - cron: "0 19 * * *"    # 每天国际时间 19 点，北京时间 3 点执行(北京+8)
```

## 目录说明

```json
  |-- .editorconfig     # 编辑规范
  |-- .github           # GitHub 工作目录
  |   |-- workfloms     # 存放 Action 的 YML文件
  |-- openwrt           # openwrt 有关
  |   |-- backups       # openwrt 文件备份 以及 openwrt 编译模板
  |   |-- public.sh     # 公共的修改执行文件
  |-- padavan           # padavan 有关
  |   |-- backups       # padanvan文件备份 以及 padavan 编译模板
  |   |-- public.sh     # 公共的修改执行文件
  |-- screenshots       # 效果目录
  |-- logs              # 更新日志目录
  |-- scripts           # 脚本目录
```

## [编译结果欣赏图](./screenshots/readme.md)

## Action 常用参数说明

> - name 自动构建的名字
> - on 触发条件
>
>   - schedule:                 # 时间表
>     - cron: '0 19 \* \* \*'   # 每天国际时间 19 点，北京时间凌晨 3 点执行(北京+8)
>   - watch                     # 监视
>     - type: started           # 类型：点击了星标
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

- [adguardhome 插件](https://github.com/rufengsuixing/luci-app-adguardhome) © rufengsuixing

- [Hello Word 插件](https://github.com/jerrykuku/luci-app-vssr) © jerrykuku

- [Hello Word 插件修复冲突版](https://github.com/Leo-Jo-My/luci-app-vssr-plus) © Leo-Jo-My

- [OpenAppFilter 插件](https://github.com/destan19/OpenAppFilter) © destan19

- [openwrt 插件配置参考恩山](https://www.right.com.cn/forum/thread-344825-1-1.html) © xtwz

- [padavan 源码](https://github.com/chongshengB/rt-n56u) © chongshengB

- [padavan 构建参考](https://github.com/chongshengB/Padavan-build) © chongshengB

## License

[MIT](./LICENSE) © HuaZhuangNan(花妆男)
