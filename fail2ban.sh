









            apt-get install fail2ban
        systemctl enable fail2ban
        systemctl restart fail2ban
      elif ["$CentOS_RHEL_version" == '7']; then
      elif ["$OS" == 'Debian']; then
    apt-get install fail2ban
    chkconfig fail2ban on
    Debian_version=8
    echo "${CFAILURE}Does not support this OS, Please contact the author! ${CEND}"
    kill -9 $$
    service fail2ban restart
    TARGET_ARCH="arm64"
    TARGET_ARCH="armv7"
    TARGET_ARCH="unknown"
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  [ ! -e "$(which lsb_release)" ] && { apt-get -y update; apt-get -y install lsb-release; clear; }
  [ -n "$(grep ' 5\.' /etc/redhat-release)" -o -n "$(grep 'Aliyun Linux release5' /etc/issue)" ] && CentOS_RHEL_version=5
  [ -n "$(grep ' 6\.' /etc/redhat-release)" -o -n "$(grep 'Aliyun Linux release6 15' /etc/issue)" ] && CentOS_RHEL_version=6
  [ -n "$(grep ' 7\.' /etc/redhat-release)" ] && CentOS_RHEL_version=7
  [ -n "$(grep 'Linux Mint 18' /etc/issue)" ] && Ubuntu_version=16
  armPlatform="y"
  CentOS_RHEL_version=6
  Debian_version=$(lsb_release -sr | awk -F. '{print $1}')
  Debian_version=$(lsb_release -sr | awk -F. '{print $1}')
  echo "${CFAILURE}Does not support this OS, Please contact the author! ${CEND}"
  elif ["$CentOS_RHEL_version" == '6']; then
  elif ["$OS" == 'Ubuntu']; then
  elif uname -m | grep -Eqi "armv8"; then
  else
  else
  fi
  fi
  fi
  fi
  if [ -n "$(grep 'VERSION="2016.*"' /etc/os-release)" ]; then
  if uname -m | grep -Eqi "armv7"; then
  kill -9 $$
  OS=CentOS
  OS=CentOS
  OS=Debian
  OS=Debian
  OS=Debian
  OS=Ubuntu
  OS=Ubuntu
  OS_BIT=32
  OS_BIT=64
  SYS_BIG_FLAG=i586
  SYS_BIG_FLAG=x64 #jdk
  SYS_BIT_a=x86;SYS_BIT_b=i686;
  SYS_BIT_a=x86_64;SYS_BIT_b=x86_64; #mariadb
  Ubuntu_version=$(lsb_release -sr | awk -F. '{print $1}')
  Ubuntu_version=16
 yum -y install epel-release
 yum -y install fail2ban
#
# kali rolling
#!/bin/bash
#Check OS
#Config
#install
#Start
[ $LIBC_YN == '0' ] && GLIBC_FLAG=linux-glibc_214 || GLIBC_FLAG=linux
cd /etc/fail2ban
chkconfig fail2ban on
chkconfig fail2ban on
elif [ -n "$(grep 'Amazon Linux AMI release' /etc/issue)" -o -e /etc/system-release ]; then
elif [ -n "$(grep 'bian' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == "Debian" ]; then
elif [ -n "$(grep 'Deepin' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == "Deepin" ]; then
elif [ -n "$(grep 'elementary' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == 'elementary' ]; then
elif [ -n "$(grep 'Kali GNU/Linux Rolling' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == "Kali" ]; then
elif [ -n "$(grep 'Ubuntu' /etc/issue)" -o "$(lsb_release -is 2>/dev/null)" == "Ubuntu" -o -n "$(grep 'Linux Mint' /etc/issue)" ]; then
else
else
fi
fi
fi
fi
if [ "$(getconf WORD_BIT)" == "32" ] && [ "$(getconf LONG_BIT)" == "64" ]; then
if [ -n "$(grep 'Aliyun Linux release' /etc/issue)" -o -e /etc/redhat-release ]; then
if ["$CentOS_RHEL_version" == '5']; then
if ["$OS" == 'CentOS']; then
if ["$OS" == 'Ubuntu']; then
if uname -m | grep -Eqi "arm"; then
LIBC_YN=$(awk -v A=$(getconf -a | grep GNU_LIBC_VERSION | awk '{print $NF}') -v B=2.14 'BEGIN{print(A>=B)?"0":"1"}')
service fail2ban restart
service fail2ban restart
THREAD=$(grep 'processor' /proc/cpuinfo | sort -u | wc -l)
wget http://cn1.ixh.me/jail.local