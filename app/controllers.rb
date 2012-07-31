Braindump.controllers  do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index do
    if session[:email]
      @entries = Entry.where(:email => session[:email]).order("updated_at DESC")
      erb :index
    else
      erb :login
    end
  end

  post :login do
    session[:email] = params[:email]

    redirect '/'
  end

  get :logout do
    session[:email] = nil

    redirect '/'
  end

  get '/css/style.css' do
    content_type 'text/css', :charset => 'utf-8'
    less :style
  end

  get :id, :with => :uuid do
    Entry.where(:uuid => params[:uuid]).to_json
  end

  post :index do

    if session[:email].nil?
      error 403
    end

    e = Entry.new

    if params[:uuid]
      e.uuid = params[:uuid]
    end

    e.text = params[:text]
    e.email = session[:email]
    e.save

    redirect '/'
  end
end
