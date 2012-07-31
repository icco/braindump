# An app for dumping your brain.
# @author Nat Welch - https://github.com/icco

configure do
  set :sessions, true
  DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/data.db')
end

get '/' do
  erb :index, :locals => { :entries => Entry.all }
end

get '/css/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  less :style
end

get '/id/:uuid' do
  Entry.filter(:uuid => params[:uuid]).first.to_json
end

post '/' do
  e = Entry.new

  if params[:uuid]
    e.uuid = params[:uuid]
  end

  e.text = params[:text]
  e.email = params[:email]
  e.create_date = Time.now
  e.save

  redirect '/'
end

class Entry < Sequel::Model(:entries)
  def before_create
    if self.uuid.nil?
      self.uuid = Entry.new_uuid
    end
  end

  def self.new_uuid
    # Only works in Ruby > 1.9.2
    # Returns 24 hex chars
    return SecureRandom.hex(24)
  end
end
