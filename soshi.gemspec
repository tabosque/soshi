$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "soshi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "soshi"
  s.version     = Soshi::VERSION
  s.authors     = ["tabosque"]
  s.email       = ["masakazu.morita@limhaus.com"]
  s.homepage    = "https://www.tabosque.com/"
  s.summary     = "Sochi is a blogging engine."
  s.description = "Sochi is a blogging engine for Ruby on Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency "redcarpet", "~> 2.3.0"
  s.add_dependency "paranoia", "~> 2.2"
  s.add_dependency "slim-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "sass-rails", "~> 5.0"
  s.add_dependency "bootstrap-sass", "~> 3.3.6"
  s.add_dependency "bootstrap_form"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "better_errors"
end
