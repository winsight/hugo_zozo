---
title: "Shortcode测试页面"
date: 2022-08-15T18:17:07+08:00
slug: "44a52742"
hidden: false
draft: false
tags: []
keywords: []
description: "123"
Navbar: false
Summary: 测试
---

### 一、office文件嵌入

1

```html
<iframe src='https://view.officeapps.live.com/op/view.aspx?src=https://zozo.sswin.site/posts/44a52742/测试.xlsx' width='100%'  frameborder='1'> </iframe>
```



<iframe src='https://view.officeapps.live.com/op/view.aspx?src=https://zozo.sswin.site/posts/44a52742/测试.xlsx' width='100%'  frameborder='1'> </iframe>



2

```go
{{< office src="44a52742/测试.xlsx" >}}
```

{{< office src="44a52742/测试.xlsx" >}}

3

```go
{{< office src="44a52742/测试.docx" >}}
```

{{< office src="44a52742/测试.pdf" >}}

4

```go
{{< office src="44a52742/测试.pptx" >}}
```

{{< office src="44a52742/测试.pdf" >}}



### 二、pdf嵌入



{{< pdfjs url="测试.pdf" >}}

2

{{< pdf url="测试.pdf" >}}

3

