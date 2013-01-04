---
title: Ruhoh 目录生成随想
date: '2012-11-20'
description:
categories: coder
tags:
- ruhoh
- ruby
- markdown
- toc
- mustache
---
{{=<% %>=}}
之前已经通过实现一个新的 Markdown Converter 来生成目录(TOC: table of contents )，但是这种做法有很大的缺陷，目录代码只能加入Markdown转换后的最终结果文档上，不能与文章内容分离出来放在页面的其他地方，明显是不合理的，且毫无灵活性可言。理想中的做法，是可以用`{{toc}}`在模板中指定目录的位置，通过partial来定制toc的模板。后来做了笔记系统需要两个不同风格的目录，这个问题就不能回避了。

生成目录可以在前台或后台实现。显然在前台，即用javascript实时生成目录，更简单明了，而且 [@brianclapper][]早已提供一个实现的[方法][]，在ruhoh上可以用widgets实现，但是要实现根据page参数来开启关闭还是比较麻烦，因为widgets不能读取到page的数据，不过这也只是小问题，不是我最后选择用后台插件的原因。

为何要在后台生成目录？首先，我觉得目录应该和正文一样是属于文章的一部分，虽然它可以根据布局需要出现在页面的任意地方，所以我不能接受需要一个javascript解析器才能把文章显示完整。另外，我一开始是希望能有很高的灵活性，支持三种开启目录的模式，分别是自动，强制开启，强制关闭，后来觉得只有标题超过一定的数量才生成目录，也就是自动这一个模式就已足够，最重要的是这一部分的代码之前我已经实现好了。还有一点，用插件实现，编译一次搞定，不用每次访问都浪费计算资源去生成目录。

不过具体实现起来用插件也做不到高效，因为ruhoh的编译流程所限，不能做到将Converter工作后的产生的数据，加入payload为Mustache所用。这样表达好像不清楚，因为目录的数据是需要Converter来生成，就是说将markdown转换为html后，才知道目录是长什么样的，而这个过程是在Mustach render的方法里，已经载入了payload。所以当模板需要目录的时候，只能再去解析一遍markdown文件，很糟糕，不过目前效率还不成问题。

功能实现后，通过 Mustache Helper 为模板增加一个目录接口，但是因为锚的存在，仍需要定制Converter，在markdown生成的目标html中为每个header标签加入各自的id作为锚。不能不说这是很不好的地方。

整体上讲，以ruby的灵活性，应该有更好的实现方法，不过目前实力不够，只能够先把需求实现了，顾不上优雅了。

代码见 [toc_render.rb][]. 在 [custom.rb][] 实现 toc 的 mustache helper，[limdown.rb][] 为header 加上 id。另外，可以建立名为 [toc_wrapper][] 的partial 作为目录的模板。为了让笔记系统可以使用与博客不同的toc_wrapper，还实现了一个可以传入模板名的Block Helper。

    {{#toc_wrapper}}
    toc_wrapper_note
    {{/toc_wrapper}}

[toc_wrapper]: https://github.com/douo/douo.ruhoh.com/blob/master/themes/moon/partials/toc_wrapper.html

[limdown.rb]: https://github.com/douo/douo.ruhoh.com/blob/master/plugins/converters/limdown.rb

[custom.rb]: https://github.com/douo/douo.ruhoh.com/blob/master/plugins/custom.rb

[toc_render.rb]: https://github.com/douo/douo.ruhoh.com/blob/master/plugins/toc_render.rb

<%={{ }}=%>


[方法]: http://brizzled.clapper.org/blog/2012/02/04/generating-a-table-of-contents-in-octopress/

[@brianclapper]: https://twitter.com/#!/brianclapper

