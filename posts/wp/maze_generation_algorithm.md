---
date: '2011-07-14'
layout: post
title: 迷宫生成算法
tags:
- javascript
- 图论
- 迷宫
categories:
- coder
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  _aioseop_title: 迷宫生成算法
  _oembed_1a397c109f841b5971468435cb442dbc: ! '{{unknown}}'
  _aioseop_description: 图的生成树算法那就相当广泛了,一次广度优先搜索(BFS)或深度优先搜索(DFS),都可以构建出图的生成子树.只要让选择下一个节点的策略随机化,每次搜索出来的就是一个随机生成树也就是随机生成的迷宫.但是BFS生成出来的结果由于其他节点相对于起始节点的深度不变,导致迷宫随机性不够理想,下面提到的Prim算法算是一种对BFS的不错改进.DFS生成的过程比较生动就像是在挖地道一样推倒一面面墙.用来生成迷宫就比较直观也比较适合.
  _oembed_a9466b9d61b91e3f0fcf26adaeca1abb: ! '{{unknown}}'
  _oembed_bb47c31475c4cdc612e4e8f662c6f6de: ! '{{unknown}}'
  _aioseop_keywords: 迷宫生成算法,迷宫,图论,Prim,生成树,kruskal,DFS,分治法
  _oembed_98ed83789e396f86625337503a7171d8: ! '{{unknown}}'
  _oembed_395d9ab284e506f84a4e31fa318b8b81: ! '{{unknown}}'
  _oembed_6ff967c06fc6ef3c919e2cd84cc20e7a: ! '{{unknown}}'
  _oembed_9be757658b58c675a4934437216a5ed1: ! '{{unknown}}'
  _oembed_b0e15007ad454a31f7011315d9036493: ! '{{unknown}}'
postid: '537'
guid: http://dourok.info/?p=537
---
迷宫,大家都在知道是什么吧.一种标准的迷宫可以是像下图这样的结构,

[![](http://dourok.info/wp-content/uploads/2011/07/maze01.png "maze01")](http://dourok.info/wp-content/uploads/2011/07/maze01.png)

一个矩形空间上,布置出错综复杂的墙,本文讨论的主要是这种结构的简单迷宫.可以想象出在下图这样的结构里,推倒某些墙壁.来生成迷宫.当然墙不是随便可以推倒的.

[![](http://dourok.info/wp-content/uploads/2011/07/maze3.png "maze3")](http://dourok.info/wp-content/uploads/2011/07/maze3.png)

这样的结构姑且称为完全方格图(square grid
graph)吧.从图论角度上看,这样的结构等同于下面这张图.圆圈表示顶点,线段表示边.

[![](http://dourok.info/wp-content/uploads/2011/07/maze2.png "maze2")](http://dourok.info/wp-content/uploads/2011/07/maze2.png)

而最上面的迷宫,就可以认为上面那张完全方格图的[生成子图](http://zh.wikipedia.org/wiki/%E5%9B%BE#.E5.9F.BA.E6.9C.AC.E6.9C.AF.E8.AF.AD),仔细观察上面的迷宫,就会发现无论从那里开始走,都可以到达迷宫中的任意一个地方(顶点).用图论术语来讲也就是说迷宫它还必须是一个[连通图](http://zh.wikipedia.org/wiki/%E8%BF%9E%E9%80%9A%E5%9B%BE),这个可以理解,迷宫里到达不了的地方实际上没有意义.

另外继续观察还可以发现,无论你从那个地方出发,只要不往回走,就永远也回不到原来出发的地方.也就是不会绕圈圈.图论上说这叫做没有回路.当然回路这个可以有,有回路的迷宫更让人迷惑也可以更好玩,但这还得取决于回路如何设计.简单起见,这里生成的迷宫没有回路.就这两个特性,就可以给这种迷宫下定义了:完全方格图的没有回路连通生成子图.也就是完全方格图的[生成树](http://zh.wikipedia.org/zh-cn/%E6%A0%91_(%E5%9B%BE%E8%AE%BA)#.E5.AE.9A.E4.B9.89).

图的生成树算法那就相当广泛了,一次广度优先搜索(BFS)或深度优先搜索(DFS),都可以构建出图的生成子树.只要让选择下一个顶点的策略随机化,每次搜索出来的就是一个随机生成树也就是随机生成的迷宫.但是BFS生成出来的结果由于其他顶点相对于起始顶点的深度不变,导致迷宫随机性不够理想,下面提到的Prim算法算是一种对BFS的不错改进.DFS生成的过程比较生动就像是在挖地道一样推倒一面面墙.用来生成迷宫就比较直观也比较适合.

还有经典的最小生成树算法,Kruskal和Prim,都可以用来生成迷宫.当然完全方格图所有边都是单位权值的.所有生成树都是最小的,要运用Kruskal和Prim要做的改变就是将原来已以小优先的选择边策略改为随机选取.出来的是一个随机生成树.

当然上面的算法都是基于图论的,在维基百科里还提到另外一种不用图论的算法,比较有趣,叫递归分割法(Recursive
division
method),我喜欢叫你建墙我挖洞法,从名字就可以看出这是一种分治法,基本的策略就是,在一个空间里建立两面相交墙,形成四个较小的空间,然后再挖上三个洞.然后再对四个较小的空间执行相同的处理.直至每个空间的长或宽为单元大小不可再分割为止.这种方法效率比较高,由于是分治法也比较适合用分布式运算.这种方法生成出来的迷宫也是符合上面所提到的连通性和没有回路两个特点,可以用递归法简单证明下,由于两面墙隔出了四个空间,开三个洞刚好使每个空间可以互相连通,且没有回路,如果从一个空间到达另一个空间必定到达该空间的其中一个子空间,也就可以到达其他三个子空间.以此类推就到达迷宫上的每一个空间.不够生成出来的迷宫却较为简单,直路太多不够扭曲.

我用html5实现一个[迷宫生成算法的演示](http://tools.dourok.info/mazegame/mazegame.html),分别针对DFS,Kruskal,Prim和最后的分治法.可以去玩一下.

抱怨一下javascript,绘画速度还是不够快,对于大一点的迷宫必须用脏矩形重绘,才能保证速度.不够画出来的效果却不咋地.

至于这种迷宫的走法,一个DFS就可以很好地解决了.

当然实际设计出迷宫不像是这些算法这么简单的,正如谁谁谁所说的

"迷宫设计不仅是线条和图案的组合，要有娱乐性、装饰性，还要考虑那些穿越迷宫者的感受，那样才趣味无穷"

有空再考虑下其他类型迷宫的生成算法.

未完待续...

参考: http://en.wikipedia.org/wiki/Maze\_generation\_algorithm
http://en.wikipedia.org/wiki/Maze
