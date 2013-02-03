---
title: '站点日志'
date: '2012-10-23'
description:
---

### 2012-11-16

正式開始新站點的日誌記錄，重新實現了一個更有靈活性的TOC插件，為筆記系統添加了樣式，twitter-bootstrap 的經典結構。


### 2012-11-17

移除 toc plus widget，把js文件加入到主题中。

### 2012-11-22

重新設計博客的響應式導航欄，用一個導航欄實現兩種佈局，現在感覺良好。

### 2013-01-20

升级到ruhoh2.0，ruhoh2 抽象了一个resource的概念，可以极大的减少diary和
notes与ruhoh系统的耦合，但仍然不能作为附加插件存在，在 `resource_interface` 和 `preview` 中仍然需要一些硬编码。不过其实实现这个并
不困难。posts，pages，diary，notes 都是继承自Page。

### TODO

筆記：

- 界面需要重新实现
- 專門描述應用內引用的語法，參考wiki語法
- 當TOC超過屏幕高度時,該如何處理
- 实现文内引用到文中其他小结的便利方法
- url也使用别名,保证全部文件和地址都是acsii字符

博客：

- SEO 現在很糟糕
- <del>移除为响应式布局使用的两个导航栏,dirty</del>
- lazyload的模式讀取各種js庫，mathjax,processingjs,etc
- production 模式下，壓縮 js 和 css ，最好實現合併，減少請求
- 弄清楚 diqus 评论出现localhost的问题
