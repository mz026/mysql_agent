$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mysql_agent/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mysql_agent"
  s.version     = MysqlAgent::VERSION
  s.authors     = ["Yang-Hsing Lin"]
  s.email       = ["yanghsing.lin@gmail.com"]
  s.homepage    = ""
  s.summary     = "mysql migration wrapper"
  s.description = "preserves schema while migrating / schema loading"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
