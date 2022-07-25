---
title: "Plugin Test Page"
date: 2021-03-15T20:17:33+08:00
draft: false
comments: false
disableShare: true
ShowPostNavLinks: false
tags: ["Hugo"]
Summary: 插件效果显示页面

---

#### B站视频「可用」

{{< bilibili BV1iL411w7Y2 >}}

#### Twitter卡片

{{< tweet 1443813066878062595 >}}

#### PDF显示「可用」

{{< pdf url="测试.pdf" >}}

#### PDF2显示「可用」

{{< pdf2 url="测试.pdf" >}}

#### YouTube 视频

{{< youtube dO0PxiHzBY0 >}}

#### Img1标签

{{< img1 src="测试.jpg" title="Img1标签" >}}

#### Img2标签

{{< img2 src="测试.jpg" title="Img2标签" >}}

#### Mating标签

{{< mating server="netease" type="playlist" id="60198"  >}}



{{< mating qqurl="https://y.qq.com/n/yqq/song/001RGrEX3ija5X.html">}}



{{< mating name="富士山下" artist="🍊" url="富士山下.m4a" img="fssx.jpg">}}





---

# 插件代码

## 插入PDF

### Usage(每个代码都外加{})

[GitHub](https://github.com/anvithks/hugo-embed-pdf-shortcode)

In your Hugo website place the following shortcode in any of the markdown pages.

```yaml
{< pdf url="./path/to/pdf/file/example.pdf" >}
```

To hide pagination

```
{< pdf url="./path/to/pdf/file/example.pdf" hidePaginator="true" >}
```

To render a selected page number

```
{< pdf url="./path/to/pdf/file/example.pdf" renderPageNum="5" >}
```

To hide loading spinner

```
{< pdf url="./path/to/pdf/file/example.pdf" hideLoader="true" >}
```

## 插入B站视频

写好了bilibili.html中，在markdown里嵌入视频的话，用以下形式写就ok了：

```
{< bilibili BV1RE411b71v >}
```

如果需要指定part，比如要看大逃脱第一季第3回，这样写就ok了：

```
{< bilibili BV18t41187Bx 3 >}
```

## Aplayer播放器

```
{< mating server="netease" type="playlist" id="60198" >}
```

| option          | default     | description                                                  |
| --------------- | ----------- | ------------------------------------------------------------ |
| id              | **require** | song id / playlist id / album id / search keyword            |
| server          | **require** | music platform: , , , , `netease``tencent``kugou``xiami``baidu` |
| type            | **require** | `song`, , , , `playlist``album``search``artist`              |
| auto            | options     | music link, support: , , `netease``tencent``xiami`           |
| fixed           | `false`     | enable fixed mode                                            |
| mini            | `false`     | enable mini mode                                             |
| autoplay        | `false`     | audio autoplay                                               |
| theme           | `#2980b9`   | main color                                                   |
| loop            | `all`       | player loop play, values: 'all', 'one', 'none'               |
| order           | `list`      | player play order, values: 'list', 'random'                  |
| preload         | `auto`      | values: 'none', 'metadata', 'auto'                           |
| volume          | `0.7`       | default volume, notice that player will remember user setting, default volume will not work after user set volume themselves |
| mutex           | `true`      | prevent to play multiple player at the same time, pause other players when this player start play |
| lrc-type        | `0`         | lyric type                                                   |
| list-folded     | `false`     | indicate whether list should folded at first                 |
| list-max-height | `340px`     | list max height                                              |
| storage-name    | `metingjs`  | localStorage key that store player setting                   |

## 图片

#### Img1标签

```
{< img1 src="测试.jpg" title="Img1标签" >}
```

#### Img2标签

```
{< img2 src="测试.jpg" title="Img2标签" >}
```

