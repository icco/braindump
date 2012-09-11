require File.dirname(__FILE__) + "/../spec_helper.rb"
require File.dirname(__FILE__) + "/../../app/helpers.rb"

describe "BraindumpHelpers" do
  subject do
    Class.new { include BraindumpHelpers }
  end

  it "should render basic Markdown" do
    output = subject.new.m "# heading"
    output.should == "<h1>heading</h1>\n"
  end
end
