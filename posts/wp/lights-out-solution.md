---
date: '2012-05-31'
layout: post
title: LightsOut 解法小探
tags:
- LightsOut
- 游戏
- 算法
- 线性代数
categories:
- coder
status: publish
meta:
  _edit_last: '1'
postid: '778'
guid: http://dourok.info/?p=778
type: draft
---
[![]({{urls.media}}/wp-content/uploads/2012/05/light\_out\_banner.png "light\_out\_banner")]({{urls.media}}/wp-content/uploads/2012/05/light\_out\_banner.png)

Lights Out(关灯游戏) 是一款经典的老游戏，维基百科上说Lights Out
是在1995年由 [Tiger
Toys](https://en.wikipedia.org/wiki/Tiger_Toys "Tiger Toys") 第一次发行。接触它却在去年的时候Gnome3的小游戏里。Lights
Out 的规则很简单，游戏由一个 5 \* 5
格的棋盘构成，每格子都是一颗灯，灯肯定是有两种状态，亮或者暗。游戏一开始棋盘上会亮起一些灯，你的目标就是把所有亮起灯都关掉，亮起的灯点一下就会关掉，但游戏当然不会这么简单，点一下灯的时候还会有一些附加影响，准确的说就是点一下灯的时候会切换它和四周也就是是上下左右的灯的状态。找到了一个在线的Lights
Out，[http://www.addictinggames.com/puzzle-games/lightsout.jsp](http://www.addictinggames.com/puzzle-games/lightsout.jsp)。一般能过第五关就差不多了吧。

不过即便是第一关，如果一开始摸不到基本的门道，乱点的话基本上想点回来是很难的，为什么？<script type="math/tex">2^{25}</script>等于多少
，作为一个合格的码农应该脱口而出，33554432
！好吧我承认我也是用计算器的。要玩这游戏首先要明白一个道理：你关的不是灯，是寂寞…噢不，是开关！先不管棋盘上的灯光状态如何，也不管一个开关可以控制多少颗灯，只要知道你点一下方块，就等于切换一次开关，开关就从状态1转换到状态0，再点一下方块，开关又从状态0切换回状态1。这里的0和1也就是开关开和关两种状态，明白这一点很重要，把所有开着的开关都关闭就是完成游戏，所有开着的开关都关闭，肯定没有灯是亮的是吧，但是反过来并不一定成立哦，后面会说到这个。它还可以继续往下推，第一点，**每一个方块只有点第一下才是有意义的**，点第二下也就切换会原始状态，点N下也就是来来回回切换而已。第二点，**开关关闭的顺序无关紧要**。从上往下点，从下往上点都没关系。

如果你有迈克那么牛逼的话，相信现在已经能够透过亮着灯光看到后面隐藏的开关了吧，看不到也没关系先想象一下。我们知道一个开关控制着上下左右和本身的灯光，相对的，**一颗灯亮与否，取决于它本身和四周开关的状态，当有奇数个开关开着的时候，灯就亮，偶数个的时候灯就是暗着的**。再看看第一行，第一行上的一颗灯，能影响到它的开关有本身、左右，这三个都是第一
行上的开关，另外还有下方位于第二行的开关，而上方的开关因为是第一行所以是不存在的。现在假设一下，第一行所有开关都被关闭了，那么此时第一行如果还有亮着的灯，能控制这些灯的开关就只剩下第二行的开关，一颗亮着的灯，显然第二行其对着的开关肯定是打开的，相反的，第一行的灯是暗的，那么第二行对应的开关肯定是关闭的，这样第二行打开的开关就是其上面的灯还亮着的那些。照着第一行亮着的灯把第二行的开关全部关掉，现在一行的灯应该是全暗的，第二行的开关也全部关闭了，第二行还亮着的灯也就只有第三开关能影响到了。同样的，此时第二、三行的情况就跟前面第一、二行的情形一样了。以此类推，第三、四、五行的开关都可以这样关掉，此时游戏也就解决了。终于有一条有用的结论了，**当第一行的开关全部关闭后，其他行的开关通过一个唯一且固定的模式来把开关全部关闭，也就是说对应着上一行亮着的灯把下一行对应的开关关闭就行。**有了这个结论，现在已经把游戏的难度降低不少了，我们只要猜对第一行打开的开关就可以把游戏K.O.了。这个结论，我们把问题猜测的规模从<script type="math/tex">2^{25}=33554432</script>降到<script type="math/tex">2^5=32 </script>。当然这样有点无趣，也不会变得完全没有难度。
但对于计算机来说，那确实是易过吃碗水，遍历第一行的所有可能性，再校验是不是一个解。

但是这种方法不能脱离暴力搜索，始终有点丑陋。我在看Gnome Lights Out
的源码的时候，发现了一篇论文讨论了如何用线性代数的方法来解决这个问题。非常简单的一个方法。

首先我们随便找一个开局状态，1表示灯是亮的，0表示灯是暗的。如下所示，

[![]({{urls.media}}/wp-content/uploads/2012/05/light\_out\_state_1.png "light\_out\_state\_1")]({{urls.media}}/wp-content/uploads/2012/05/light\_out\_state_1.png)


<script type="math/tex; mode=display">\begin{vmatrix}1 & 0 & 0 & 0 & 0 \\1 & 1 & 1 & 1 & 0 \\1 & 1 & 1 & 1 & 1 \\1 & 1 & 1 & 1 & 0 \\1 & 0 & 0 & 0 & 0\\\end{vmatrix}</script>


把这些数字放到一列里并标上号，就成了向量<script type="math/tex">\vec b=(b\_{1,1},b\_{1,2},\cdots,b\_{1,5},b\_{2,1},\cdots,b_{5,5})^T</script>

当我们按一下开关，<script type="math/tex">\vec b</script>又会发生什么变化呢？比如按下位于坐标(1,1)的开关，记为<script type="math/tex">s\_{1,1}</script>。当<script type="math/tex">s\_{1,1}</script>按下时，他会改变<script type="math/tex">b\_{1,1} ,b\_{1,2},b\_{2,1}</script>的状态，如果灯光原来的状态为0，那么就变成1，原来为1就变成0。这个刚好是GF(2)上的加法，GF(2)怎么说呢，其实和一般的数域没什么区别，因为只有两个元素
0， 1 。那么在这个域上 1 + 1 就等于 0
。我们把<script type="math/tex">s\_{1,1}</script>也用向量表示，它就是这个样子的


<script type="math/tex; mode=display">\vec s_{1,1}=(1,1,0,0,0,1,0,\cdots,0)</script>


当我们在游戏中点一下开关<script type="math/tex">s\_{1,1}</script>，数学上就等于<script type="math/tex">\vec b + \vec s\_{1,1}</script>
。我们还可以继续表示其他开关的向量，比如，


<script type="math/tex; mode=display">\vec s_{1,2}=(1,1,1,0,0,0,1,\cdots,0)</script>



<script type="math/tex; mode=display">\vec s_{5,5}=(0,\cdots,0,1,0,0,0,1,1)</script>
 。

前面我们说过，这个游戏的目的就是把全部打开着的开关都关闭了，开关的状态我们已经用<script type="math/tex"> s\_{1,1},\cdots,s\_{5,5}</script>
表示，不多不少刚好25个，如果我们用1来表示这个开关是打开，0来表示关闭，那么一个游戏初始的开关状态也可以用一个向量来表示，

<script type="math/tex; mode=display">\vec x=(x\_{1,1},x\_{1,2},\cdots,x\_{1,5},x\_{2,1},\cdots,x_{5,5})^T</script>
。由于游戏的开关状态时未知的，是我们玩这个游戏的目的，所以这里用x表示。<script type="math/tex">\vec x</script>即是初始局面打开的开关，也是灯全暗变换到棋盘初始状态所需要点开的开关，所以我们也把<script type="math/tex">\vec x</script>称为一个策略。<script type="math/tex">\vec b</script>表示初始状态，<script type="math/tex">\underline{0}</script>灯光全暗的状态。

<script type="math/tex; mode=display">\vec b =\underline{0}+x\_{1,1}\vec s\_{1,1}+\cdots+x\_{1,5}\vec s\_{1,5}+x\_{2,1}\vec s\_{2,1}+\cdots+x\_{5,5}\vec s\_{5,5}</script>


解上面的方程可以用下面这个线性方程来表示：<script type="math/tex">A\vec x=\vec b</script> 其中A是一个 25 \* 25
的矩阵：


<script type="math/tex; mode=display">A = \begin{vmatrix}B & I & O & O & O \\I & B & I & O & O \\O & I & B & I & O \\O & O & I & B & I \\O & O & O & I & B \\\end{vmatrix}</script>


I是一个 5 \* 5 的单位矩阵，O是一个 5 \* 5
其元全部为零的矩阵。而B是这样一个矩阵：


<script type="math/tex; mode=display">B = \begin{vmatrix}1 & 1 & 0 & 0 & 0 \\1 & 1 & 1 & 0 & 0 \\0 & 1 & 1 & 1 & 0 \\0 & 0 & 1 & 1 & 1 \\0 & 0 & 0 & 1 & 1 \\\end{vmatrix}</script>


如果把 I, O, B 代入 A 那么 A 的每一列都对应着一个开关的s向量。

采用高斯-若爾當消元法对A的增广矩阵<script type="math/tex">(A   \vec b)</script>，就可以求出<script type="math/tex">\vec x</script> 。

如果令 <script type="math/tex">\vec b = \bf{0}</script>，在 5 \* 5
的游戏规模下，解<script type="math/tex">A\vec x=\bf{0}</script>。除了 <script type="math/tex">\vec x = \bf{0}</script>外，还有另外两个解，分别是：


<script type="math/tex; mode=display">\vec x_{1}=(0,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,0)^T</script>



<script type="math/tex; mode=display">\vec x_{2}=(1,0,1,0,1,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,1,0,1,0,1)^T</script>


由此可见，5 \* 5
游戏的解并不是唯一的，即便是灯光全暗，也不一定表示开关全部被关闭。另外，并不是所有可能性都有解。好了就先到这里，了解更多请见下面的链接：

-   [gnome game
    lightsout的源码](http://git.gnome.org/browse/gnome-games/tree/lightsoff)
-   [Turning Lights Out with Linear
    Algebra](www.math.ksu.edu/~dmaldona/math551/lights_out.pdf)
-   [mathworld
    上的一个讨论](http://mathworld.wolfram.com/LightsOutPuzzle.html)
-   [高斯-若尔当消元法的算法](http://www.cnblogs.com/pegasus/archive/2011/07/31/2123195.html)
