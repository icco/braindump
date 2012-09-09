Braindump.controllers :"api/1.0" do
  get :index do
    "Braindump API v1.0"
  end

  post :new, :provides => :json do

    # TODO(natwelch): validate the incomming params yo!
    e = Entry.new
    e.text = params[:text]
    e.email = params[:email]
    e.save

    { :status => :success, :entry => e.to_json }.to_json
  end
end
