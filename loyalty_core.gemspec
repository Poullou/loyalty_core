$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'loyalty_core/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'loyalty_core'
  s.version     = LoyaltyCore::VERSION
  s.authors     = ['Emeric GAICHET']
  s.email       = ['egaichet@snapp.fr']
  s.homepage    = 'https://github.com/Poullou/loyalty_core'
  s.summary     = 'R&D'
  s.description = 'R&D'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '4.2.1'
end
