module Tongo
  class Template < Temple::Template
    engine Tongo::Engine
  end
end

Tilt.register 'tng', Tongo::Template