require File.dirname(__FILE__) + "/../spec_helper.rb"

# Taken from http://stackoverflow.com/a/10585921/1063
describe "get '/hello'" do
  it "should display hello world" do
    get '/hello'
    last_response.body.should == "Hello World."
  end

  it "should be running in the test env" do
    Padrino.env.should == :test
  end
end
