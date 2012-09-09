Braindump.controllers :"api/1.0" do
  get :index do
    "Braindump API v1.0"
  end

  post :new, :provides => :json do
    if !valid_email? params[:email]
      return { :status => :fail, :why => "Invalid email address." }.to_json
    end

    # TODO(natwelch): validate the incomming params yo!
    e = Entry.new
    e.text = params[:text]
    e.email = params[:email]
    e.save

    return { :status => :success, :entry => e.to_json }.to_json
  end
end
