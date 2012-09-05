---
date: '2010-04-22'
layout: post
title: Java Me读取本地文件(JSR 75)
tags:
- FileConnection
- J2ME
- J2ME文件系统
- JSR 75
categories:
- coder
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  dsq_thread_id: '796842379'
postid: '8'
guid: http://dourok.info/?p=8
---
### FCOP (File Connection optional package) JSR 75

一个file协议URL的例子 file:///xxxx.txt
为什么有3个斜线(/)呢?前两个斜线的作用是将file协议与文件路径分开.第2跟第3斜线之间的区域保留给要操作的对象的主机名使用;在前面的示例中,因为主机名就是本地主机,所以省略为空,也可以是file://localhost/xxxx.txt

### 使用FCOP时,一般的操作顺序.

1.  判断运行应用程序的设备上是否有FCOP。
    System.getProperty("microedition.io.file.FileConnection.version");
2.  从Connector类得到FileConnection实例。
    (FileConnection)Connector.open("file:////xxxx.txt",Connector.READ);
3.  如果有必要，就创建文件。 create 创建文件 mkdir 创建目录
4.  打开文件进行读写操作，分别得到输入或输出流。
    openInputStream() openDataInputStream()
    openOutputStream() openDataOutputStream()
5.  使用得到的流执行输入和输出。
6.  关闭流。
7.  关闭FileConnection. close()

### wtk模拟器的文件系统

这里要说明一点，就是就是wtk模拟器的文件系统(FilesSystem)。我们在DefaultColorDevice上调用FileSystemRegistry.listRoots();一般都只会等到一个root1/文件夹。是模拟器的文件系统是绑定在本地目录的。运行模拟器时，NetBeans上的控制台，EclipseME也有，会打印出
Running with storage root C:2mewtk.5.2.DefaultColorPhone162
实际在这个目录下有个filesystem文件。打开就会发现root1
文件夹了。如果不想每次运行都生成一个新的文件夹，可删除
C:2mewtk.5.2 in.use 文件。 关于这个官方有这样一个描述：

> **Local Files and Personal Information** The J2ME Wireless Toolkit
> supports JSR 75, the PDA Optional Packages for the J2ME Platform,
> which also includes two independent APIs:
>
> -   The FileConnection API gives MIDlets access to a local file system
>     on the device.
> -   The Personal Information Management (PIM) optional package
>     includes APIs for manipulating contact lists, calendars, and to-do
>     lists.
>
> A real device may have a local file system which can be accessed using
> the FileConnection API. In the J2ME Wireless Toolkit emulator, a
> simulated file system is maintained as a directory on your hard disk.
> The files your application can access using FileConnection are stored
> in subdirectories of \<toolkit\>&lt;*skin*\>., where \<*toolkit*\> is
> the installation directory of the J2ME Wireless Toolkit and \<*skin*\>
> is the name of the emulator skin. For example,
> the DefaultColorPhone emulator skin comes with a root directory
> installed called root1, which contains a file called Readme. The
> file's full path is \<*toolkit*\>1. You can manage the root
> directories that are available by choosing **MIDlet \> External
> events** from the emulator window's menu. You'll see a small utility
> window for adding and removing roots. These actions will also generate
> events for a registered listener object.

E文不好，不解释。

### FileConection的一些方法

-   canRead  可读属性
-   canWrite 可写属性
-   directorySize 返回目录占用的字节数，如果传递参数为true，则计算上子目录
    fileSize 返回文件占用的字节数
-   getName 返回文件的名称
-   getPath 返回文件所在的目录，[file:///a/b/c](file:///\\a\b\c) 则返回
    /a/b/ ，记住不包括file:// 协议名称
-   getURL 返回路径和文件名称，包括file://
-   isDirectory 是否是目录
-   isHidden 是否可见
-   isOpen  如果FileConnection 已打开，返回true
-   设置文件属性的方法 setHidden setReadable setWritable
-   truncate 将文件截断为指定长度

### 删除文件或目录

delete方法，此方法会立即删除指定的文件或目录，并关闭所有与之关联的流。FileConnection
仍然为打开状态。

### 枚举目录内容

list方法；该返回目录内容的枚举类型(Enumeration)。List方法，还可以接受参数，包括通配字符串跟是否包含Hidden文件的boolean参数。
请注意：如果想要操作Enumeration返回的文件或目录，可以不需要重建FileConnection。向SetFileConnection()方法传入Enumeration中的字符串。就会重设FileConnection，使其指向新的目录或文件。

### 文件系统监听器

FileSystemRegistry
有addFileSystemListener方法。可通过向这个方法传递一个FileSystemListener接口的实例，来监听文件系统。
FileSystemListener只有一个 rootChanged(int state String rootname)方法
还有两个常量 ROOT\_ADDED 、 ROOT\_REMOVED 表示移除还是添加文件。
如上文的引用所说，wtk模拟器可以通过**MIDlet \> External
events****的****File Connection**来触发监听器。

### 结束之前

用wtk
的模拟器默认读写文件的权限是每次询问，测试程序的时候觉得很烦的话，可以用ktoolbar来修改。选项在Edit\>\>preference\>\>Security将Security
Domain修改为maximum便可。ktoolbar在 wtk的安装目录/bin/ktoolbar.exe

还有注意一点，如果用户不允许应用程序访问文件系统。访问文件的方法会抛出SecurityException。

### 参考文献

RayRischpaer 著 杨越 等译 2009 人民出版社 Java ME基础教程
