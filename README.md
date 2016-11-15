# Fail2ban #
这是一个利用iptables和开源程序fail2ban来进行服务器简单防爆破的脚本。默认自带SSH防御规则。
# 功能 #
- 自助修改SSH端口
- 自定义最高封禁IP的时间（以小时为单位）
- 自定义SSH尝试连接次数
- 一键完成SSH防止暴力破解
# 支持系统 #
- Centos 6/7 (x86/x64)
- Ubuntu 14.04 (x86/x64)
- Ubuntu 16.10 (x86/x64)
- Debian 7 (x86/x64)
- Debian 8 (x86/x64)
# 注意事项 #
1. 安装完成后请会重启SSH服务，请重新连接SSH会话
2. 若出现SSH无法连接的情况，请检查是否修改过SSH端口，请填写写改后的正确端口进行连接
# 更新日志 #
2016.11.15 第一次提交，初步完成。
# 关于 #
Made by [FunctionClub](http://function.club "FunctionClub")
# 鸣谢 #
- [Fail2ban](http://www.fail2ban.org "Fail2ban")
- [Oneinstack](http://oneinstack.com "Oneinstack")