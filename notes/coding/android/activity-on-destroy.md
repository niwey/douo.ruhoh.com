---
title:  activity on destroy
date: '2012-08-18'
description:
---

为什么在低内存的时候，

ondestroy 没被调用 activity 就被杀死

Intent 却被保留

Application 也没有提示被终结


lifecycle
=========

## Activity ##

onCreat 
	
-onStart   						 
|--onRestoreInstanceState
|
|--onPostCreate 在onRestoreInstanceState后调用，接收savestate参数
|  	   	   	   	  	
|-onResume 	   
|--onPostResume	在这个状态，activity已经是可见的了，所有ui布局应该完成	
+--------- 	   	
|  	   		   
|-onPause	   	
|--onSaveInstanceState
|					  
|onStop
|onRetainNonConfigurationInstance  暂时保留引用。
onDestroy


其他：
onUserLeaveHint 当activity由用户操作进入stop状态时，会调用这个方法，书中说在用户按back 或home 键会调用，在sense4.0 真机上只有home会调用。这个方法是个清除dialog的好地方


## Fragment ##


## Activity 生命周期与用户体验 ##

data up-to-date in a database


### Intent Flag

#### FLAG_ACTIVITY_CLEAR_TOP

SINGLE_TOP newIntent
