$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "refinerycms_djatoka/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "refinerycms_djatoka"
  s.version     = RefinerycmsDjatoka::VERSION
  s.authors     = ["Jason Ronallo"]
  s.email       = ["jronallo@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "refinerycms_djatoka adds support for inserting Djatoka image server images."
  s.description = "refinerycms_djatoka adds support for inserting and linking from Djatoka image server images."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency "djatoka"

  s.add_development_dependency "sqlite3"
end
