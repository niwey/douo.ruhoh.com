---
title: 'orgmode'
date: '2012-10-24'
description:
---
### 总览

orgmode 看起来很牛逼的样子，主页：http://orgmode.org/ Html 版本的[手册](http://org.mode.org/org.html)



###  TODO 列表

[这里](http://www.laihj.net/tag/orgmode/)有详细总结

C-S-RET 
	
	创建一个TODO项目
	
C-c C-t

	改变TODO状态，TODO项在三个状态中循环
	,->(unmarked)->TODO->DONE–.

S-M-RET
	
	创建一个目前层级的TODO项

C-c C-s
	
	设置 SCHEDULED 日期

C-c C-d

	设置 DEADLINE 日期

	

循环的任务，如下面例子

	* TODO 刷牙							      :tag:
	   SCHEDULED: <2012-10-24 Wed .+1d>
 
 `.+1d` 表示任务每天重复一次，
 
 C-c C-q 
	 
	 可以为任务打上标签
	 
	 
C-c C-x a

	将某一个节点打上ARCHIVE标签。

C-c C-x A

	将当前节点归入一个名为Archive的子树中，并且这个子树是位于当前级别子树的最下方。


文章中 agenda view 方面的快捷键失效了
