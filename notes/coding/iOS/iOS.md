---
title: iOS
date: '2012-08-11'
description:
---

### strong weak ###

automatic reference counting

不同於垃圾收集機制，當對象失去最後一個strong 指針，就會馬上被釋放，沒有延遲。


### Foundation 框架 ###

### NSObject

所有對象的基類

### NSString

Unicode 編碼的任意語言的字符串

在ios 中代替 c 語言的char *

immutable

#### 连接字符串



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

	//遍历 key 和 value
	NSEnumerator *enumerator = [dic keyEnumerator];
    id key;
    NSLog(@"%@",template);
    while ((key = [enumerator nextObject]))
    {
		NSLog(@">>>>>>>>>@@@>>>%@:%@", key,[dic valueForKey:key]);
    
    }

### NSSet

不可變的無序集合
不同同時保存兩個相同的對象

### NSMutableSet

### NSOrderedSet

NSSet + NSArray 有序不能有重複對象

### NSMutableOrderedSet

### 枚舉 
### Property List ####

NSArray ， NSDictionary，NSNumber，NString，NSDate，NSData

#### NSUserDefaults ####

只能存放 Property List 的輕量數據庫

類似 Android 的 sharedperference  








