module Tongo
  class Parser
    attr_reader :ns
    
    def call(src)
      src = "<root xmlns:#{@ns}=\"http://blog.codecaster.es\">#{src}</root>"
      doc = Nokogiri::XML::DocumentFragment.parse(src)
      traverse_children(doc.children)
    end
    
    def initialize(options = {})
      @ns = options[:ns] || 'tng'
    end
    
    private
    def traverse_children(doc, result = [:multi])
      doc.children.each do |doc|
        result << handle_node(doc)
      end
      result
    end
    
    def handle_node(node)
      if node.text?
        text(node)
      elsif node.children.empty?
        empty_node(node)
      else
        nested_node(node)
      end
    end
    
    def nested_node(e)
      (is_tongo?(e) ? tongo(e, true) : html(e)) << traverse_children(e)
    end
    
    def empty_node(e)
      is_tongo?(e) ? tongo(e) : html(e)
    end
    
    def is_tongo?(e)
      e.namespace && e.namespace.prefix == ns
    end
    
    def text(e)
      [:text, e.text]
    end
    
    def html(e)
      [:html, e.name, node_attributes_to_hash(e)]
    end
    
    def tongo(e, nested = false)
      [nested ? :nested : :empty, e.name, node_attributes_to_hash(e)]
    end
    
    def node_attributes_to_hash(node)
      node.attributes.inject({}) { |memo,attribute| memo.merge(attribute[0] => attribute[1].value) }
    end
  end
end