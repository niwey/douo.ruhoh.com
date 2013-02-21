---
title: '站点日志'
date: '2012-10-23'
description:
---

这里只记录一些比较大的改动和想法，更详细的记录请查看[这里](https://github.com/douo/douo.ruhoh.com/commits/master)和[这里](https://github.com/douo/ruhoh.rb/commits/2.0plus)

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

### 2013-02-07

通过递归导入 partial 实现让 mustache 展示递归结构的数据，重构了笔记 navigation 和 toc 的 mustache 接口

### 2013-02-08

面包屑导航

### 2013-02-18

ruhoh 2 的分类目录文章列表没有按照日期排序，增加个`Ruhoh::Resources::Page::CollectionView#categories_sorted` 返回排序好的列表

### 2013-02-21

为笔记数据即`ruhoh.db.notes`生成树状索引，collection_view#navigation 不用再每次调用都重新生成。

### TODO

筆記：

- 專門描述應用內引用的語法，參考wiki語法
- 实现文内引用到文中其他小节的便利方法
- 反向链接
- 扩展接口，isParent? listChildren relativePath


博客：

- SEO 現在很糟糕
- lazyload的模式讀取各種js庫，mathjax,processingjs,etc
- production 模式下，壓縮 js 和 css ，最好實現合併，減少請求
- 弄清楚 diqus 评论出现localhost的问题
- preview 模式新增page，删除page都不能得到更新
