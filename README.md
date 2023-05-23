# kill-switch-v2ray
A bash for kill switch is v2raya program. When the v2raya service is stopped, the system traffic is interrupted.
--------
*** Pay attention to this important point, the kill switch only works properly when v2raya status is on running, and if it is on Ready mode, the kill switch does not actually work properly. ***
----------
In the following situation, the kill switch works correctly:
[running proxy.jpg](https://github.com/mojtaba13133/kill-switch-v2ray/blob/7eff6442404e7973464ac747afd2491e3f74719d/image.png)

In the following situation, the kill switch does not work properly:
[stop proxy.jpg](https://github.com/mojtaba13133/kill-switch-v2ray/blob/5348bf520ca6b7ed9eae6198a9d12bec4d062533/stop%20proxy.jpg)

Be sure to run this bash file with root access level or high access level.

sudo bash setup-kill-switch-v2ray.sh


It does the following:

1- It automatically downloads and installs the latest version of v2ray on Linux.

2- It automatically downloads and installs the latest version (2.0.5) of v2raya. Be sure to check, if a newer version is available, replace it yourself with the link in the Bash.
You can check the version from the link below
https://github.com/v2rayA/v2rayA/releases

3- It checks whether the v2raya service is running or not, if the service is not running, all outgoing traffic on the tcp / udp protocol will be cut off to the outside.

4- If the service is activated again, the outgoing traffic will be connected on TCP/UDP protocol.

After installing v2raya, it is available on the address 127.0.0.1:2017 and you can enter your configuration.

You must have a correct configuration on v2raya.
