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

  s.add_development_dependency "sqlite3"
end
