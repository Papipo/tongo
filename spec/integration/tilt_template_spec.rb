require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class CustomContext < Tongo::Context
  tag :text do
    'Some text here'
  end
end

describe "a .tng template" do
  before do
    @template = Tilt.new(File.join(File.dirname(__FILE__), 'fixtures', 'example.tng'))
  end
  
  it "should render the correct result" do
    @template.render(CustomContext.new).strip.should == "<strong>Some text here</strong>"
  end
end
