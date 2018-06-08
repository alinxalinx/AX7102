基于win7系统需要数字签名，必须禁止该模式才能正确安装驱动。

下载后打开,依次选择 next -> yes 出现以下界面:

1.选择"Enable Test Mode",Next,弹出对话框后选择"确定".
2.选择"Sign a System File",Next,弹出的对话框内输入无签名的驱动程序文件全路径,"OK".提示成功后确定,退出软件,重启Windows.
3.默认情况屏幕右下角有水印,可以再次运行软件,选择"Remove Watermark",确定后重启.就没水印了.
4.官方帮助,请使用软件上的"How-To-Use".

临时解决方法：运行，输入：bcdedit/set testsigning on 回车，然后重启，就可以关闭强制数字签名。
但是启动到桌面后会有提示水印，不过在使用上已经没有实质上的不便了。


备注：Sign a System File时输入
C:\Windows\System32\drivers\CYUSB3.sys

Cypress USB BootLoader和Cypress USB3.0 Generic Driver F1都需要单独输一次。
win7驱动安装步骤：
1、安装Cypress USB BootLoader驱动，选择相应文件夹，安装完毕后会提示驱动安装有问题。按上面步骤去签名，然后重启系统。
2、重启系统后，Cypress USB BootLoader驱动就可以正常工作了，设备管理器中的感叹号将消失。
3、下载固件程序，系统将提示安装Cypress USB3.0 Generic Driver F1驱动，选择相应文件夹，安装完毕后会提示驱动安装有问题。按上面步骤去签名，然后重启系统。
4、重启系统后，Cypress USB3.0 Generic Driver F1驱动就可以正常工作了，设备管理器中的感叹号将消失。
