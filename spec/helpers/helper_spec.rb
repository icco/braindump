require File.dirname(__FILE__) + "/../spec_helper.rb"

describe "m" do
  it "should render basic Markdown" do
    output = m "# heading"
    output.should == "<h1>heading</h1>"
  end
end
