---
title: Objective-C
date: '2012-11-02'
description:
---


### 类声明

### 程序入口

### 静态成员

### 实例成员

### 变量修饰符


- 运行时系统
- 内存管理


与java相同的实例变量作用域

	@private

	@protected

	@public

	@package


### id

id 是对象的标识符，类似于 java 中的 Object 

id 为一个 objc_object 的结构指针

	typedef struct objc_object {
		Class isa;
	} *id;
	
所以每个对象都有一个 isa 变量

### 方法调用

`[receiver message]`

`[nil message]`  向nil发送消息将返回nil。
*TODO*

### Dot Syntax

`.` 操作符可以用来访问对象的accessor methods ，即java 中实例变量的get
方法。

	self.age = 10;
	
等于

	[self setAge:10];
	
如果没有用 `self.`, 将自己访问实例变量本身。下面例子中, age 的 set 并
没有被调用

	age = 10;
	

### 类

	myRectangle = [[Rectangle alloc] init];
	
*TODO*

#### 声明

分为 接口声明 .h

	@interface ClassName : ItsSuperclass
		// Method and property declarations.
	@end

和实现 .m

	@implementation ClassName
	{
		// Instance variable declarations.
	}
	// Method definitions.
	@end


#### 属性（property）声明


	@property (attributes) Type propertyName;

*TODO*

### 协议 代理 类别

### 常量



- 使用c的预处理#define来设置常量。
- const关键字

	常量也是大小写混排的驼峰命名规则，首字母小写，另外，第一个字母是k。
	
http://marshal.easymorse.com/archives/4149


