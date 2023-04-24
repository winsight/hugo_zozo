---
title: "无障碍体验New Bing"
date: 2023-04-07T10:27:24+08:00
slug: "B9b0e725"
hidden: false
tags: []
keywords: []
description: "NewBing访问，配置一台主机供多设备（包括手机）连接，无需科学上网，简单写个分享"
Summary: ""
Navbar: false
comments: true
math: false
---



<!--more-->

## 准备

1. 已通过候补名单的New Bing账户
2. 语言: Python3.8+.
3. 包: fastapi, uvicorn, asyncio, python-multipart, EdgeGPT.
4. 软件: docker, docker-compose（如果你想部署到VPS供公网访问）

## 配置服务端

1. 浏览器安装Cookie-Editor扩展.
2. 在https://www.bing.com/chat页面中点击扩展.
3. 点击扩展右下角的Export,将复制的内容粘贴到cookie.json.

## 本机访问

1. 运行bing_chat.py.(可选： 配置地址和端口，在bing_chat.py第15-16行) 

   1. clone Bing-Chat 到本地

      ```sh
      git clone https://github.com/huwei901108/Bing-Chat.git
      ```

   2. clone Bing-Chat 到本地

      ```sh
      pip install -r requirements.txt
      ```

   3. 运行bing_chat.py
   
      ```sh
      python bing_chat.py
      ```
   

## 局域网(公网)访问，推荐使用docker-compose

1. 打开.env文件，默认值为srv_port=5000（服务端端口） cli_port=80（客户端端口），按需修改，避免和现有端口冲突

2. 在代码根目录执行

   ```
   docker-compose up -d
   ```

3. 从局域网其他设备访问客户端，即 host_ip:cli_port

## 界面展示

1. web.html

   ![image-20230407183153708](tqVG4A5.png)

2. web2.html

   ![image-20230407183331624](qo9HLSJ.png)

3. web3/html/index.html 

   ![image-20230407183417848](9Yc1sq4.png)

## 实例体验

1. [Bing Chat](http://demo.sswin.xyz/)

<iframe src="http://demo.wssss.one/" width="100%" height="500px"></iframe>

## 参考

[Bing-Chat](https://github.com/huwei901108/Bing-Chat)

[NewBing访问](https://www.bilibili.com/read/cv22505800)

