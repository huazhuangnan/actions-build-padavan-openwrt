#!/usr/bin/env bash
# # # # # # # # # # #
#   公用脚本
#     花妆男
# # # # # # # # # # #
set -u

# PROXY="http://127.0.0.1:1080/pac"
PROXY="http://$(cat /etc/resolv.conf|grep nameserver|awk '{print $2}'):1080/pac"

# 设置代理
start_proxy(){
  export all_proxy=$PROXY
  export http_proxy=$PROXY
  export https_proxy=$PROXY
  echo $PROXY
}
# 卸载代理
end_proxy(){
  unset all_proxy
  unset http_proxy
  unset https_proxy
}

# 打印运行时间，参数： seconds
print_run_time(){
  seconds=$1
  if [ $seconds -lt 60 ]; then
    echo "${seconds}s"
  elif [ $seconds -ge 60 ] && [ $seconds -lt 3600 ];then
    echo "$(( $seconds / 60 ))m$(( $seconds % 60 ))s"
  elif [ $seconds -ge 3600 ]; then
    echo "$(( $seconds / 3600 ))h$(( ($seconds % 3600) / 60 ))m$(( ($seconds % 3600) % 60 ))s"
  fi
}

# 调用
if [ $# -eq 1 ]; then
  $1
else
  $1 ${@:2}
fi
