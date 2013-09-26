# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'b3_form/version'

Gem::Specification.new do |spec|
  spec.name          = "b3_form"
  spec.version       = B3Form::VERSION
  spec.authors       = ["Tilo Dietrich"]
  spec.email         = ["tilo.dietrich@knips-konsorten.de"]
  spec.description   = %q{Use this form builder for creating forms that use the Bootstrap 3 CSS framework}
  spec.summary       = "A Rails form builder for Bootstrap 3"
  spec.homepage      = "https://github.com/cknips/b3form"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
end
