module ShoutHelper
  def like_button(shout)
    if current_user.liked?(shout)
      button_to "Unike", unlike_shout_path(shout), method: :delete
    else
      button_to "Like", like_shout_path(shout), method: :post
    end
  end

  def autolink(text)
    text.gsub(/@\w+/) do |mention|
      return text if User.find_by(username: mention.delete("@")).nil?
      link_to mention, user_path(mention[1..-1])
     end.html_safe
  end
end
