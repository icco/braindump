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
      @uuids = Entry.select(:uuid).uniq.where(:email => session[:email])

      @entries = []
      @uuids.each do |uuid|
        @entries.push Entry.where(:uuid => uuid.uuid).order("updated_at DESC").first
      end

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
    @entries = Entry.where(:uuid => params[:uuid]).order("updated_at DESC")
    render :edit
  end

  get :hash, :with => :hashtag do
    params[:hashtag].inspect
  end

  post :edit, :with => :uuid do
    previous = Entry.where(:uuid => params[:uuid]).order("updated_at DESC").first

    if session[:email].nil?
      error 403
    elsif previous.email != session[:email]
      error 403
    end

    e = Entry.new
    e.uuid = params[:uuid] # Need to add some security here.
    e.text = params[:text]
    e.email = previous.email
    e.save

    redirect url(:id, params[:uuid])
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
