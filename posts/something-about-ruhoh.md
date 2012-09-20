---
title: 关于ruhoh的一些记录
date: '2012-08-20'
description:
categories:
- coder
- life
---
{{! 关闭掉mustache的默认分隔符，因为要罗列mustache的代码}}
{{=<% %>=}}

### ruhoh ###

这里也许会成为我第一篇ruhoh的博客，先罗列一下常用的命令吧。

    rackup -p 9292  # 启动 web 服务在 9292 端口
	ruhoh page about.md  #创建一个页面，支持子目录 
	ruhoh post "The Greatest Post Ever" #通过标题创建文章，将会生成 the-greatest-post-ever.md
	ruhoh draft #快速建立一个草稿，生成untitled-draft-1.md 
	ruhoh titleize #快速为草稿文件命名

后台

    http://localhost:9292/dash


将 ruhoh 打造成一个个人的 blog ，知识管理系统 （类wiki），日记。
因为要要作为日记使用，还需要提供类似 evernote 的加密方案。

目前，我對ruhoh的態度是，能用ruhoh 基本功能實現的就用ruhoh，不能用
ruhoh實現的就先擱置，甚至不使用插件。如果可以用js實現的話，也值得考慮
一下。

看了 pluskid 的[文章]，我也跟着实现了保存的时候自动刷新页面。需要安装几个东西

- [guard][]
- [rack-livereload][]
- [guard-livereload][]

