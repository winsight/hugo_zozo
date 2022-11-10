---
title: "Some Verilog Tips"
date: 2022-11-09T10:42:51+08:00
slug: "fc85bf3c"
hidden: false
draft: true
tags: ["verilog","学习"]
keywords: ["verilog","学习"]
description: ""
Summary: ""
Navbar: false
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
