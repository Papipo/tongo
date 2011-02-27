unless Object.const_defined?('BasicObject')
  class BasicObject
    KEEP_METHODS = %w"__id__ __send__ instance_eval == equal? initialize"

    def self.remove_methods!
      m = (private_instance_methods + instance_methods) - KEEP_METHODS
      m.each{|m| undef_method(m)}
    end
    remove_methods!
  end
end

require 'temple'
require 'nokogiri'

require 'tongo/generator'
require 'tongo/parser'
require 'tongo/context'
require 'tongo/engine'
require 'tongo/template'