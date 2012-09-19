---
date: '2010-08-03'
layout: post
title: CodeColorer中文帮助
tags:
- CodeColorer
- wordpress插件
- 插件翻译
- 语法高亮
categories:
- otaku
status: publish
meta:
  _edit_last: '1'
  dsq_thread_id: '796842398'
postid: '149'
guid: http://dourok.info/?p=149
type: draft
---
写在前面
--------

用WordPress以来，一直都用CodeColorer插件用来实现代码高亮，不过一直没花时间去看说明，用起来很苦恼。所以今天决定花点时间认真学习下，并根据作者的说明总结下各个属性的作用，还添加了些例子，以后忘了理解起来也方便些。不过都是些苦力活啦。

### CodeColorer

CodeColorer是一款基于[GeSHi](http://qbnz.com/highlighter/)库的WordPress代码语法高亮插件。功能简单，使用方便，是一款比较轻量的插件。CodeColorer支持

    code

和 [cc inline="true"
lang="xml"]`code`{lang="lang"}[/cc]两种语法。[这里是插件的主页](http://kpumuk.info/projects/wordpress-plugins/codecolorer/)，本文据此翻译修改而成。

属性说明及例子
--------------

属性列表如下,括号内是参数类型.string是字符串；integer是整数；boolean是布尔型(开关)，可接受“true"
"false", "on" "off", 整数 1 or 0.

-   [`lang`{inline="true"}](#lang) (string) – 代码使用的语言。
-   [`tab_size`{inline="true"}](#tab_size) (integer) –
    用以替换制表符的空格数，可在设置界面更改。
-   [`line_numbers`{inline="true"}](#line_numbers) (boolean) –
    是否显示行号，可在设置界面更改。
-   [`first_line`{inline="true"}](#first_line) (integer) –
    指定代码块第一行的行号
-   [`highlight`{inline="true"}](#highlight) (string) –
    用于指定整行高亮的代码行行数，参数是用半角逗号分隔的数字串(如
    1,5,8,9)。
-   [`no_links`{inline="true"}](#no_links) (boolean) –
    当值为false时，关键字将会添加一个到官方文档的链接，可在设置界面更改。
-   [`lines`{inline="true"}](#lines) (integer)
    –指定代码块显示的行数，当值设置为-1时，不出现纵向滚动条，可在设置界面更改。
-   [`width`{inline="true"}](#width) (integer or string) –
    代码块宽度，可在设置界面更改。
-   [`height`{inline="true"}](#width) (integer or string) –
    代码块高度，当这个高度可显示的行数比lines指定的值大才会生效，可在设置界面更改。
-   `rss_width`{inline="true"} (integer or string) –
    代码块在RSS输出时的宽度，可在设置界面更改。
-   [`theme`{inline="true"}](#theme) (string) – 代码块颜色风格 (default,
    blackboard, dawn, mac-classic, twitlight,
    vibrant)，可在设置界面更改。
-   [`inline`{inline="true"}](#inline) (boolean) –
    内嵌模式开关，用于将一行代码插入到文本中。
-   [`strict`{inline="true"}](#strict) (boolean) – 严格模式的开关。
-   [`nowrap`{inline="true"}](#nowrap) (boolean) –
    当值指定为false时，过长的行将会被自动换行，以避免出现横向滚动条。
-   [`noborder`{inline="true"}](#noborder) (boolean) –
    是否显示边框的开关。
-   [`no_cc`{inline="true"}](#no_cc) (boolean) –
    当值为true时，code标签将会被解析，但代码块不会有格式。
-   `class`{inline="true"} (string) – 添加一个新的CSS。
-   `escaped`{inline="true"} (string) –
    当值为false，代码块里的html转义字符不会被转义，如[cc
    inline="true"]\<[/cc]不会转义为\<，默认为false。

### lang

[cc strict="true" theme="twitlight"]
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{lang="java"}
[/cc]

` package dourok.info.test;`{lang="java"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }

### tab\_size

tab\_size替换制表符的空格数，下面是1的例子。
` package dourok.info.test;`{strict="true" theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{tab_size="1"
lang="java"}

### line\_numbers

line\_numbers显示行号的开关： ` package dourok.info.test;`{strict="true"
theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
` package dourok.info.test;`{line_numbers="true" lang="java"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }

### first\_line

first\_line第一行的行号数，下面是first\_line="3"的例子：
` package dourok.info.test;`{strict="true" theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{first_line="3"
lang="java"}

### highlight

highlight模式，高亮代码段中的某几行，如例子 highlight="1,5"
高亮行数以半角逗号分隔： ` package dourok.info.test;`{strict="true"
theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{highlight="1,5"
lang="java"}

### no\_links

当no\_links为false时会为一下关键字添加一个到官方文档的链接，默认为false，下面是no\_links=true的例子，System没了链接：
` package dourok.info.test;`{strict="true" theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
no\_links有个BUG，当我在这个代码块指定为true时，后面的代码块也没了链接。
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{no_links="true"
lang="java"}

### lines

lines作者说明是显示固定行数,多于这个行数便会出现纵向滚动条,实际实验当指定行数小于代码行数时,代码块变成成为固定行数(该行数可在CodeColorer里面更改),而无论实际代码多少行.应该是bug.不过将lines="-1"去掉纵向滚动条还是有效的
` package dourok.info.test;`{strict="true" theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{no_links="false"
lines="5" lang="java"}

### width

width 指定代码块的宽度,多于这个宽度会出现横向滚动条 height
指定代码块的高度,单位是像素.当这个值比lines大时才会生效 width= "217"
height= "217" ` package dourok.info.test;`{strict="true"
theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } } ` package dourok.info.test;`{lines="1"
width="217" height="217" lang="java"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }

### theme

` package dourok.info.test;`{strict="true" theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{theme="dawn"
lang="java"}

### inline

inline模式,为true时去掉代码块，主要用来把代码内嵌到文本中，inline模式的默认主题跟一般模式是分开的，如下例子，详见设置页面。
` package dourok.info.test;`{strict="true" theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{inline="true"
lang="java"}

### strict

strict
严格模式(strict-mode)的开关,不大清楚什么意思?根据下面的例子理解下或者看下这里的[说明](http://qbnz.com/highlighter/geshi-doc.html#using-strict-mode)
strict="false" ``{strict="false" lang="php"} strict="true"
``{strict="true" lang="php"}

### nowrap

nowrap自动换行的开关,默认是不换行(nowrap="true"),当代码宽度超过代码块宽度时,会出现横向滚动条.
下面的例子是nowrap="false"的情形
` package dourok.info.test;`{strict="true" theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("This is a very very very very very very very very
very very very very very very very very very very very very very very
very very long String"); } }
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("This is a very very very very very very very very very very very very very very very very very very very very very very very very long String"); } } `{nowrap=""
lang="java"}

### noborder

noborder 是否显示边框的开关 ` package dourok.info.test;`{strict="true"
theme="twitlight"}

public class Main { public static void main(String args[]){
System.out.println("WTF"); } }
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{noborder="true"
lang="java"}

### no\_cc

no\_cc 是否高亮关键字,实际测试是取消codeColorer的效果,例子如下
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{strict="true"
theme="twitlight" lang="xml"}
` package dourok.info.test; public class Main { public static void main(String args[]){ System.out.println("WTF"); } } `{no_cc="true"
lang="java"}

短标签(Short Codes)
-------------------

上面提过可以用

    [cc]

来代替

，可以避免使用code标签。作者还提供了跟简洁的语法

    [ccMODE_LANG]

来定义代码块。LANG就是指定语法高亮的语言，MODE可以是下面几个模式的一个或多个：

-   i – inline
-   e – escaped
-   s – strict
-   n – line\_numbers
-   b – no\_border
-   w – no\_wrap
-   l – no\_links

模式分大小写，小写表示打开，相应的大写表示关闭，比如

    [cciL_java]

就如同

，注意关闭标签要一致

    [/cciL_java]

，当然后面还可以再带属性。最后再看下实际的例子：

[cc theme="twitlight"][ccsW
theme="dawn"]` package dourok.info.test;`{nowrap="" lang="java"}

public class Main { public static void main(String args[]){
System.out.println("This is a very very very very very very very very
very very very very long String"); } } [/ccsW][/cc]

[ccsW\_xml theme="dawn"]` package dourok.info.test;`{nowrap=""
lang="java"}

public class Main { public static void main(String args[]){
System.out.println("This is a very very very very very very very very
very very very very long String"); } } [/ccsW\_xml]

如果要显示

，就得用短标签将其包围起来，如果要显示短标签

    [cc][/cc]

就得用不同的短标签将其包围起来。不知这样说的够明白没。
