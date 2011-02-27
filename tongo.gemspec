# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tongo}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rodrigo Alvarez"]
  s.date = %q{2011-03-18}
  s.description = %q{}
  s.email = %q{papipo@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "lib/tongo.rb",
    "lib/tongo/context.rb",
    "lib/tongo/engine.rb",
    "lib/tongo/generator.rb",
    "lib/tongo/parser.rb",
    "lib/tongo/template.rb",
    "spec/integration/context_spec.rb",
    "spec/spec_helper.rb",
    "spec/unit/tongo_generator_spec.rb",
    "spec/unit/tongo_parser_spec.rb"
  ]
  s.homepage = %q{http://github.com/Papipo/tongo}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{ruby template engine based on radius and liquid}
  s.test_files = [
    "spec/integration/context_spec.rb",
    "spec/integration/tilt_template_spec.rb",
    "spec/spec_helper.rb",
    "spec/unit/tongo_generator_spec.rb",
    "spec/unit/tongo_parser_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.0.pre6"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<temple>, [">= 0"])
      s.add_runtime_dependency(%q<tilt>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre6"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<temple>, [">= 0"])
      s.add_dependency(%q<tilt>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre6"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<temple>, [">= 0"])
    s.add_dependency(%q<tilt>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end
