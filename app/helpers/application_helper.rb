module ApplicationHelper

  def gravatar_url(email, size)
      gravatar_id = Digest::MD5::hexdigest(email).downcase
      default_url = "http://www.icon2s.com/img256/256x256-black-white-android-user.png"
      url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}?s=#{size}"
  end

end
