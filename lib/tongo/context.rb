module Tongo
  class Context < BasicObject
    def self.tag(name, &block)
      define_method name do |*args|
        block.call(*args)
      end
    end
  end
end