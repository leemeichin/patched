# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'patch/version'

Gem::Specification.new do |spec|
  spec.name          = "patch"
  spec.version       = Patch::VERSION
  spec.authors       = ["Lee Machin"]
  spec.email         = ["lee@new-bamboo.co.uk"]
  spec.description   = %q{More refinements, less faff}
  spec.summary       = %q{Simple way to include one-off refinements in your code}
  spec.homepage      = "https://github.com/leemachin/patch"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.0.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sourcify", "0.6.0.rc4"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.2.1"
end
