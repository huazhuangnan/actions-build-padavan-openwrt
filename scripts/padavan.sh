#!/usr/bin/env bash
# # # # # # # # # # #
#   构建 pandavan
#     花妆男
# # # # # # # # # # #
set -u

AUTHOR='花妆男<huazhuangnan@qq.com>'                     # 作者
APP_URL='https://github.com/HuaZhuangNan/actions-build-padavan-openwrt' # 地址
VERSION='1.0.0'                                         # 版本号

CURRENT_DIR=`pwd`                                       # 当前目录
ROOT_DIR=$(dirname $CURRENT_DIR)                        # 项目根目录
BASE_DIR="${ROOT_DIR}/padavan"                          # 基础目录
OUT_DIR="${ROOT_DIR}/out/$(date '+%Y-%m-%d')"           # 输出文件夹
PUBLIC_SH="public.sh"                                   # 公共命令
HTTP_FILE="httpd.c"                                     # httpd 文件
LOGIN_PAGE="Login.asp"                                  # 登录页面
CLONE_URL="https://github.com/chongshengB/rt-n56u.git/" # padavan地址
CLONE_BRANCH="master"                                   # padavan分支
WORK_DIR="/opt/rt-n56u"                                 # 工作目录
TOOL_DIR="toolchain-3.4.x"                              # 工具链目录

APP_LOG="${OUT_DIR}/app.log"                            # 日志文件
START_TIME=`date +%Y%m%d-%H:%M:%S`                      # 开始时间
START_TIME_S=`date +%s`                                 # 开始时间秒数

DEVICES=()                                              # 设备数组
SHOW_FLAG=false                                         # 显示详细信息到控制台
PROXY_FLAG=false                                        # 是否开启代理
TOOL_FLAG=false                                         # 是否不下载让本地编译工具链
LOGIN_FLAG=false                                        # 是否修改登录页面

