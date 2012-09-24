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

  it "should return a url for an email" do
    subject.new.gravatar("nat@natwelch.com").should ==
      "http://www.gravatar.com/avatar/229e3746f6f5100c1d7d5d7a8a5b82d5?default=identicon"
  end

  it "should pull the hashes out of text" do
    e = Entry.new
    e.text = "test post #withhash"
    e.email = "test@gmail.com"
    e.save

    subject.new.hashes("test@gmail.com").should == [ '#withhash' ]
  end
end
