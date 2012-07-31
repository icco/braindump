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
    erb :index, :locals => { :entries => Entry.all }
  end

  get '/css/style.css' do
    content_type 'text/css', :charset => 'utf-8'
    less :style
  end

  get :id, :with => :uuid do
    Entry.filter(:uuid => params[:uuid]).first.to_json
  end

  post :index do
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
end
