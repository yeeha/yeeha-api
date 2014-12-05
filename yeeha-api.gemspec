# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yeeha/api/version'

Gem::Specification.new do |spec|
  spec.name          = "yeeha-api"
  spec.version       = Yeeha::Api::VERSION
  spec.authors       = ["Jason YiZhang Chen"]
  spec.email         = ["jacyzon@ntut.edu.tw"]
  spec.summary       = "The public Yeeha API"

  spec.homepage      = "https://github.com/yeeha/yeeha-core"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "thin"
  spec.add_dependency "sinatra", "~> 1.4.5"
  spec.add_dependency 'backports', '~> 2.5'
  spec.add_dependency "activesupport", "~> 4.1"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "foreman"
  spec.add_development_dependency "rerun"
  spec.add_development_dependency "rb-fsevent"
end
