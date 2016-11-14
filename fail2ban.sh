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



#Install 
if [ "$OS"='CentOS' ]; then
  yum -y install epel-release
  yum -y install fail2ban
  elif [[ "${OS}" =~ ^Ubuntu$|^Debian$ ]]; then
    apt-get -y install fail2ban
  fi

#Config
echo [DEFAULT] >>/etc/fail2ban/jail.local
echo ignoreip = 127.0.0.1 >>/etc/fail2ban/jail.local
echo bantime = 86400 >>/etc/fail2ban/jail.local
echo maxretry = 3  >>/etc/fail2ban/jail.local
echo findtime = 1800  >>/etc/fail2ban/jail.local

echo [ssh-iptables] >>/etc/fail2ban/jail.local
echo enabled = true >>/etc/fail2ban/jail.local
echo filter = sshd >>/etc/fail2ban/jail.local
echo action = iptables[name=SSH, port=ssh, protocol=tcp] >>/etc/fail2ban/jail.local
echo logpath = /var/log/secure >>/etc/fail2ban/jail.local
echo maxretry = 2 >>/etc/fail2ban/jail.local
echo findtime = 3600 >>/etc/fail2ban/jail.local
echo bantime = 2592000 >>/etc/fail2ban/jail.local

#start
if [ "$OS"='CentOS' ]; then
	if [ "$CentOS_RHEL_version" = '7' ]; then
		systemctl restart fail2ban
		systemctl enable fail2ban
	else
		service restart fail2ban
		chkconfig fail2ban on
	fi
fi

if [[ "${OS}" =~ ^Ubuntu$|^Debian$ ]]; then
	service restart fail2ban
fi
