module BraindumpHelpers
  def fmt_date datetime
    return datetime.strftime('%D %R')
  end

  def gravatar email
    options = {
      #:default => '/images/default_gravatar.png'
      :default => :identicon
    }
    url = Gravatar.new(email).image_url(options)
    return url
  end

  # Does nice things to text
  def h text
    # Link links
    out = text.gsub( %r{http(s)?://[^\s<]+} ) { |url| "<a href='#{url}'>#{url}</a>" }

    # Link Twitter Handles
    out = out.gsub(/@(\w+)/) {|a| "<a href=\"http://twitter.com/#{a[1..-1]}\"/>#{a}</a>" }

    # Link Hash tags
    out = out.gsub(/#(\w+)/) {|hash| link_to hash, url(:hash, hash[1..-1]) }

    return out
  end

  # Renders Markdown.
  def m text
    markdown = RDiscount.new text
    return markdown.to_html
  end

  # Stolen from http://my.rails-royce.org/2010/07/21/email-validation-in-ruby-on-rails-without-regexp/
  def valid_email? email
    begin
      m = Mail::Address.new(email)
      # We must check that value contains a domain and that value is an email address
      r = m.domain && m.address == email
      t = m.__send__(:tree)
      # We need to dig into treetop
      # A valid domain must have dot_atom_text elements size > 1
      # user@localhost is excluded
      # treetop must respond to domain
      # We exclude valid email values like <user@localhost.com>
      # Hence we use m.__send__(tree).domain
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue Exception => e
      r = false
    end

    return r
  end
end

# We need to do this since we want to make our helpers testable.
Braindump.helpers BraindumpHelpers