# 使用说明
usage() {
  app_info
cat 1>&2 <<EOF
usage: padavan.sh <devers> <options> ...
  <devers> :
    PSG1218 NEWIFI3 ...
  <options> :
    -v [--version]    显示版本号
    -h [--help]       显示帮助信息
    -s [--show]       显示日志到控制台
    -l [--login]      是否修改登录页面
    -p [--proxy]      开启代理
    -t [--tool]       不下载让本地编译工具链
    -o [--out] <dir>  输出目录
EOF
}
# 编译
build(){
  deivce=$1
  echo "开始编译设备：${deivce}"
  cd $WORK_DIR/trunk
  \cp -f ./configs/templates/$deivce.config .config # 拷贝模板到 .config
  echo "执行 ${PUBLIC_SH} sh"
  sudo ./$PUBLIC_SH
  if [ -e ./$deivce.sh ]; then
    echo "执行自定义 ${deivce} sh"
    sudo ./$deivce.sh
  fi
  if [ ! -d ${WORK_DIR}/images ];then
    sudo mkdir -vp ${WORK_DIR}/images
  fi
  \cp -f .config ${WORK_DIR}/images/$deivce.config
  sudo ./clear_tree
  fakeroot ./build_firmware_modify $deivce 0
}
# app 信息
app_info(){
  echo "author: ${AUTHOR}"
  echo "version: ${VERSION}"
  echo "addrress: ${APP_URL}"
}
# app
app(){
  echo "运行开始：${START_TIME}"

  if [ $index -eq 0 ];then
    echo '至少填写一个设备'
    exit 1
  fi

  echo "获取到设备：${DEVICES}"

  if [ $PROXY_FLAG = true ];then
    echo '设置代理'
    bash $CURRENT_DIR/public.sh start_proxy
  fi

  echo '初始化'
  set_file='/usr/share/zoneinfo/Asia/Shanghai'
  user_file='/etc/localtime'
  diff $set_file $user_file > /dev/null
  if [ $? != 0 ]; then
    echo '设置时区'
    which which > /dev/null
    if [ $? = 0 ];then
      sudo timedatectl set-timezone 'Asia/Shanghai'
    else
      sudo \cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    fi
  fi

  echo '安装依赖'
  sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y autoclean
  sudo apt-get -y install unzip libtool-bin curl cmake gperf gawk flex bison nano xxd fakeroot \
    cpio git python-docutils gettext automake autopoint texinfo build-essential help2man \
    pkg-config zlib1g-dev libgmp3-dev libmpc-dev libmpfr-dev libncurses5-dev libltdl-dev libc-dev-bin wget curl p7zip-full

  if [ -d $WORK_DIR ]; then
    echo '升级源码'
    cd $WORK_DIR
    git pull
  else
    echo '拉取源码'
    git clone $CLONE_URL -b $CLONE_BRANCH $WORK_DIR --depth=1
  fi


  if [ ! -d $WORK_DIR/toolchain-mipsel/$TOOL_DIR ]; then
    cd $WORK_DIR/toolchain-mipsel
    if [ $TOOL_FLAG = true ]; then
      echo '编译工具链'
      ./clean_toolchain
      ./build_toolchain
    else
      echo '下载工具链'
      sh ./dl_toolchain.sh
    fi
  fi

  # if [ ! -f $WORK_DIR/trunk/tools/go/go1.15.2.linux-amd64.tar.gz ]; then
  #   echo '下载go '
  #   curl --create-dirs -L https://gomirrors.org/dl/go/go1.15.2.linux-amd64.tar.gz -o $WORK_DIR/trunk/tools/go/go1.15.2.linux-amd64.tar.gz
  # fi

  if [ $LOGIN_FLAG = true ]; then
    \cp -f $BASE_DIR/public/$HTTP_FILE $WORK_DIR/trunk/user/httpd/httpd.c
    \cp -f $BASE_DIR/public/$LOGIN_PAGE $WORK_DIR/trunk/user/www/n56u_ribbon_fixed/$LOGIN_PAGE
    echo '修改登录页'
  else
    echo '不修改登录页'
  fi

  if [ -e $BASE_DIR/public/$PUBLIC_SH ]; then
    echo '拷贝公共sh文件'
    \cp -f $BASE_DIR/public/$PUBLIC_SH $WORK_DIR/trunk/$PUBLIC_SH
    sudo chmod +x $WORK_DIR/trunk/$PUBLIC_SH
  fi
  for t_item in $DEVICES; do
    if [ ! -e $BASE_DIR/$t_item/$t_item.config ]; then
      echo "${BASE_DIR}/${t_item}/${t_item}.config 自定义模板文件未找到"
    else
      echo "修改 ${t_item} 模板"
      \cp -f $BASE_DIR/$t_item/$t_item.config $WORK_DIR/trunk/configs/templates/$t_item.config
    fi
    if [ ! -f $BASE_DIR/$t_item/$t_item.sh ]; then
      echo "${BASE_DIR}/${t_item}/${t_item}.sh 自定义SH文件未找到"
    else
      echo "拷贝 ${t_item} 自定义SH文件"
      \cp -f $BASE_DIR/$t_item/$t_item.sh $WORK_DIR/trunk/$t_item.sh
      sudo chmod +x $WORK_DIR/trunk/$t_item.sh
    fi

    if [ $SHOW_FLAG = true ];then
      build $t_item |tee -a "$OUT_DIR/$t_item.log"
    else
      build $t_item >> "$OUT_DIR/$t_item.log" 2>&1
    fi

  done

  if [ -f $WORK_DIR/trunk/images/${DEVICES[0]}.log ];then
    echo '拷贝固件和配置和日志'
    \cp -f $WORK_DIR/trunk/images/*.trx $OUT_DIR
    \cp -f $WORK_DIR/trunk/images/*.log $OUT_DIR
    \cp -f $WORK_DIR/trunk/images/*.config $OUT_DIR
  fi

  if [ $PROXY_FLAG = true ];then
    echo '取消代理'
    bash $CURRENT_DIR/public.sh end_proxy
  fi

}

# 主运行函数
main(){
  index=0                                                # 下标
  lastCmd=''                                             # 上个指令

  for key in $@
  do
    case $key in
      '-v'|'--version') # 显示版本号
        app_info
        if [ $# -eq 1 ];then
         exit 0
        fi
      ;;
      '-h'|'--help') # 显示帮助信息
        usage
        if [ $# -eq 1 ];then
        exit 0
        fi
      ;;
      '-s'|'--show') # 显示日志到控制台
        SHOW_FLAG=true
      ;;
      '-p'|'--proxy') # 代理
        PROXY_FLAG=true
      ;;
      '-l'|'--login')  # 修改登录页面
        LOGIN_FLAG=true
      ;;
      '-t'|'--tool') # 工具链
        TOOL_FLAG=true
      ;;
      '-o'|'--out') # 输出目录
        TOOL_FLAG=true
      ;;
      *)
        if [ "$lastCmd" = '-o' ] || [ "$lastCmd" = '--out' ];then # 日志目录设置
          OUT_DIR=$key
        else
          DEVICES[$index]=$key
          index=$(($index+1))
        fi
      ;;
    esac
  done

  if [ ! -d $OUT_DIR ];then
    sudo mkdir -vp $OUT_DIR
    echo '创建日志目录' |tee -a $APP_LOG
  else
    \rm -rf $OUT_DIR/trunk/images/*.log
    \rm -rf $OUT_DIR/trunk/images/*.config
  fi

  app |tee -a $APP_LOG

  endTime=`date +%Y%m%d-%H:%M:%S`
  endTime_s=`date +%s`
  sumTime=$(($endTime_s - $START_TIME_S))
  echo "程序运行： ${START_TIME} --> ${endTime} 耗时: $(bash $CURRENT_DIR/public.sh print_run_time $sumTime)"  |tee -a $APP_LOG
  exit 0
}
main $@

