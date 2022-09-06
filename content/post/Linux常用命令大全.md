---
title: "Linux常用命令大全"
date: 2022-09-06T12:04:48+08:00
hidden: false
draft: false
tags: ["Linux","技术","转载"]
keywords: ["Linux","技术","转载"]
description: ""
Summary: ""
Navbar: true
comments: true
---

> 本文记录了Linux操作系统中常用的命令以及对应参数，方便使用的时候进行查询

<!--more-->          

# 前言

本文记录了Linux操作系统中常用的命令以及对应参数，方便使用的时候进行查询，主要参考`541137 Linux命令行与shell脚本编程大全.第3版`一书，后面还有许多高级的内容，但日常的linux使用下面涉及的已经足够。本文的正确打开方式是作为字典式的命令查询，不建议将这些命令一一背住，只需了解基础的几个就好。 

> 部分复杂内容添加了配图方便理解，也可以前往我的[个人博客](https://www.gentlecp.com/articles/676.html)阅读原文

# 常用命令

## 查看文件ls命令

```text
ls -F  # 用于区分文件和目录
ls -a  # 显示隐藏目录和文件
ls -R  # 递归显示文件和目录
ls -l  # 显示长列表，包含更多信息
ls -l file_name  
# 过滤显示，可以用?代替一个字符，*代替零个或多个
[a-z]表示a-z任一个，！后跟字符表示除这个字符外，！需放置在[]中
```

## 创建文件touch命令

```text
touch file_name # 创建一个文件，若无则创建，若有则修改文件的修改时间
touch -a file_name # 只修改文件的访问时间
```

要查看访问时间用以下命令

```text
ls -l --time=atime
```



## 复制文件

```text
cp source destination  # 如果目标文件已存在会强制覆盖
cp -i source destination  # 询问是否覆盖
cp file dir/  # 如果不指定拷贝的文件，只是复制到dir目录下，需要加上/
cp -R dir1/ dir2  # 递归复制文件夹
```

## 链接文件

```text
ln -s source destination  # 符号链接，结果：destination->source,相当于快捷方式
ln source destination  # 硬链接，两个相同的文件
```

## 移动文件

类似copy

```text
mv source destination  # 可以重命名
```



## 删除文件

```text
rm -i file  # 建议添加-i询问是否删除，以免误删，因为不能撤销
rm -r dir/  # 删除文件夹
加f参数是强制删除，慎用！！
```

## 查看文件/类型

```text
file file_name  # 查看文件内部，给出文件类型，包括编码方式
file dir  # 区分目录
cat file_name  # 查看文件内容
cat -n file_name  # 给所有行加上行号
cat -b file_name  # 给有文本的行加上行号
more file_name  # 查看文件内容，包含文件所属位置，在每页数据停下
tail file_name  # 显示文件最后几行，默认10行
tail -n 3 file_name  # 显示最后3行，也可以直接把n换成3
tail -f file_name  # 动态查看最后几行，如果有其他进程对文件修改，则会动态加载，用于监视系统日志
head file_name  # 显示开头几行，默认10行，除了-f其余属性与tail相同
```

## Linux命令行图谱

[![img](https://img-blog.csdnimg.cn/20200302133009486.png#pic_center =500x250)](https://img-blog.csdnimg.cn/20200302133009486.png#pic_center =500x250)

# 进程操作

本章比较复杂，添加了图片做说明

## 查看进程

```text
ps -ef  # 显示系统上运行的所有进程，-e指定显示所有运行在系统上的进程，-f扩展了输出
```

[![img](https://img-blog.csdnimg.cn/2020030213303494.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/2020030213303494.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)

| 名称  |           含义            |
| :---: | :-----------------------: |
|  UID  |    启动这些进程的用户     |
|  PID  |          进程ID           |
| PPID  |      父进程的进程ID       |
|   C   | 进程生命周期中的CPU利用率 |
| STIME |   进程启动时的系统时间    |
|  TTY  |   进程启动时的终端设备    |
| TIME  | 运行进程需要的累计CPU时间 |
|  CMD  |      启动的程序名称       |

```text
ps -l  # 产生一个长格式的输出
```

[![img](https://img-blog.csdnimg.cn/2020030213305614.png)](https://img-blog.csdnimg.cn/2020030213305614.png)

| 名称  |                             含义                             |
| :---: | :----------------------------------------------------------: |
|   F   |                   内核分配给进程的系统标记                   |
|   S   | 进程的状态（O：运行；S：休眠；R：可运行,正等待运行；Z：僵化,进程已结束但父进程已不存在；T:停止） |
|  PRI  |                         进程的优先级                         |
|  NI   |                  谦让度值用来参与决定优先级                  |
| ADDR  |                        进程的内存地址                        |
|  SZ   |            假如进程被换出，所需交换空间的大致大小            |
| WCHAN |                   进程休眠的内核函数的地址                   |

## 实时监测进程

```text
top  
top -l
```

## 结束进程

kill命令结束进程

```none
ps -l  # 通常先用ps命令查看进程ID
kill PID  # 根据PID结束进程
```


killall命令结束进程

```text
killall http*  # 结束所有以http开头的进程，允许通过进程名结束进程
```



# 磁盘空间

```text
df -h  # 查看磁盘使用情况
```

[![img](https://img-blog.csdnimg.cn/2020030213311057.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/2020030213311057.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)

```text
du  # 显示当前目录下所有的文件、目录和子目录的磁盘使用情况
du -c # 显示所有已列出文件总的大小
du -h # 人性化显示
```

# 处理数据文件

## 排序数据

```text
sort file_name  # 按默认的语言排序规则对文本文件数据排序
sort -n file_name  # 按数字排序
sort -M file_name  # 按三字符月份排序，适用于 Jan，Feb这些打头的
sort -f file_name  # 忽略大小写排序
```

## 搜索数据

```text
grep [options] pattern [file] # 在文件中查找包含匹配指定模式的字符的行
grep t file1  # 在file1中找t开头的行
grep -v t file1  # 在file1中找不以t开头的行
grep -n t file1  # 显示行号
grep -c t file1  # 匹配的数量
grep [tf] file1  # 在file1中找t或f开头的行，这里也可以用正则表达式
```

## 压缩数据

```text
gzip file  # 压缩文件
gzip file*  # 压缩所有匹配的文件
gunzip file.gz  # 解压文件 
```

## 归档数据

相比与gzip，tar命令用的更多

```text
tar function [options] object1 object2 ...
```



- **tar命令的功能**

| 功能 |                             含义                             |
| :--: | :----------------------------------------------------------: |
|  -A  |          将一个已有归档文件追加到另一个已有归档文件          |
|  -c  |                   创建一个新的tar归档文件                    |
|  -d  |               检查归档文件和文件系统的不同之处               |
|  -r  |                追加文件到已有tar归档文件末尾                 |
|  -t  |                  列出已有tar归档文件的内容                   |
|  -u  | 将比tar归档文件中已有的同名文件新的文件追加到该tar归档文件中，简单来说就是更新文件内容 |
|  -x  |                 从已有tar归档文件中提取文件                  |

- **tar命令的选项**

|  选项   |               含义               |
| :-----: | :------------------------------: |
|   -C    |          切换到指定目录          |
| -f file |     输出结果到文件或设备file     |
|   -j    |  将输出重定向给bzip2来压缩内容   |
|   -p    |         保留所有文件权限         |
|   -v    |       在处理文件时显示文件       |
|   -z    | 将输出重定向给gzip命令来压缩内容 |

常用tar命令结构：

```text
tar -cvf test.tar test1/ test2/  # 创建名为test.tar的归档文件，含有test1和test2目录内容 
tar -tf test.tar  # 列出tar文件test.tar的内容（并不提取文件）
tar -xvf test.tar  # 提取test.tar内容
tar -zxvf  test.tgz  # 解压以.tgz结尾的压缩文件
```



# Linux环境变量

环境变量的定义：
bash shell 用环境变量的特性来存储有关shell会话和工作环境的信息，允许我们在内存中存储数据，以便程序或shell中运行的脚本能够轻松访问到它们。  

## 全局环境变量

```text
printenv  # 查看全局变量
```

[![img](https://img-blog.csdnimg.cn/20200302133133279.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200302133133279.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)

```text
printenv HOME  # 显示某个环境变量
echo $HOME  # 显示某个环境变量，需要加$，且加了$可以作为命令行参数
```


设置全局环境变量

```text
export variable  # variable是一个局部环境变量，相当于将局部变为全局
```


永久设置全局环境变量：
在$HOME/.bashrc 中定义全局环境变量，例如将alias设置放在.bashrc启动文件中 ，或者存储在.profile文件中



## 局部环境变量

```text
set # 显示某个特定进程设置的环境变量
```

设置局部环境变量

```text
echo $variable
variable=test  # 注意中间不能有空格
echo $variable
```


删除环境变量

```text
unset variable  # 注意这时候不加$
```



## PATH环境变量

```text
PATH=$PATH:new_dir  # 添加new_dir到PATH中，此修改仅持续到退出或重启系统
```

登录shell后，shell会从以下5个不同的启动文件中读取命令：

| 文件名              | 备注                                                         |
| :------------------ | :----------------------------------------------------------- |
| /etc/profile        | 系统上默认shell启动文件，不分用户。 ubantu版本中涉及/etc/bash.bashrc,该文件包含了系统环境变量，但CentOS版本中没有 文件中主要for循环迭代启动/etc/profile.d目录下的文件 |
| $HOME/.bash_profile | 检查HOME目录是否有.bashrc,若有，则执行.bashrc里的命令，如果存在则忽略剩下的启动文件 |
| $HOME/.bashrc       | 存放启动shell时会执行的命令                                  |
| $HOME/.bash_login   | 功能与bash_profile类似，但执行优先级晚                       |
| $HOME/.profile      | 同上                                                         |

# Linux文件权限

## 添加新用户

```text
useradd <user>  # 添加一个新用户 
```

添加用户之后该用户还没有密码，需要通过passwd命令给该用户添加密码

```text
passwd <user>  # 输入命令后根据提示输入密码
```


通过命令创建的用户存放在/etc/passwd文件中



## 删除用户

```text
userdel <user>  # 只会删除/etc/passwd文件中的用户信息，不删除系统中属于该用户的任何文件
userdel -r <user>  # 删除该用户在home中的文件和该用户
```

## 修改用户

- **用户账户修改工具**

| 命令     | 用途                                                   |
| :------- | :----------------------------------------------------- |
| usermod  | 修改用户账户字段，还可以指定主要组以及附加组的所属关系 |
| passwd   | 修改已有用户的密码                                     |
| chpasswd | 从文件中读取登录名密码对，并更新密码                   |
| chage    | 修改密码的过期日期                                     |
| chfn     | 修改用户账户的备注信息                                 |
| chsh     | 修改用户账户的默认登录shell                            |

- usermod的参数

| 参数 | 用途                     |
| :--- | :----------------------- |
| -c   | 修改备注字段             |
| -e   | 修改过期日期             |
| -g   | 修改默认的登录组         |
| -l   | 修改用户账户的登录名     |
| -L   | 锁定账户，使用户无法登录 |
| -p   | 修改账户密码             |
| -U   | 接触锁定，使账户能够登录 |

## Linux组

就是一堆用户共享同一权限，用户组信息保存在/etc/group文件中

```text
groupadd group  # 创建新组
```


更多用户组命令由于涉及不多，不一一列举，以后补上



## 文件权限

理解ls -l列出的文件权限字段含义

[![img](https://img-blog.csdnimg.cn/20200302133206168.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200302133206168.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)

第一个字段是描述文件和目录权限的编码：
-:文件
d:目录
l:链接
c:字符型设备
b:块设备
n:网络设备
接着是3组字符的编码：
r:可读
w:可写
x:可执行
三组分别是对象属主，对象数组，其他用户  

- **默认权限**
  默认权限由umask命令设置，权限的赋予采用八进制，下表记录了常用的权限对应的八进制值  

| 权限 | 二进制 | 八进制 |     含义     |
| :--: | :----: | :----: | :----------: |
|  —-  |  000   |   0    |    无权限    |
|  —x  |  001   |   1    | 只有执行权限 |
| -w-  |  010   |   2    |  只有写权限  |
| -wx  |  011   |   3    |   写+执行    |
|  r—  |  100   |   4    |     只读     |
| r-x  |  101   |   5    |   读+执行    |
| rw-  |  110   |   6    |     读写     |
| rwx  |  111   |   7    |   全部权限   |

umask值是个掩码，会屏蔽不想授予安全级别的权限
例如umask = 026 ，则目录的默认权限是 777-026 = 751，文件的默认权限是666-026 = 640
umask设置在/etc/prpfile启动文件中  

- **改变权限**

```text
chmod 777 file  # 赋予file的所有权限给所有人
chmod +x file   # 给所有人添加file的执行权限
chmod o+x file  
```

chmod [ugoa] [+-=] [rxw] file
这种形式允许针对用户或组，添加修改权限，u代表用户，g代表组，o代表其他，a代表上述所有  

# 安装软件程序

## 基于Debian系统

采用dpkg命令直接和Linux系统上的PMS（package management system 包管理系统）交互，用来安装、管理和删除软件包
包含在此PMS的其他工具有：
1、apt-get
2、apt-cache
3、aptitude  

- 用apt-get安装软件包

  ```text
  apt-get search package_name  # 查找软件包
  apt-get install package_name  # 安装软件包
  
  apt-get safe-upgrade  # 更新软件包
  
  apt-get remove package_name  # 卸载软件,只删除软件包
  apt-get purge package_name  # 删除软件包和相关的数据和配置文件
  ```

ubantu下统一了apt命令，可以将上述全替换成apt

**dpkg安装.deb包**

```text
dpkg -i jdk-XXX_linux-x64_bin.deb
```

配置文件路径：

```text
/etc/apt/sources.list
```


以搬瓦工的ubantu系统服务器为例
[![img](https://img-blog.csdnimg.cn/2020030213325689.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/2020030213325689.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)



## 7.2 基于Red Hat系统

采用rpm命令，常见的前端工具有：
1、yum：在Red Hat 和Fedora使用
2、urpm： 在Mandriva使用
3、zypper：在openSUSE使用
由于yum使用较多，以yum为例  

- **用yum安装软件包**

  ```text
  yum list installed  # 列出已安装的包
  yum list installed > installed_software  # 将已安装包的列表重定向到一个文件中  
  yum install package_name  # 安装软件
  yum localinstall package_name.rpm  # 本地安装rpm安装包
  
  yum list updates  # 列出所有已安装包的可用更新
  yum update packet_name  # 跟新指定包
  yum update  # 对更新列表中所有包进行更新
  
  yum remove package_name  # 只删除软件包而保留配置文件和数据文件
  yum erase package_name  #  删除软件和它所有的文件
  ```

**用rpm安装rpm包**  

```text
rpm -i jdk-XXX_linux-x64_bin.rpm
```

**处理损坏包依赖关系**

```text
yum clean all  # 清除损坏依赖包
yum update 

yum deplist package_name  # 显示该包的所有包依赖关系
```

配置文件路径

```text
/etc/yum.repos.d/CentOS-Base.repo
```


以阿里云centos服务器为例：
[![img](https://img-blog.csdnimg.cn/20200302133313747.png?#pic_center =500x300)](https://img-blog.csdnimg.cn/20200302133313747.png?#pic_center =500x300)



# 编辑器

## vim编辑器

```text
PageDown(Ctrl+F):下一页
PageUp(Ctrl+B):上一页
G：移到最后一行
num G：移动第num行
gg：移到第一行
```

全选命令：

```text
ggVG  # +y 复制,+d删除，
```



- **vim编辑命令**

| 命令   | 作用                                                         |
| :----- | :----------------------------------------------------------- |
| x      | 删除当前光标所在位置字符，前面加数字删除多个字符（或者进入插入模式用退格或delete键） |
| dd     | 删除当前光标所在行，前面加数字就可以删除多行                 |
| dw     | 删除当前光标所在位置单词                                     |
| d$     | 删除当前光标所在位置至行尾内容                               |
| J      | 删除当前光标所在位置行尾的换行符，用于拼接两行               |
| u      | 撤销前一编辑命令                                             |
| a      | 在当前光标后追加数据                                         |
| A      | 在当前光标所在行行尾追加数据                                 |
| r char | 用char替换当前光标所在位置的单个字符                         |
| R text | 用text覆盖当前光标所在位置数据，直到按下ESC键                |

- **复制、粘贴**
  剪切：dd之后+p（因为vim在删除数据时，会将其保存在一个单独的寄存器中）
  复制：yw复制一个单词，yy复制一行，y$复制到行尾+p粘贴或者进入可视模式（按v）移动光标覆盖你想要复制的文本+p粘贴  

其他的编辑器诸如nano、emacs、KDE、GNOME因为使用不多，因此暂不做记录  

# Shell脚本编程基础

所有的shell脚本文件开头第一行需添加

```text
#!/bin/bash
```


这告诉shell用哪个shell来运行脚本



## 9.1 echo命令

echo可以用来在屏幕打印输出，作用相当于print，下面是一个打印HOME目录和局部环境变量的例子：

```text
#!/bin/bash
num=10
echo "num is $num,home is $HOME"
```


注意在编辑完成后给文件赋予用户可执行命令

```text
chmod o+x test.sh
```


[![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuZ2VudGxlY3AuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy81ZTViYzc2OWYzMGZiLnBuZw?x-oss-process=image/format,png)](https://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuZ2VudGxlY3AuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy81ZTViYzc2OWYzMGZiLnBuZw?x-oss-process=image/format,png)



## 9.2 命令替换

有的时候我们需要将环境变量的输出保存给某个变量，供下一个命令输入，有两种方式实现

- 反引号

  这个反引号是键盘左上角波浪线一起的那个键，例如date命令可以获取当前时间信息

  ```text
  date_variable=`date`
  ```

**$()**
shell命令放入括号内

```text
date_variable=$(date)
```

下面这个例子是利用date命令创建以日期命名的文件

```text
#!/bin/bash
today=$(date +%Y-%m-%d)
ls test.sh -al > $today.log
```

例子实现了将之前的test.sh shell脚本文件信息输出到一个按今天日期命名的log文件中
[![img](https://img-blog.csdnimg.cn/20200302133403779.png?#pic_center =400x100)](https://img-blog.csdnimg.cn/20200302133403779.png?#pic_center =400x100)

## 重定向

输出重定向

```text
commond > outputfile  # 输出重定向，将命令的输出发送到一个文件中
commond >> outputfile  # 追加数据到文件
```


输入重定向

```text
wc < test.txt # 通过将文本文件重定向到wc命令，可获得文件的行、词、字节计数
wc << EOF # 内联重定向，记录下面输入的内容，直到输入EOF（或者内联的任意结束标志），输出统计的行、词、字节计数
```


可以利用输入输出重定向来实现将一个命令的输出作为另一个命令的输入

```text
commond1 > commond.list
commond2 < commond.list
```



## 管道

可以用管道实现上述两次重定向相同的功能

```text
command1 | command2  # 两个命令会同时运行，在第一个命令产生输出结果时立刻送给第二个命令
```


比较常见的是将ls-l的输出输送到more，实现大量数据翻页查看



## 数学计算

在bash中，将一个数学运算结果赋给某个变量时，采用$[opreation]的形式

```text
var = $[2 * 8]  # 建议采用这种方式，因为这样*不会被理解为正则通配符
```


不过bash仅能支持整数运算，所以不太建议用shell脚本做数学运算，如果非用不可就利用内建bash计算器bc



## 命令退出状态码

每个命令在结束退出的时候都会返回给Linux系统一个状态码，告诉其自己的运行状况。正常退出的状态码为0，其余为正整数，下面是一个例子：

[![img](https://img-blog.csdnimg.cn/20200302133422113.png#pic_center =400x100)](https://img-blog.csdnimg.cn/20200302133422113.png#pic_center =400x100)

下面是Linux的退出状态码表  

| 状态码 | 含义                                 |
| :----- | :----------------------------------- |
| 0      | 成功退出                             |
| 1      | 一般性未知错误，例如无效参数         |
| 2      | 不适合的shell命令                    |
| 126    | 命令不可执行，即用户没有权限执行命令 |
| 127    | 没找到命令                           |
| 128    | 无效的退出参数                       |
| 128+x  | 与Linux信号x相关的严重错误           |
| 130    | 通过Ctrl+C终止的命令                 |
| 255    | 正常范围之外的退出状态码             |

默认情况下，shell脚本以最后一个命令的退出状态码退出，但我们可以通过exit命令指定一个退出状态码

```text
exit 5   # 以一个正整数作为退出状态码
exit $var   # 以一个变量作为退出状态码，如果变量大于255，则会返回模255
```



# 结构化命令

前面所讲的shell脚本命令都是按照顺序执行，这难以满足现实开发的需求，这节介绍了一些特殊语句，用于丰富我们的脚本

## if-then语句

```text
if command   # if 执行command，如果该退出码是0则执行then，否在不执行then后面的命令
then
    commands
fi
```

下面是一个例子，包括正确执行then和不执行then

```text
#!/bin/bash
# execute then
if pwd
then
    echo "pwd has been successfully executed"
fi

#!/bin/bash
# don't execute then
if xxxx
then
    echo "pwd has been successfully executed"
fi
```


正确执行结果



[![img](https://img-blog.csdnimg.cn/20200302133439748.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/20200302133439748.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)

未执行结果

[![img](https://img-blog.csdnimg.cn/20200302133449798.png)](https://img-blog.csdnimg.cn/20200302133449798.png)

## if-then-else语句

与if-then类似，只是多了else分支，在then不执行时执行else中的命令

```text
if command
then
    commands
else
    commands
```



## 嵌套if语句，elif

上述方法能够判断的条件仅一次，可以通过if嵌套的方式进行多次判断，但是这样代码显得杂乱无章，此时可以通过elif进行第二次判断，下面是一个例子

```text
#!/bin/bash
# test if-then-elif-then-else
#
user=gentlecp

if grep $user /etc/passwd
then
    echo "User: $user exists on this system"
elif ls -d /home/$user
then
    echo "User: $user doesn't exist on this system"
    echo "However, $user has a directory at /home"
else
    echo "User: $user doesn't exist on this system"
    echo "Moreover, $user doesn't have a directory at /home"
fi
```


在这个脚本中，elif接过if后命令状态码不为0的情况再次做了判断，下面的elif-then-else 是一个整体，相当于一个独立的if-then-else，不过已经获知了if后语句执行失败的消息
**运行结果：**
1、没有User gentlecp



[![img](https://img-blog.csdnimg.cn/20200302133509565.png)](https://img-blog.csdnimg.cn/20200302133509565.png)[![img](https://img-blog.csdnimg.cn/202003021335229.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/202003021335229.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)

2、创建/home/gentlecp目录运行

[![img](https://img-blog.csdnimg.cn/202003021335229.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)](https://img-blog.csdnimg.cn/202003021335229.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0dlbnRsZUNQ,size_16,color_FFFFFF,t_70)

## case语句

有的时候大量的elif非常冗长，且可读性差，这时可用case语句来替换elif，case语句的模式如下

```text
case variable in
pattern1 | pattern2) commands 1;;  # 注意要有两个分号
pattern3) commands 2;;
*) default commands;;
```



## test命令

目前if-then语句中均是判断退出状态码，无法测试命令退出状态码以外的条件（事实上也是如此），但可以通过test命令来提供测试不同条件，如果test命令中列出的条件成立，test命令就会退出并返回退出状态码0，否则返回非0状态码

```text
if test condition
then
    commands
fi
```


下面是一个测试变量中是否存在内容的例子

```text
#!/bin/bash
# test the test command

variable="ojbk"

if test $variable
then
    echo "variable has something"
else
    echo "variable has nothing"
fi
```


[![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuZ2VudGxlY3AuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy81ZTViYzgwNmQ1MmQxLnBuZw?x-oss-process=image/format,png)](https://imgconvert.csdnimg.cn/aHR0cHM6Ly93d3cuZ2VudGxlY3AuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy81ZTViYzgwNmQ1MmQxLnBuZw?x-oss-process=image/format,png)



但是如果你直接用if判断该条件就会如下

```text
#!/bin/bash
# test the test command

variable="ojbk"

if $variable
then
    echo "variable has something"
else
    echo "variable has nothing"
fi
```


[![img](https://img-blog.csdnimg.cn/20200302133547421.png)](https://img-blog.csdnimg.cn/20200302133547421.png)



很明显if 获得$variable命令的退出码非零
如果你不想使用test命令也可以通过添加[]的方式，个人比较喜欢加[]的方式更清爽

```text
if [ condition ]  # 注意[]里condition与两边的一个空格不能省
then
    commands
fi
```


test命令可以判断三类条件：1、数值比较 2、字符串比较 3、文件比较  



------

有几点需要特别说明的地方
（1）对于字符串大小比较
字符串大小比较中，直接用>,<会变成重定向，需要加上转义符\
下表记录了三类条件的比较功能

| **条件**        | **比较**                               | **含义**                 |
| --------------- | -------------------------------------- | ------------------------ |
| 数值            | n1 -eq n2                              | n1是否等于n2）           |
| n1 -ge n2       | n1是否大于等于n2                       |                          |
| n1 -gt n2       | n1是否大于n2                           |                          |
| n1 -le n2       | n1是否小于等于n2                       |                          |
| n1 -lt n2       | n1是否小于n2                           |                          |
| n1 -ne n2       | n1是否不等于n2                         |                          |
| 字符串          | str1 = str2                            | str1是否同于str2         |
| str1 != str2    | str1是否不同于str2                     |                          |
| str1 < str2     | str1是否小于str2(需加\转义符)          |                          |
| str1 > str2     | str1是否大于str2(需加\转义符)          |                          |
| -n str1         | str1长度是否非0                        |                          |
| -z str1         | str1长度是否为0                        |                          |
| 文件            | -d file                                | 检查file是否存在且为目录 |
| -e file         | 检查file是否存在                       |                          |
| -f file         | 检查file是否存在且是一个文件           |                          |
| -r file         | 检查file是否存在且可读                 |                          |
| -w file         | 检查file是否存在且可写                 |                          |
| -x file         | 检查file是否存在且可执行               |                          |
| -s file         | 检查file是否存在且非空                 |                          |
| -O file         | 检查file是否存在且属当前用户所有       |                          |
| -G file         | 检查file是否存在且默认组与当前用户相同 |                          |
| file1 -nt file2 | 检查file1是否比file2新                 |                          |
| file -ot file2  | 检查file1是否比file2旧                 |                          |

## if-then高级特性

- **双括号用于高级数学表达式**
  之前的数学表达式都是简单的判断大小，仅一个数学符号，双括号支持更复杂的数学表达式

  ```text
  ((expression))  # $val ** 2 >100 
  ```

**双方括号针对字符串**
双方括号用于字符串的时候，相当于做模式匹配

```text
[[expression]]  # $USER == test* ,==对左边进行右边的pattern进行模式匹配
```

------

转载：https://blog.gentlecp.com/article/48940.html
