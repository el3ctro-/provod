xml.instruct! :xml, :version => "1.0", "xmlns:media" => "http://search.yahoo.com/mrss/"

xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Provod"
    xml.description "Links, Comments, etc"
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.author @users.find_by_id(post.user_id).name 
        xml.description post.words
        xml.pubDate post.updated_at.to_s(:rfc822)
        xml.enclosure url: "http://provot.s3-us-west-1.amazonaws.com#{post.picture}", type:"image/jpeg"
        xml.link post_url(post)
      end
    end
  end
end