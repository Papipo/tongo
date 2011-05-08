module Tongo
  class Engine < Temple::Engine
    use Tongo::Parser
    filter :MultiFlattener
    filter :StaticMerger
    filter :DynamicInliner
    use Tongo::Generator
  end
end
