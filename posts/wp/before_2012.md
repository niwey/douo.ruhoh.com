---
date: '2011-12-25'
layout: post
title: 来除草了。。。
tags:
- processing.js
- Wordpress
- Wordpress Theme
- 吐槽
categories:
- Life
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  dsq_thread_id: '796842635'
postid: '636'
guid: http://dourok.info/?p=636
---
终于争取到在2012前上来吐槽下，记录下对博客做的修改和一些新理解。
首先取消了分类目录，全部通过标签来做归类管理。像我这种随便吐槽的博客用分类目录，很多时候都觉的是种自我限制，相对的标签就自由许多，同时也有归类的功能。这方面不得不说Evernote很有相见之明，不过我很久没用Evernote了，听说它也是顶不住用户的压力开始支持分类管理了。至于技术文章，我把它归为笔记类，和其它笔记，摘抄都记录到我的wiki里，wiki目前还是通过分类管理的，分得细致很多，不过我觉得更合理的话应该要配合上标签，即便没有客户端和没有标签管理下DokuWiki还是完全替代了我对Evernote的使用，何况标签这个功能装个插件就有了，Wiki的自由和可扩展性是无可替代的。一直有个将dokuwiki变身为云笔记想法，主要目的本地和服务器同步文件，还有Web编辑器太弱了，想通过Emacs来做桌面客户端，再来个Android
App，加上一些自己常用网站的接口插件，就差不多了。我已经启动这个项目很久了（见[wiki-note](http://code.google.com/p/wiki-note/)），不过一直没有动工过，果然是拖延症患者吧。
取消了分类目录，我就希望博客更整洁些，所以决定采用单栏模板让文章内容的空间大一些。但苦于找不到比较入眼的单栏主题，无奈选择自己看教程做，本想基于twentyten来改的，无意间发现
[CriticalZero](http://criticalzero.co.uk/%20)这个站，它的设计令我耳目一新，特别是头部用条斜线来切割页面，相当大胆，用的好的话就是小清新，用不好的话就像眼前这个网站一样-\_-(纯粹213需要，无意贬低原作者)。虽然他页面内容的排版也漂亮，但文章的空间太小不适合我的需求。所以我还是采用传统的纵向排列，这样保证了文章有足够大的宽度，看起来舒服些。其它细节我也搬了不少过来，再加上一些从其它主题搬过来的设计和来自
[Gentleface](http://gentleface.com/free_icon_set.html)
的图标、乱来的配色，不过 [Web
Colors](http://www.css-html.net/web_colors/)
真的很有帮助。就这样左抄抄右抄抄，像我这样的前端苦手也能完成一款wordpress主题。
我的第一款wordpress主题就叫做BetaD吧。[BetaD](https://github.com/dourokinga/BetaD)是twentyten（wordpress自带主题）的子主题（child
theme），设计主要来自 [CriticalZero](http://criticalzero.co.uk/%20)
，Copy的太多都不好意思说是参考了。目前是dirty又buggy，只在Chrome和Firefox下测试过，我自己发现的就有不少bug，也没要提供任何可自定制的接口，下次再修复吧。有兴趣的同学到这里看下：[https://github.com/dourokinga/BetaD](https://github.com/dourokinga/BetaD)
另外，不知大家有发现没，这个主题的背景是动态生成，在研究代码是时候，发现了相当酷的框架[processing.js](http://processingjs.org)，是用来做html5交互动画的。这个背景就是用这个框架生成的，看起来十分强大的样子，一定要来研究下。
