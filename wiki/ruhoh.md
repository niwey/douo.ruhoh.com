### ruhoh ###

这里也许会成为我第一篇ruhoh的博客，先罗列一下常用的命令吧。

    rackup -p 9292  # 启动web服务再 9292端口
	ruhoh page about.md  #创建一个页面，支持子目录 
	ruhoh post "The Greatest Post Ever" #通过标题创建文章，将会生成 the-greatest-post-ever.md
	ruhoh draft #快速建立一个草稿，生成untitled-draft-1.md 
	ruhoh titleize #快速为草稿文件命名

后台

    http://localhost:9292/dash


将 ruhoh 打造成一个个人的 blog ，知识管理系统 （类wiki），日记。
因为要要作为日记使用，还需要提供类似 evernote 的加密方案。


### 评论 ###

ruhoh 用 widgets 實現。內置支持disqus。

我的目的是實現，ruhoh 和  wordpress 的相同篇文章共用一個評論。disqus
提供了這種可能性
[Why are the same comments showing up on multiple pages?] wordpress 的
disqus 插件使用了 文章的post\_id 和 guid 作爲 disqus\_identifier ，模
式如下

	post_id + ' ' + guid

所以在 wp\_to\_ruhoh 里，我就這兩個屬性也保留下來。但是 ruhoh 的
widget 不能訪問 page 的數據（吭爹呀），見 [issue52][]。所以只能把代碼
放到 theme 的 layout 里。如下:

    <div id="disqus_thread"></div>
            <script type="text/javascript">
                /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO
            YOUR WEBPAGE * * */
                var disqus_title = '{{page.title}}';
                var disqus_identifier ='{{page.postid}} {{page.guid}}';
                var disqus_shortname = 'doousblog'; // required: replace example with your forum shortname
    
                /* * * DON'T EDIT BELOW THIS LINE * * */
                (function() {
                    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                    dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
                    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                })();
            </script>
            <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
            <a href="http://disqus.com" class="dsq-brlink">comments
                powered by <span class="logo-disqus">Disqus</span></a>

	

[issue52]: https://github.com/ruhoh/ruhoh.rb/issues/52

[Why are the same comments showing up on multiple pages?]: http://help.disqus.com/customer/portal/articles/662547-why-are-the-same-comments-showing-up-on-multiple-pages-

