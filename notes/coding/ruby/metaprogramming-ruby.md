---
title: Metaprogramming Ruby
date: '2012-11-22'
description:
---

所谓元编程

> Metaprogramming is writing code that writes code.



### The Object Model

#### Open Classes


**class** 关键字并不仅仅是声明一个类，可以把他想象成打开了这个类的上下文，便可在这个区域内定义这个类的方法。
	
	### 所以这样的代码也就可理解的了
    3.times do
	  class C
	    puts "Hello"
	  end
    end
    
    ### output
    Hello
    Hello
    Hello

使用 **class**的时候，如果这个类还不存在，则Ruby会声明这个新类。如果已经存在，则是重新打开他，而不是重新定义这个类。

    class D
      def x; 'x'; end
    end
    
    class D
      def y;'y'; end
    end
    
    obj = D.new
    obj.x # => "x"
    obj.y # => "y"

所以在Ruby运行时中也可以重新打开任意一个已存在的类，包括标准类库，然后可以更改它。

使用Open Class 的时候要注意别不小心覆盖掉已经存在的方法。

##### Monkey Patch

**monkey patch** 就是指在运行时更改某个类的结构。https://en.wikipedia.org/wiki/Monkey_patch 。**monkey patch** 是个贬义词？

#### The Truth About Classes

类的实例变量，跟这个类没有关系，实例变量只在这个类的对象中，一旦对实例对象赋值了它才存在

    obj.instance_variables
	
