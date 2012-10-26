### ruby ###

松本行弘设计的面向对象脚本语言。接触到新语言一般都先看一下维基，然后再 stackoverflow 上搜搜看怎么入门，[What is the best way to learn ruby][]

[What is the best way to learn ruby]: http://stackoverflow.com/questions/6806/what-is-the-best-way-to-learn-ruby

ruby 的输入是 puts

irb 是ruby的交互 shell

ruby 的语法糖很多，记起来真麻烦

### 变量与函数的命名规则 ###

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



### 其他资料 ###

终结的非常好的 slide

http://saito.im/slide/ruby-new.html
