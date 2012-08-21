---
title: ios 筆記
date: '2012-08-11'
description:
categories:
---

### strong weak ###

automatic reference counting

不同於垃圾收集機制，當對象失去最後一個strong 指針，就會馬上被釋放，沒有延遲。


### nil ### 

nill  = 0

所有synthesize 的實體變量都是nil

if(obj)  可以判斷是否爲nil

向nil發送消息，不會導致異常，實際上沒有任何代碼被執行。
如果方法有返回值，那他將返回 0

    int i = [obj methodWhichReturnsAnInt]  // 如果 obj爲nil，那麼i將等於0
	
### BOOL ###

objc 的布爾類型，實際是用了typedef
NO 等於 0 ，YES 爲非零

### 類方法 vs 實例方法 ###

**Struct 和 Object 的區別**

### 聲明 ###

    - (BOOL) isRignt; // 實例方法，以 *-* 開始
    
    + (id)alloc;  //類方法，以*+* 開始

### 作用 ###

類方法主要就是爲創建對象和工具方法使用

### 調用 ###

    [<pointer to instance> method]; //實例方法
    [Class method]; //類方法
	[[instance class] method] //調用instance 的類方法
	
self/super  同 java 的 this/super

### 實例化 ###

數組中的元素都是strong 

[[NSMutableArray alloc] init] ; //alloc 是類方法，爲對象在堆上分配一個足夠大的空間。
                                               //init 初始化。 alloc 外面一定要加上 init 或initWith

NSString 有很多種init 方法
所有類必須爲子類提供一個初始化方法

init 方法應當返回 **id**

一個初始化的例句
    @implementation MyObject
    - (id) init{
    	self = [super init]; // self 只是一個本地指針
    	if(self){ 
    		// initialize our subclass here
    	}
    	return self;
    }
    @end

### Dynamic Binding (動態綁定) ###

固定類型，只是方便debug，固定類型和id在運行時是沒有區別的。

### Object Typing ###

跟java 有不少區別，找課件

isKindOfClass
isMemberOfClass
respondsToSelector

@selector() 將方法名轉換爲 selector

[obj respondsToSelector:@selector(method)]; 

selector 非常酷，更有面向函數語言的感覺了。

### Foundation 框架 ###

### NSObject

所有對象的基類

### NSString

Unicode 編碼的任意語言的字符串

在ios 中代替 c 語言的char *

immutable

### NSMutableString

mutable 的 NSString

### NSNumber

封裝了所有原生類型

### NSValue

封裝其他非對象數據

### NSData

二進制數據

### NSDate

時間

### NSArray

有序的對象集合，immutable

不能放 nil ，可以用NSNull 代替。

### NSMutableArray

Mutable 繼承  NSArray 

### NSDictionary

immutable hash 表

### NSMutableDiction

### NSSet

不可變的無序集合
不同同時保存兩個相同的對象

### NSMutableSet

### NSOrderedSet

NSSet + NSArray 有序不能有重複對象

### NSMutableOrderedSet

### 枚舉 ##
### Property List ####

NSArray ， NSDictionary，NSNumber，NString，NSDate，NSData

#### NSUserDefaults ####

只能存放 Property List 的輕量數據庫

類似 Android 的 sharedperference  








