---
title: "Ubuntu常见命令"
date: 2022-11-14T21:10:29+08:00
slug: "16e43420"
hidden: false
tags: []
keywords: []
description: ""
Summary: ""
Navbar: true
comments: true
math: false
---



<!--more-->

## 换源

### 配置方法

#### 修改源文件sources.list

（1）终端执行命令：

```sh
sudo chmod 777 /etc/apt/sources.list
#更改文件权限使其可编辑；
```

（2）执行命令： 

```
sudo gedit  /etc/apt/sources.list
#打开文件进行编辑；
```

（3）删除原来的文件内容，根据系统版本复制下面的任意一个到其中并保存（常用的是阿里源和清华源，推荐阿里源）；

在/etc/apt/sources.list 文件中，将软件源的地址改为 https://mirrors.aliyun.com/ubuntu-ports/

以下是 Ubuntu 16.04 /etc/apt/sources.list 文件的参考配置内容：

```bash
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse

```

注：配置方法参考ustc镜像

### 修改完软件源后，更新软件列表和软件

```bash
sudo apt update
sudo apt upgrade
```

## 美化任务栏

Ubuntu 20.04 默认的任务栏在桌面左侧，不使用时会自动隐藏。安装 plank dock 工具可以在桌面底部设置一个常驻任务栏。

### 安装与配置

````sh
#安装
sudo apt install plank
#打开配置界面
plank --preferences
````

## 安装方式

### 从浏览器安装

[GNOME扩展网站](https://extensions.gnome.org/)

进入网站会有提示，要求安装浏览器扩展（Click here to install browser extension），点击安装即可
刷新扩展网站页面，会提示安装本地扩展，使用命令安装即可

```sh
sudo apt install chrome-gnome-shell
```

之后再次刷新页面，即可正常安装扩展

### 手工安装

选择需要下载的插件，下载后解压，将解压后的目录移到

```sh
~/.local/share/gnome-shell/extensions/ 
```

没有该文件夹则新建一个

### 安装gnome拓展

退出打开的gnome-tweaks

安装gnome-shell-extensions

```sh
sudo apt-get install gnome-shell-extensions
```

然后重启gnome：按Alt + F2进入命令窗口，输入r，回车

### 重新打开gnome-tweaks

```sh
gnome-tweaks
```

点击拓展选项，把User themes打开

## 安装gedit-gmate

```bash
sudo apt-add-repository ppa:ubuntu-on-rails/ppa 
#添源加到源列表 /etc/apt/sources.list中
sudo apt-get update 
#更新源列表
sudo apt-get install gedit-gmate 
#安装gedit-gmate
```

Gmate不会删除Gedit的,他只是给Gedit添加很多插件而已,您可以在首选项里手动启用或者停止。

- 括号补全、单词不全（这个挺有用的）、标记列表、代码注视等等插件。

  ```bash
  sudo apt-get install gedit-plugins --再安装一些插件
  ```

- 安装Source Code Browser插件
  这个插件可以把程序中的函数、类、变量以列表的方式列出，对编程人员相当有用。
  之前在ubuntu-10.10上有用过Class Browser，但是这个插件在ubuntu-11.10上不能用，
  因为ubuntu-10.10上的是gedit2，ubuntu-11.10上的是gedit3。
  刚开始在ubuntu-11.10不懂怎么安装这个插件，找了很久才找到这个插件。
  gedit2的插件下载，http://live.gnome.org/Gedit/PluginsOld
  gedit3的插件下载，http://live.gnome.org/Gedit/Plugins --找到Source Code Browser
  也可直接从https://github.com/Quixotix/gedit-source-code-browser/downloads下载
  Quixotix-gedit-source-code-browser-v3[2].0.3-0-gb009544.tar.gz
  安装方法：

  ```bash
  apt-get install exuberant-ctags --安装ctags
  tar xzvf Quixotix-gedit-source-code-browser-v3[2].0.3-0-gb009544.tar.gz
  cd Quixotix-gedit-source-code-browser-b009544/
  cp sourcecodebrowser sourcecodebrowser.plugin /usr/lib/gedit/plugins/
  ```

## 在其中输入以下的命令进行桌面注销。

```bash
sudo systemctl  restart  lightdm
# 或者
sudo pkill  Xorg
```

## 卸载Linux（Ubuntu，Centos）卸载桌面环境

```bash
1、进入终端窗口（黑黑的那个）
2、卸载掉gnome-shell主程序
sudo apt-get remove gnome-shell
3、卸载掉gnome
sudo apt-get remove gnome
4、卸载不需要的依赖关系
sudo apt-get autoremove
5、彻底卸载删除gnome的相关配置文件
sudo apt-get purge gnome
6、清理安装gnome时候留下的缓存程序软件包
sudo apt-get autoclean
sudo apt-get clean
```

## [Gnome桌面环境安装_书启秋枫的博客-CSDN博客_gnome桌面](https://blog.csdn.net/qq_45037155/article/details/123387923)

> 1.图形界面：
>
> 1）命令：sudo gedit /etc/default/grub
>
> 2）去掉 #GRUB_TERMINAL=console 的注释，即GRUB_TERMINAL=console 
>
> 3）输入命令：
>
>         sudo update-grub（重新生成GRUB的启动菜单配置文件）
>                     
>         sudo systemctl set-default multi-user.target 
>
> 4）sudo reboot（重启系统，进入命令方式）
>
> 2.字符界面：
>
> 1）sudo nano /etc/default/grub （更改回原来的设置）
>
> 2）加上 #GRUB_TERMINAL=console 的注释，即#GRUB_TERMINAL=console
>
> 3）输入命令：
>
>         sudo update-grub（重新生成GRUB的启动菜单配置文件）
>                     
>         sudo systemctl set-default graphical.target 
>
> 4）重启 sudo reboot(进入桌面图形模式）
>
>  3.Unity：最左侧部分是一条纵向的快速启动条，即Launcher。快速启动条上的图标有三类：系统强制放置的功能图标（Dash 主页（应用管理和文件管理）、工作区切换器和回收站），用户自定义放置的常用程序图标，以及正在运行的应用程序图标。
>
> 4.Gnome：在桌面环境中，鼠标的基本操作和windows相同。鼠标的基本操作包括单击、双击和右击。窗口的基本操作包括最大化、最小化、移动、置顶和调整窗口大小和位置等。

**使用另外一个命令安装 \**gome\****

> ```
> sudo apt install ubuntu-gnome-desktop
> ```
>

## [Ubuntu系统桌面任务栏和启动器全部消失解决方案](https://www.bbsmax.com/A/8Bz8bZ8O5x/)

### 解决办法：

Ctrl+Alt+F1 进入命令行，输入:

```
sudo service lightdm restart 重启lightdm
```

如果不行的话就重装Unity，依次输入：

```
sudo apt-get update
sudo apt-get install --reinstall ubuntu-desktop   
# 如果有依赖导致安装不成功使用 
sudo aptitude install ubuntu-desktop
```

```
sudo apt-get install unity                   
#如果有依赖导致安装不成功使用 
sudo aptitude install unity
#第一种解决方案不成功选则n，使用第二种解决方案
```

##  [ubuntu中快速安装on-my-zsh](https://blog.csdn.net/qq_43606857/article/details/125060969)
