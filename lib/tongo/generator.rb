module Tongo
  class Generator
    
    TOKENIZER     = /(\%\{.+?\})/
    INTERPOLATION = /\%\{(.+?)\}/
    
    def call(exp)
      "\"#{compile!(exp)}\""
    end
    
    def initialize(options = {})
    end
    
    protected
    def compile!(exp)
      case exp.first
      when :multi
        exp[1..-1].map { |e| compile!(e) }.join
      when :empty
        "\#{#{exp[1]}(#{exp[2]})}"
      when :nested
        "\#{#{exp[1]}(#{exp[2].inspect}, \"#{compile!(exp[3])}\")}"
      when :text
        compiled_text(exp[1])
      when :html
        html(exp)
      else
        raise "Unhandled exp: #{exp.first}"
      end
    end
    
    private
    def html(exp)
      "<#{exp[1]}#{join_attributes(exp[2])}>#{compile!(exp[3])}</#{exp[1]}>"
    end
    
    def join_attributes(attributes)
      return '' if attributes.empty?
      attributes.inject([]) do |memo,attribute|
        memo << "#{attribute[0]}=\\\"#{attribute[1]}\\\""
      end.join('').tap { |result| result.replace(" #{result}") }
    end
    
    def tokenize_text(input)
      input.split(TOKENIZER)
    end
    
    def compiled_text(input)
      tokenize_text(input).map do |token|
        (matchdata = token.match(INTERPOLATION)) ? handle_interpolation_token(token, matchdata) : token
      end.join
    end
    
    def handle_interpolation_token(token, matchdata)
      pattern, value = matchdata.values_at(0, 1)
      expand_interpolation(value)
    end
    
    def expand_interpolation(interpolation)
      interpolation.split('|').inject('') { |memo,element| "#{element.strip}(#{memo})" }.tap { |result| result.replace("\#{#{result}}") }
    end
  end
end