
experiment to use [taskl] to automate configuration of cerowrt, with a bit less duplication than the shell script provided in the cerowrt wiki page about autoconfiguration ([cerowrt-autoconfig]).


  taskl //cerowrt <cerowrt.yaml > cerowrt.bash
  bash cerowrt.bash show

  ssh root@cerowrt.home.lan "opkg update; opkg install bash; bash" <cerowrt.bash


[taskl]: https://github.com/solidsnack/taskl
[cerowrt-autoconfig]: http://www.bufferbloat.net/projects/cerowrt/wiki/Automated_Configuration_of_CeroWrt
