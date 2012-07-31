# Helper methods defined here can be accessed in any controller or view in the application

Braindump.helpers do
  def fmt_date datetime
    return datetime.strftime('%c')
  end

  def gravatar email
    options = {
      #:default => '/images/default_gravatar.png'
      :default => :identicon
    }
    url = Gravatar.new(email).image_url(options)
    return url
  end

  def h text
    # Link links
    out = out.gsub( %r{http(s)?://[^\s<]+} ) { |url| "<a href='#{url}'>#{url}</a>" }

    # Link Twitter Handles
    out = out.gsub(/@(\w+)/) {|a| "<a href=\"http://twitter.com/#{a[1..-1]}\"/>#{a}</a>" }

    # Link Hash tags
    out = out.gsub(/#(\w+)/) {|hash| link_to hash, url(:hash, :index, hash[1..-1]) }

    return out
  end
end
