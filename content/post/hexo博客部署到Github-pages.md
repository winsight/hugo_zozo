---
title: hexo博客部署到Github pages
tags: ["hexo","git"]
Summary: 本教程系统平台为win10 64位家庭中文版。
---



# 安装和配置环境

本教程系统平台为win10 64位家庭中文版。

## 安装Git

从Git官网地址：https://www.git-scm.com/download/ 下载Git软件，按默认选项安装即可。

## 安装Node.js

从node.js官网：https://nodejs.org/en/ 下载Node.js软件，推荐下载稳定版本，然后按默认选项安装即可。安装完成后，打开cmd.exe，输入node -v，若能正常显示版本号，则说明安装成功。

## 安装Hexo、预览本地hexo博客

在本地新建一个目录如hexo_blog用来存储hexo博客源码，然后在该目录下打开cmd.exe或Git bash here，依次运行下列命令(一个指令运行完再运行下一个指令)：

```
npm install hexo-cli -g #安装hexo命令行工具
hexo init #下载hexo博客初始源码
npm install #安装npm
hexo s 或 hexo server #启动本地服务器,可预览本地hexo博客
```

如果正常安装完成，在浏览器中访问：http://localhost:4000/ 就可以看到运行在本地服务器上的博客了。

**注意：**

如果你使用的是Microsoft Edge浏览器，访问http://localhost:4000/ 时可能会失败，原因是这个浏览器经常偷偷地自动打开使用代理服务器127.0.0.1。关闭后即可正常访问。还有一种可能是你的4000端口被占用了。

## 在Github上部署hexo博客

我将部署到Gitlab的hexo博客源码目录命名为hexo_blog_gitlab，现在将这个目录中的博客源码copy一份到一个新目录，比如我将新目录命名为：hexo_blog_github。在新目录hexo_blog_github下鼠标右键选择Git bash here，然后运行下面的命令，安装用于部署hexo博客到Github上的插件：

```
npm install hexo-deployer-git --save
```

这是在Github上部署hexo博客时必须使用的插件。
在Github网站新建一个公开仓库，[名为yourname.github.io](http://xn--yourname-wg0m349b.github.io/)，然后勾选Initialize this repository with a README，创建仓库，打开该仓库的settings，如果出现提示：Your site is published at https://zgcr.github.io/ ,则说明Github pages开启成功。
修改新目录hexo_blog_github中的_config.yml文件(注意不是主题中的config.yml文件)，修改相应代码块为以下内容：

```
# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy: 
  type: git
  repo: git@github.com:yourname/yourname.github.io.git
  branch: master
```

请把上面的repo内容换成你的Github pags仓库的git链接。完成后，使用下面命令：

```
hexo clean
hexo g
hexo d
```

此时可以正常将hexo博客部署到github上了。
要想将博客部署要gitlab上，只需在原目录hexo_blog_gitlab中鼠标右键选择Git bash here，使用下面命令：

```
git add -A
git commit -m "本次提交描述"
git push origin master
```

即可部署hexo博客至Gitlab上。
**关于Gitlab/Github的博客同步：**
目前没有太好的方法，我们每次写新文章可在hexo_blog_gitlab目录中的_post目录下新建和修改文章，完成后将_post目录复制粘贴到hexo_blog_github目录中相同位置，然后分别部署hexo博客到Gitlab和Github即可。

### 可能存在的问题

- 先是出现错误：
  `error：spawn failed...`

#### 解决办法：

##### 第一种

删除`.deploy_git`文件夹;

输入

```
git config --global core.autocrlf false
```

然后，依次执行：

```
hexo clean
hexo g
hexo d
```

##### 第二种

如果使用GitHub，可以尝试是否能跑通GitHub

```
SHELL
ssh -T git@github.com
```

[**👉详细参考链接**](https://blog.zhheo.com/p/128998ac.html)



```javascript
git config --global user.name "winsight"
git config --global user.email "wangss.ch@gmail.com"
```



### Git使用出现git@github.com: Permission denied (publickey). 处理

进入git bash界面然后：

##### 第一步

```javascript
git config --global --list
```

 验证邮箱与GitHub注册时输入的是否一致

##### 第二步

```javascript
git config --global user.name "winsight"
git config --global user.email "wangss.ch@gmail.com"
```

设置全局用户名和邮箱。

第三步

```javascript
ssh-keygen -t rsa -C "wangss.ch@gmail.com"
```

这里换上你的邮箱”，一路回车，在出现选择时输入Y，再一路回车直到生成密钥。会在/Users/***/路径下生成一个.ssh文件夹，密钥就存储在其中。

##### 连接不通的话

```javascript
ssh-agent -s
ssh-add ~/.ssh/id_rsa
```

操作这两步。

