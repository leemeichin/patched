# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'patched/version'

Gem::Specification.new do |spec|
  spec.name          = "patched"
  spec.version       = Patched::VERSION
  spec.authors       = ["Lee Machin"]
  spec.email         = ["lee@new-bamboo.co.uk"]
  spec.description   = %q{One-time use refinements}
  spec.summary       = %q{Simple way to include one-off refinements in your code}
  spec.homepage      = "https://github.com/leemachin/patched"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.1.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sourcify", ">= 0.6.0.rc4"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "minitest", "~> 5.2"
end
