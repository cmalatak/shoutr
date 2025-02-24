module ShoutHelper
  def shout_form_for(content_type)
    form_for(Shout.new, url: content_type.new) do |form|
      form.fields_for(:content) { |content_form| yield(content_form) } +
      form.submit("Shout!")
    end
  end

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
