module ApplicationHelper
    def social_share_link(platform, article_title, article_url)
      encoded_title = CGI.escape(article_title)
      encoded_url = CGI.escape(article_url)
  
      case platform
      when :twitter
        "https://twitter.com/intent/tweet?text=#{encoded_title}&url=#{encoded_url}"
      when :facebook
        "https://www.facebook.com/sharer/sharer.php?u=#{encoded_url}"
      when :whatsapp
        "https://api.whatsapp.com/send?text=#{encoded_title} #{encoded_url}"
      else
        "#"
      end
    end
  end
  