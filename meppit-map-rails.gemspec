# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meppit/map/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "meppit-map-rails"
  spec.version       = Meppit::Map::Rails::VERSION
  spec.authors       = ["Luiz Armesto"]
  spec.email         = ["luiz.armesto@gmail.com"]
  spec.summary       = %q{meppit-map asset pipeline provider/wrapper}
  spec.homepage      = "https://github.com/it3s/meppit-map-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
