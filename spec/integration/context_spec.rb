require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class CustomContext < Tongo::Context
  tag :shout do
    'ARGH!'
  end
  
  tag :whisper do
    'shhh'
  end
  
  tag :upcase do |content|
    content.upcase
  end
  
  tag :loop do |attrs,content|
    number = (attrs['times'] || 1).to_i
    result = ''
    number.times { result << content }
    result
  end
end

describe Tongo::Context do
  before do
    @src = <<-SRC
      <h1 class="highlight">Header</h1>
      <ul>
        <tng:loop times="3">
          <li>Hello World</li>
        </tng:loop>
      </ul>
      <tng:shout />
      <strong><tng:shout /></strong>
      <em>%{whisper | upcase}, %{shout}</em>
    SRC
    
    @context = CustomContext.new
  end
  
  #Fixme indentation and extra lines
  it "should render the expected result" do
    Tongo::Template.new { @src }.render(@context).should == <<-RES
      <h1 class="highlight">Header</h1>
      <ul>
        
          <li>Hello World</li>
        
          <li>Hello World</li>
        
          <li>Hello World</li>
        
      </ul>
      ARGH!
      <strong>ARGH!</strong>
      <em>SHHH, ARGH!</em>
    RES
  end
end
