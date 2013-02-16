---
title:  Ruby
date: '2012-09-20'
description:
---
### ruby ###

松本行弘设计的面向对象脚本语言。接触到新语言一般都先看一下维基，然后再 stackoverflow 上搜搜看怎么入门，[What is the best way to learn ruby][]

[What is the best way to learn ruby]: http://stackoverflow.com/questions/6806/what-is-the-best-way-to-learn-ruby

ruby 的输入是 puts

irb 是ruby的交互 shell

ruby 的语法糖很多，记起来真麻烦

### 编码风格 & 规范

[Ruby ＆ Rails 风格指导][] 提供了一份相当详细的编码风格指导。这里记录一些要点。

- for 并没有包含一个新的视野(不像是 each ）而在这个区块中定义的变量将会被外部所看到。
- 不要忘了`unless`，但是如果需要用到`else`就不要用`unless`了。

布尔表达式使用 `&&/||`，控制流程使用 `and/or`。 （经验法则：如果你需要使用外部括号，你正在使用错误的操作符。）

    # 布尔表达式
    if some_condition && some_other_condition
      do_something
    end
    
    # 控制流程
    document.saved? or document.save!

#### 注解
	
- 使用 `TODO` 来标记之后应被加入的未实现功能或特色。

- 使用 `FIXME` 来标记一个需要修复的代码。

- 使用 `OPTIMIZE` 来标记可能影响效能的缓慢或效率低落的代码。

- 使用 `HACK` 来标记代码异味，其中包含了可疑的编码实践以及应该需要重构。

- 使用 `REVIEW` 来标记任何需要审视及确认正常动作的地方。

如:
`REVIEW: 我们确定用户现在是这么做的吗？`

#### Struct.new

考虑使用 Struct.new，它替你定义了那些琐碎的存取器（accessors），建构式（constructor）以及比较操作符（comparison operators）。

    # 好
    class Person
      attr_reader :first_name, :last_name
    
      def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
      end
    end
    
    # 较佳
    class Person < Struct.new (:first_name, :last_name)
    end

#### 正则表达式

针对复杂的正則表示法，使用 x 修饰符。这让它们的可读性更高并且你可以加入有用的注释。只是要小心忽略的空白。

    regexp = %r{
      start # 一些文字
      \s # 空白字元
      (group) # 第一组
      (?:alt1|alt2) # 一些替代方案
      end
    }x

针对复杂的替换，sub 或 gsub 可以与区块或哈希来使用。

对于有多个 `/` 字元的正则表达式，可以用 `%r`。

	%r(^/blog/2011/(.*)$)

[Ruby ＆ Rails 风格指导]: http://guides.ruby.tw/ruby-rails-style-guides/zhCN/

#### 变量与函数的命名规则

乍看之下与Perl的命名规则有些类似，不过Perl的命名用来区分标量、数组与映射；而Ruby的命名规则用来表示变量与类型的关系。Ruby的变量有以下几种：

一般小写字母、下划线开头：变量（Variable）。

- $开头：全局变量（Global variable）。
- @开头：实例变量（Instance variable）。
- @@开头：类变量（Class variable）类型变量被共享在整个继承链中
- 大写字母开头：常数（Constant）。

有些函数则会加一个后缀，用来表示函数的用法，跟变量命名规则不同，函数的命名规则只是习惯，不具强制性，即使你不照规则命名也不影响程序运作

- =结尾：赋值方法，相当于其他编程语言的set开头的方法，算是一种语法蜜糖。
- !结尾：破坏性方法，调用这个方法会修改本来的对象，这种方法通常有个非破坏性的版本，调用非破坏性的版本会回传一个对象的副本。
- ?结尾：表示这个函数的回传值是个布尔值。

方法

    
    def h(name)
		puts "Hello #{name} !"
    end

	#可变参数
	def add(*numbers)
		numbers.inject(0) { |sum, number| sum + number }
	end

方法调用

    method("kid")
	method "kid"

类

    class Greeter
    	def initialize(name = "world)
    		@name = name
    	end
    	def say_hii
    		puts "Hi #{@name}!}"
    	ends

@name 表示类的实例变量


ruby 中都是对象，都是方法

	#这两行代码是一致的
	1.+(2) 
	1 + 2 


条件判断

    if
    elsif
    else
      

**<<** 用于向数组中添加元素 push 方法也有同样的作用

转换：

	[1,2].map {|i| i+1}
	# [2,3]
	
过滤	
	
	[1,2,3,4].select {|i| i%2==0}
	# [2,4]
	
	[1,2,3,4].delete_if {|i| i%2==0} 
	# [1,3] 直接修改数组


{} hash 字典


string

单引号和双引号创建的字符串不一样

### 正则表达式 ###

ruby 的 gsub sub 反斜槓 太噁心人了。

"<script type=\"math/tex\">#{res['content']}</script>".gsub('\\\\','\\\\\\\\\\\\\\\\').gsub('_','\_').gsub('&amp;','&')


### %Q, %q, %W, %w, %x, %r, %s

%Q
This is an alternative for double-quoted strings, when you have more quote characters in a string.Instead of putting backslashes in front of them, you can easily write:

    >> %Q(Joe said: "Frank said: "#{what_frank_said}"")
    => "Joe said: "Frank said: "Hello!"""

The parenthesis “(…)” can be replaced with any other non-alphanumeric characters and non-printing characters (pairs), so the following commands are equivalent:

    >> %Q!Joe said: "Frank said: "#{what_frank_said}""!
    >> %Q[Joe said: "Frank said: "#{what_frank_said}""]
    >> %Q+Joe said: "Frank said: "#{what_frank_said}""+

You can use also:

    >> %/Joe said: "Frank said: "#{what_frank_said}""/
    => "Joe said: "Frank said: "Hello!"""


%q
Used for single-quoted strings.The syntax is similar to %Q, but single-quoted strings are not subject to expression substitution or escape sequences.

    >> %q(Joe said: 'Frank said: '#{what_frank_said} ' ')
    => "Joe said: 'Frank said: '\#{what_frank_said} ' '"


%W
Used for double-quoted array elements.The syntax is similar to %Q

    >> %W(#{foo} Bar Bar\ with\ space)
    => ["Foo", "Bar", "Bar with space"]


%w
Used for single-quoted array elements.The syntax is similar to %Q, but single-quoted elements are not subject to expression substitution or escape sequences.

    >> %w(#{foo} Bar Bar\ with\ space)
    => ["\#{foo}", "Bar", "Bar with space"]


%x
Uses the ` method and returns the standard output of running the command in a subshell.The syntax is similar to %Q.

    >> %x(echo foo:#{foo})
    => "foo:Foo\n"


%r
Used for regular expressions.The syntax is similar to %Q.

    >> %r(/home/#{foo})
    => "/\\/home\\/Foo/"


%s

Used for symbols.It’s not subject to expression substitution or escape sequences.

    >> %s(foo)
    => :foo
    >> %s(foo bar)
    => :"foo bar"
    >> %s(#{foo} bar)
    => :"\#{foo} bar"

### Date

#### DateTime 与 Time 的区别

见这个[讨论](http://stackoverflow.com/questions/1261329/whats-the-difference-between-datetime-and-time-in-ruby)

上面未提到，DateTime比Time多了一些日历相关的API。





### 其他资料 ###

终结的非常好的 slide

http://saito.im/slide/ruby-new.html


