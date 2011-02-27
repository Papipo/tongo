require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tongo::Generator do
  it { Tongo::Generator.new.send(:tokenize_text, '%{whisper}, %{shout}').should == ['', '%{whisper}', ', ', '%{shout}']}
  it { Tongo::Generator.new.send(:tokenize_text, 'normal text %{interpolation} more text').should == ['normal text ', '%{interpolation}', ' more text']}
  it { Tongo::Generator.new.send(:expand_interpolation, 'method | filter | more_filter').should == "\#{more_filter(filter(method()))}" }
  it { Tongo::Generator.new.send(:compile!, [:text, 'testing, %{method | filter | more_filter} stuff']).should == 'testing, #{more_filter(filter(method()))} stuff' }
  it { Tongo::Generator.new.send(:compile!, [:nested, 'loop', {'some' => 'attr'}, [:text, 'content']]).should == '#{loop({"some"=>"attr"}, "content")}' }
end
