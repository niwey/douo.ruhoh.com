---
title: git
date: '2013-02-22'
description:
type: draft
---

### rebase

rebase 有两个实用的应用

1. [砍掉分支](http://gitbook.liuhui998.com/4_2.html)
2. [合并多个历史提交](http://stackoverflow.com/questions/4936778/git-merge-commits)

### 工作流

结合 [GitHub Flow] 总结一个尽量简单的工作流。

对于移动应用来说：

- 两个必备分支，release 和 master
- release 的 HEAD 必须是最后一次发布的版本。 
- 每一次完成新特性或者 bug 修复后则并入 master 分支。master 的 HEAD 必须是一个功能完整的版本。
- 开发新特性，则以简短的对特性描述性名称为分支名
- hotfix 以`hotfix-编号`为分支名

对于 web app 则取消掉 release 分支，基本与 [GitHub Flow] 无异。

本站是个人用的写作系统则采用单分支策略，一个 master 足已。有很多疲于描述的小提交还不知道如何处理。

对于一些迫不得已的脏提交，比如说下班走人。注意回去后，及时 rebase 清理干净。

如果当前这个工作流不好用再来考虑比较复杂[git-flow]，它还有一个简化命令的[脚本](http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/)

[GitHub Flow]:http://scottchacon.com/2011/08/31/github-flow.html
[git-flow]:http://nvie.com/posts/a-successful-git-branching-model/
