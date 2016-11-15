clear
#CheckIfRoot
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }


#ReadSSHPort
[ -z "`grep ^Port /etc/ssh/sshd_config`" ] && ssh_port=22 || ssh_port=`grep ^Port /etc/ssh/sshd_config | awk '{print $2}'`

#CheckOS
if [ -n "$(grep 'Aliyun Linux release' /etc/issue)" -o -e /etc/redhat-release ]; then
  OS=CentOS
  [ -n "$(grep ' 7\.' /etc/redhat-release)" ] && CentOS_RHEL_version=7
  [ -n "$(grep ' 6\.' /etc/redhat-release)" -o -n "$(grep 'Aliyun Linux release6 15' /etc/issue)" ] && CentOS_RHEL_version=6
  [ -n "$(grep ' 5\.' /etc/redhat-release)" -o -n "$(grep 'Aliyun Linux release5' /etc/issue)" ] && CentOS_RHEL_version=5
elif [ -n "$(grep 'Amazon Linux AMI release' /etc/issue)" -o -e /etc/system-release ]; then
  OS=CentOS
  CentOS_RHEL_version=6
elif [ -n "$(grep 'bian' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == "Debian" ]; then
  OS=Debian
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  Debian_version=$(lsb_release -sr | awk -F. '{print $1}')
elif [ -n "$(grep 'Deepin' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == "Deepin" ]; then
  OS=Debian
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  Debian_version=$(lsb_release -sr | awk -F. '{print $1}')
# kali rolling
elif [ -n "$(grep 'Kali GNU/Linux Rolling' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == "Kali" ]; then
  OS=Debian
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  if [ -n "$(grep 'VERSION="2016.*"' /etc/os-release)" ]; then
    Debian_version=8
  else
    echo "${CFAILURE}Does not support this OS, Please contact the author! ${CEND}"
    kill -9 $$
  fi
elif [ -n "$(grep 'Ubuntu' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == "Ubuntu" -o -n "$(grep 'Linux Mint' /etc/issue)" ]; then
  OS=Ubuntu
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  Ubuntu_version=$(lsb_release -sr | awk -F. '{print $1}')
  [ -n "$(grep 'Linux Mint 18' /etc/issue)" ] && Ubuntu_version=16
elif [ -n "$(grep 'elementary' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == 'elementary' ]; then
  OS=Ubuntu
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  Ubuntu_version=16
else
  echo "${CFAILURE}Does not support this OS, Please contact the author! ${CEND}"
  kill -9 $$
fi



if [ ${OS} == CentOS ]; then
  yum -y remove fail2ban
fi

if [ ${OS} == Ubuntu ] || [ ${OS} == Debian ];then
  apt-get -y remove fail2ban
fi

rm -rf /etc/fail2ban
