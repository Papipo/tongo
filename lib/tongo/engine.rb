module Tongo
  class Engine < Temple::Engine
    use Tongo::Parser
    use Temple::Filters::MultiFlattener
    use Tongo::Generator
  end
end
