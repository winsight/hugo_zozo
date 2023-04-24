---
title: "Some Verilog Tips"
date: 2022-11-09T10:42:51+08:00
slug: "fc85bf3c"
hidden: false
tags: ["verilog","学习"]
keywords: ["verilog","学习"]
description: ""
Summary: ""
Navbar: true
comments: true
math: false
---



<!--more-->

## **一、module内部有效的定义**

用parameter来定义一个标志符代表一个常量，称作符号常量，他可以提高程序的可读性和可维护性。parameter是参数型数据的关键字，在每一个赋值语句的右边都必须是一个常数表达式。即该表达式只能包含数字或先前已经定义的参数。

`parameter   msb=7; `        //定义参数msb=7

`parameter   r=5.7;     `     //定义r为一个实型参数5.7

`parameter   byte_size=8,byte_msb=byte_size-1;  `   //利用常数表达式赋值

参数型常量经常用于定义延迟时间和变量宽度。在模块和实例引用时，可以通过参数传递改变在被引用模块或实例中已经定义的参数。

```verilog
1 module exam_prj
2     #(parameter WIDTH=8) 
3     //端口内的参数只能在这使用 
4     (
5         input [WIDTH-1:0] dataa,//[WIDTH-1:0]
6         input [WIDTH-1:0] datab,
7 
8         output reg [WIDTH:0] result
9     ); 
			parameter Conuter_Top = 4'd9;//用于代码部分的参数
//代码部分省略
```

  这里出现的两个参数parameter，第一个表示只在端口设置时使用，后面的是对于模块内部的使用。

> [verilog中参数传递与参数定义中#的作用](https://www.cnblogs.com/uiojhi/p/7844879.html)

## 二、generate语法举例

    generate
            genvar i;
            for(i=0;i<=9;i=i+1) 
            begin
                  assign D[i] = A[i];
            end
    endgenerate

上述语句实现将`assign D[0]=A[0];assign D[1]=A[1];assign D[2]=A[2];·····assign D[9]=A[9];`

[system Verilog 中generate语法的灵活使用_希言自然也的博客-CSDN博客](https://blog.csdn.net/yindq1220/article/details/123510892)



## 三、verilog中 `define 的使用

### 1、背景：

　　在最近实战开发中发现：对外部芯片进行初始化时，往往需要定义大量参数。若直接在module中通过localparam或者parameter进行参数定义的话，会带来两个问题：

　　　　-  1.代码长度增加，不够美观；
　　　　-  2.不利于参数和代码修改；

　　为了解决这两个问题，我想到了在之前在《verilog数字系统设计教程》（夏闻宇）看到过的`define宏定义+`inlude "file.v"文件包含来实现参数模块化设计的方式。

### 2、实战：

#### 1.新建参数模块文件（我命名为para.v）；

#### 2.在para.v文件中使用'define宏定义参数（部分、有错误）：

```verilog
//`define+name+参数 　
`define 　　STATE_INIT　　  3'd0;
`define 　　STATE_IDLE　 　 3'd1;
`define 　　STATE_WRIT　　 3'd2;
`define 　　STATE_READ　　3'd3;
`define 　　STATE_WORK   3'd4;
`define 　　STATE_RETU　　3'd5;
```

#### 3.在需要调用参数的文件init.v中使用`include "para.v"：

```verilog
`include "para.v"
```

#### 4.在init.v文件需要参数的地方使用`name 调用（部分）：

 ```verilog
 state_init <= `INIT_0;
 ```

#### 5.保存之后，程序报错：
```verilog
ERROR:HDLCompiler:806 - "F:/xilinx/pcm1864/v/init.v" Line 51: Syntax error near ";".
ERROR:ProjectMgmt - 1 error(s) found while parsing design hierarchy.
```

#### 6.之后进行了两个多小时的调试（一直没发现问题所在= =），最终在书上的案例中发现原因：`define+name+参数 之后不能加";",也就是说，正确的代码应该是这样的：

```verilog
//`define+name+参数 　
`define 　　STATE_INIT　　  3'd0
`define 　　STATE_IDLE　 　 3'd1
`define 　　STATE_WRIT　　 3'd2
`define 　　STATE_READ　　3'd3
`define 　　STATE_WORK   3'd4
`define 　　STATE_RETU　　3'd5
```

#### 7.之后就都正确了。

### 3、总结：

- 1.`define+name+参数 之后不能加任何东西！
- 2.写代码一定要细心，细致！
- 3.当使用从未使用过的语句时，一定要先确定正确的用法！

### 4、补充：

　　``define` 与localparam和parameter最大的区别就是  `define可以跨文件传递参数；parameter只能在模块间传递参数；而localparam只能在其所在的module中起作用，不能参与参数传递。

[【基本知识】verilog中 `define 的使用 - 要努力做超人 - 博客园 (cnblogs.com)](https://www.cnblogs.com/yjw951012/archive/2019/03/25/10595533.html)
