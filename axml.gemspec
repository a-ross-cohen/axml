# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'axml/version'

Gem::Specification.new do |spec|
  spec.name          = "axml"
  spec.version       = Axml::VERSION
  spec.authors       = ["Adam Ross Cohen"]
  spec.email         = ["a.ross.cohen@gmail.com"]
  spec.summary       = %q{Android Binary XML Document Parser}
  spec.description   = %q{Reads packaged xml files from binary format back into human readable xml}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  
  spec.add_dependency "nokogiri"
end
