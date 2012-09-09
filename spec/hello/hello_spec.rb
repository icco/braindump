require File.dirname(__FILE__) + "/../spec_helper.rb"

describe "get '/hello'" do
  it "should display hello world" do
    get '/hello'
    last_response.body.should == "Hello world."
  end
end
