require 'nokogiri'
class Ruhoh
  module Compiler
    # This rss compiler is provided by David Long 
    # http://www.davejlong.com/ 
    # https://github.com/davejlong
    # Thanks David!
    # modified by Douo
    module Rss
      # TODO: This renders the page content even though we already need to
      # render the content to save to disk. This will be a problem when posts numbers expand. Merge this in later.
      def self.run(target, page)
        feed = Nokogiri::XML::Builder.new do |xml|
         xml.rss(:version => '2.0', 
                 'xmlns:dc' => "http://purl.org/dc/elements/1.1/"
                 ) {
           xml.channel {

             xml.title_ Ruhoh::DB.site['title']
             xml.link_ Ruhoh::DB.site['config']['production_url']
             xml.pubDate_ Time.now.strftime("%a, %d %b %Y %H:%M:%S %z")
             Ruhoh::DB.posts['chronological'].each do |post_id|
               post = Ruhoh::DB.posts['dictionary'][post_id]
               page.change(post_id)
               xml.item {
                 xml.title_ post['title']
                 xml.link "#{Ruhoh::DB.site['config']['production_url']}#{post['url']}"
                 xml['dc'].creator_ Ruhoh::DB.site['author']['name']
                 xml.pubDate_ Time.parse(post['date']).strftime("%a, %d %b %Y %H:%M:%S %z")
                 xml.description_ (post['description'] ? post['description'] : page.render_content)
               }
             end
           }
         }
        end
        File.open(File.join(target, 'rss.xml'), 'w'){ |p| p.puts feed.to_xml }
      end
    end #Rss
  end #Compiler
end #Ruhoh
