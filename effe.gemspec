lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'effe/version'

Gem::Specification.new do |spec|
  spec.name          = 'effe'
  spec.version       = Effe::VERSION
  spec.authors       = ['lambdadelta']
  spec.email         = ['waterdropfalls@gmail.com']

  spec.summary       = 'New type for accumulating side effects'
  # spec.homepage      = "Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.67.0'
end
