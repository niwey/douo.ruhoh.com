---
date: '2010-12-09'
layout: post
title: dokuwiki新版本"Anteater"支持UTF-8文件名
tags:
- dokuwiki
- FML
- php
- UTF-8
categories:
- coder
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  _aioseop_keywords: dokuwiki,dokuwiki新版本,dokuwiki utf-8 fix,dokuwiki 文件名修复,dokuwiki
    utf-8修复
  dsq_thread_id: '796842578'
postid: '412'
guid: http://dourok.info/?p=412
---
";

//可能要动手修改的地方\
\$ds =dirname(\_\_FILE\_\_) . "/data"; //默认同目录下的data文件夹 //\$ds
= "/xxxx/dourok.info/wiki/data"; //自己指定data文件夹\
rename\_data(\$ds);

echo "if everything running fine,delete this php file

"; ?\>
对跟我一样只有FTP权限的童鞋应该有帮助，将上面的代码复制下来，保存成php文件如fixfn.php，最好UTF8编码的，上传到服务器，位置见代码注释，访问一下搞定。再次提醒一定得**备份原数据**啊！php菜鸟一个，你们懂的。

突然想来一段FML:
今天，本来是想把dokuwiki的老数据拉到本地系统上来改名的，用Java写好了代码才想起windows文件名不是utf-8，于是乎再将数据跟代码传到我的ssh服务器上，上面有java环境，运行下才发现服务器不支持非ASCII字符，我一早知道又给忘了，无奈只能用php重写，实现了url解码成功改完名后，才发现php有urldecode…FML
