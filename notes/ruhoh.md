---
title: ruhoh
date: '2013-01-21'
description:
---

DB 现在都是懒性加载

### Resources

resources 有八个模块

- collection
- collection_view
- model
- model_view
- client
- compiler
- watcher
- previewer


#### client

生成命令参数，非必须。

#### watcher

用于在preview的时候实时监听文件改动

```
watchers.each {|watcher|
            next unless watcher.match(path)
            watcher.update(path)
            Ruhoh::Friend.say {
              yellow "Watch [#{Time.now.strftime("%H:%M:%S")}] [Update #{path}] : #{args.size} files changed"
            }
```

#### previewer

 Rack application used to render singular pages via their URL.
 
#### compiler


