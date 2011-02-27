require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe Tongo::Parser do
  def compiled(src)
    Tongo::Parser.new.compile(src)
  end
  
  it { compiled("Plain text").should      == [:multi, [:text, "Plain text"]] }
  it { compiled("<h1>Header</h1>").should == [:multi, [:html, "h1", {}, [:multi, [:text, "Header"]]]] }
  it { compiled("<tng:test />").should    == [:multi, [:empty, 'test', {}]]}
  it { compiled("<tng:upcase>test</tng:upcase>").should == [:multi, [:nested, 'upcase', {}, [:multi, [:text, 'test']]]] }
  it { compiled("%{my_method}").should    == [:multi, [:text, '%{my_method}']] }
  it do
    compiled("<body><p class=\"first\">Paragraph</p><p>Another</p></body>").should == 
    [:multi,
      [:html, 'body', {}, [:multi,
        [:html, 'p', {"class" => 'first'}, [:multi, [:text, 'Paragraph']]],
        [:html, 'p', {}, [:multi, [:text, 'Another']]]
      ]]
    ]
  end
  
  it { compiled("<img src=\"image.jpg\">").should == [:multi, [:html, 'img', {"src" => "image.jpg"}]] }
  it { compiled("<a href=\"/\">link</a>").should == [:multi, [:html, 'a', {"href" => "/"}, [:multi, [:text, 'link']]]] }
  it { compiled("<tng:loop times=\"3\">test</tng:loop>").should == [:multi, [:nested, 'loop', {"times" => "3"}, [:multi, [:text, 'test']]]] }
end

describe Tongo::Parser, "with a custom namespace" do
  it { Tongo::Parser.new(:ns => 'pop').compile('<pop:custom />').should == [:multi, [:empty, 'custom', {}]] }
end