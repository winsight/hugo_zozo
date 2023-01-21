---
title: "vscode 清除多余空行"
date: 2023-01-21T16:28:03+08:00
slug: "E26b469f"
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



使用正则表达式` ^\s*(?=\r?$)\n `

```
^\s*(?=\r?$)\n
```

![替换](201811161149492.png)
