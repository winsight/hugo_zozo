---
title: "3D Avatar"
date: 2022-09-02T23:27:32+08:00
slug: "9407bf42"
hidden: false
draft: false
tags: ["3D","技术"]
keywords: ["3D","技术"]
description: ""
Summary: ""
Navbar: true
comments: true
---

随着硬件水平和软件环境的改善，Web 即将迎来自己的全新时代——一个 Web 3.0 时代！在 Web 这个世界窗口，我们将依旧开放地看到一个美好的未来世界。今天，我们走出第一步，使用 3D 图形作为我们在未来世界的自己。

<!--more-->

## 建模

我们使用 [Ready Player Me](https://readyplayer.me/) 的服务，它可以根据二维照片生成可定制的 3D 图形，也就是我们需要的 Web 3.0 头像！

## 渲染

我们使用封装好的[`<model-viewer>`](https://modelviewer.dev/)组件实现 3D 图形在 Web 上的渲染，且支持调用设备的 AR 交互——全新体验！

```html
<script
  type="module"
  src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"
></script>

<model-viewer
  src="/3d-graphics/reuixiy.glb"
  ar
  ar-modes="webxr scene-viewer quick-look"
  camera-controls
  camera-orbit="-18.9deg 85.8deg auto"
  autoplay
  animation-name="idle_eyes_2"
  environment-image="neutral"
  shadow-intensity="1"
  camera-controls touch-action="pan-y" 
  style="width: 100%; height: 420px"
></model-viewer>
```

<script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>

<model-viewer
  src="avatar.glb"
  ar
  ar-modes="webxr scene-viewer quick-look"
  camera-controls
  camera-orbit="-18.9deg 85.8deg auto"
  autoplay
  animation-name="idle_eyes_2"
  environment-image="neutral"
  shadow-intensity="1"
  style="width: 100%; height: 420px">
</model-viewer>

---



```html
{/{< 3d src="avatar.glb" >}/}
```

{{< 3d src="https://d1a370nemizbjq.cloudfront.net/62ce334d-0500-4cd3-9b19-72ef5cb0fd5c.glb" >}}



## 链接

- [Polycam](https://poly.cam/) — 使用手机的 LiDAR 传感器建模
- [Blender](https://www.blender.org/) — The Freedom to Create
- [Wolf3D](https://wolf3d.io/) — Powering the next generation of online identities
- [Hubs](https://hubs.mozilla.com/) — Meet, share and collaborate together in private 3D virtual spaces
- [Decentraland](https://decentraland.org/) — Determine the future of the virtual world
- [Oculus](https://www.oculus.com/) — LIVE THE UNBELIEVABLE
- [Google AR & VR](https://arvr.google.com/) — Do more with what you see
- [Mozilla Mixed Reality](https://mixedreality.mozilla.org/) — Mixed Reality for the Open Web
- [Apple Augmented Reality](https://www.apple.com/augmented-reality/) — Dive into the world of augmented reality
- https://tech.fb.com/ar-vr/
- https://www.microsoft.com/en-us/mixed-reality/windows-mixed-reality
- [https://threejs.org](https://threejs.org/)
- [https://johwska.com](https://johwska.com/)
- https://github.com/BKcore/HexGL