[guard]是一个监听文件系统变动的工具，[rack-livereload] 实现了自动刷新。安装和使用看一下各自的 readme 还是很容易明白的，但具体怎么工作我也没弄清楚，反正不用改动ruhoh的一个代码，很方便。不过我在 windows 下安装 [guard-livereload] 出了问题，原因是EventMachine 0.12.10 不能在跑着 ruy 1.9.2+ 的windows上工作。用 pre-release 的版本就可以解决问题，讨论在[stackoverflow](http://stackoverflow.com/questions/6927907/ruby-problem-installing-eventmachine-under-windows-7#) 上。

	gem install eventmachine --pre

今天发现 guard 这货在 win7 cygwin 下进程占用CPU 100%，不知道是什么情况。

[文章]: http://freemind.pluskid.org/technology/the-unbearable-madness-of-static-blog-generators/

[guard-livereload]: https://github.com/guard/guard-livereload

[rack-livereload]: https://github.com/johnbintz/rack-livereload

[guard]: https://github.com/guard/guard

### 评论 ###

静态博客的评论系统只能通过第三方评论系统来实现，ruhoh 是用 widgets 来嵌入第三方评论。內置支持disqus。

我的目的是實現，ruhoh 和  wordpress 的相同篇文章共用一個評論。disqus
提供了這種可能性
[Why are the same comments showing up on multiple pages?] wordpress 的
disqus 插件使用了 文章的post\_id 和 guid 作爲 disqus\_identifier ，模
式如下

	post_id + ' ' + guid

所以在 [wp\_to\_ruhoh](https://gist.github.com/3415268) 里，我就這兩個屬性也保留下來。但是 ruhoh 的
widget 不能訪問 page 的數據（吭爹呀），見 [issue52][]。所以只能把代碼
放到 theme 的 layout 里。如下:

    <div id="disqus_thread"></div>
            <script type="text/javascript">
                /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO
            YOUR WEBPAGE * * */
                var disqus_title = '{{page.title}}';
                var disqus_identifier ='{{page.postid}} {{page.guid}}';
                var disqus_shortname = 'doousblog'; // required: replace example with your forum shortname
    
                /* * * DON'T EDIT BELOW THIS LINE * * */
                (function() {
                    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                    dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
                    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                })();
            </script>
            <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
            <a href="http://disqus.com" class="dsq-brlink">comments
                powered by <span class="logo-disqus">Disqus</span></a>




另外，对于 ruhoh 的 post ，如果不想以后换个标题，或者换个域名，都要重新整合评论，最好每篇文章提供一个 unique id 作为 disque_indentifier 使用。[Some Jekyll Hacks][] 希望可以得到一些启示。

[Some Jekyll Hacks]: http://brizzled.clapper.org/blog/2010/12/20/some-jekyll-hacks/


[issue52]: https://github.com/ruhoh/ruhoh.rb/issues/52

[Why are the same comments showing up on multiple pages?]: http://help.disqus.com/customer/portal/articles/662547-why-are-the-same-comments-showing-up-on-multiple-pages-


### mustache ###

一个Logic Less（不知道怎么翻译，目的大概是把逻辑还给代码，让模板保持简洁[stackoverflow][]）的模板语言，所以同样以语言无关为目标的 ruhoh 采用了它作为模板语言。参考它的 [demo][] 可以大致了解它的特性

json 对象:

    {
      "header": "Colors",
      "items": [
          {"name": "red", "first": true, "url": "#Red"},
          {"name": "green", "link": true, "url": "#Green"},
          {"name": "blue", "link": true, "url": "#Blue"}
      ],
      "empty": false
    }

模板：

    <h1>{{header}}</h1>
    {{#bug}}
    {{/bug}}
    
    {{#items}}
      {{#first}}
        <li><strong>{{name}}</strong></li>
      {{/first}}
      {{#link}}
        <li><a href="{{url}}">{{name}}</a></li>
      {{/link}}
    {{/items}}
    
    {{#empty}}
      <p>The list is empty.</p>
    {{/empty}}

结果：

    <h1>Colors</h1>
    <li><strong>red</strong></li>
    <li><a href="#Green">green</a></li>
    <li><a href="#Blue">blue</a></li>

对于  `"tags"=>["forkosh", "LaTex", "mathtex"]` 这样列表或者数组(top-level-array)，没有 key 所以要这样处理

    <ul>
      {{#tags}}
      <li>{{& .}}</li>  <!-- 等同于 {{{ . }}} 不转义html字符 -->
      {{/tags}} 
    </ul>

下面基本上就是 if-else 结构，但是功能有限

    {{#repo}}
      <b>{{name}}</b>
    {{/repo}}
    {{^repo}}
      No repos :(
    {{/repo}}

`{{! ignore me }}` `"!"`用于注释

如果好奇为什么我可以显示`{{ }}`,请参考[mustache(5)][] 的Set Delimiter。

[mustache(5)]: http://mustache.github.com/mustache.5.html
[stackoverflow]: http://stackoverflow.com/questions/3896730/whats-the-advantage-of-logic-less-template-such-as-mustache
[demo]: http://mustache.github.com/#demo

<%={{ }}=%>
{{! 切换回默认的分隔符，免得出现奇怪的问题}} 

### bootstrap ###

折騰了幾下，感覺目前我弄的這個主題，並不能發揮bootstrap作爲脚
手架的能力，用它的栅格系统总是不能把边栏设计地让人满意。不過响应式布局（responsive）這個特性實在太強了，基本可以保證在不同分辨率
的設備上都可以保持比較好的閱讀體驗，不过我分别实现了两个导航栏对应移动设备和pc，从语义上讲就很糟糕了。不過單單用它的那些小工具也非常值得，
bootstrap 的設計真的很漂亮，像我這種沒有前端經驗的碼農，也可以用的很舒
服。

如前面所说主題左邊那個固定的導航欄不能利用到bootstrap的栅格系统，只能用原來那
種方法，還是很遺憾的。

bootstrap 更适合于下面这种布局，很不错的设计，正在考虑要不要偷过来。

- http://www.kissuki.com/
- http://freemind.pluskid.org

这个 ruhoh 主题可以在这里找到： [Moon]

[Moon]: https://github.com/douo/douo.ruhoh.com/tree/master/themes/moon

### Markdown ###

用了一段時間的 Markdown ，發現 Markdown 主要的缺陷就是太簡單了，優點也
是太簡單了，非常直觀。真是矛盾。

現在主要影響比較大的有幾點：

1. 无法为 img 标签指定 class 
2. 無法爲文章生成 content
3. 實現擴展不容易

第1點，是markdown 語義的限制，2，3 倒也不能怪 Markdown，不過在不動用
ruhoh 的插件的情況下，要解決基本無望。但是，我目前並沒有放棄 Markdown
的打算，我覺得它的簡潔很漂亮，而且也是有它的道理的，先習慣一下，不過應
該也是逃不了自己再擴展的命運了。

再羅列一下，其他朋友對Markdown的批評:

-  [Why I hate Markdown (and prefer reST)](http://blog.liancheng.info//why-i-hate-markdown)
-  [The Unbearable Madness of Static Blog Generators](http://freemind.pluskid.org/technology/the-unbearable-madness-of-static-blog-generators)

markdown 的转义让人抓狂

#### pandoc 增强

http://www.ituring.com.cn/article/746

### Mathjax ###

mathjax的使用非常方便，直接在頁面嵌入script就行，然後通過一個 widgets
來載入 mathjax 的腳本。就可以展示公式了，現在的主要問題還是要不要通過
插件來簡化語法。而且已經有同學實現了[這個插件](https://gist.github.com/2699636)了。

<script type="math/tex; mode=display"
id="MathJax-Element-11">e^{i\pi} + 1 = 0</script>

### RSS & sitemap ###

新版的ruhoh 已经内置 rss 生成插件，但是这个插件有不少问题，我参考了wordpress的rss改进了一下，见 [rss.rb][]。不过现在在goodle reader的日期还有问题。google reader 是分成两个日期的，分别是`已收到项目`和`已发布项目` 默认显示的是`已收到项目`。在rohoh 中就是rss.xml 的生成时间，结果导致所有文章的显示出来的日期都一样。

sitemap 生成我用的是[crchan][]的[Ruhoh Sitemap Generator][]，做了一些根据wordpress的sitemap做了些改动，改动版在[这](https://gist.github.com/3736089)

[Ruhoh Sitemap Generator]: https://gist.github.com/3705998

[crchan]: https://github.com/crhan

[rss.rb]: https://gist.github.com/3736010

### TODO ###

- <del>Mathjax</del>
- <del>moon 主題</del>
- <del>wp 轉換程序，codecolor 插件 短標籤的問題</del>
- <del>sitemap</del>
- <del>rss</del>
- less
- processing.js
- 为每篇文章增加id 为 disque 所用
- 生成content




### TEST ####
