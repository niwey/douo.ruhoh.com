### ruhoh ###

看 ruhoh 的代码第一句就看不懂了。。。

	$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

`$:` 是 ruby 的 load path ，是一个数组对象，unshift 则是将对象插入到数组头部。File.join 将参数列表返回成路径 ，如
	
	File.join("usr", "mail", "gumby")   #=> "usr/mail/gumby"

`*%w[.. lib]`，`%w[foo bar]` 等同于 `["foo","bar"]` ，`%w` 允许你不用引号和分号来创建数组，是ruby [%表示法][]的一种。而`*`在数组作为参数的时候用来拆开数组。如 `f(*[a,b,c]) => f(a,b,c)` ，相同的 `f(*a)` 就是表示可变参数。

所以上面代码的意思就是将 `./../lib` 加入到 load path



[%表示法]: http://www.kuqin.com/rubycndocument/man/syntax_literal.html#a.25.b5.ad.cb.a1

