# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mygegegems/version'

Gem::Specification.new do |spec|
  spec.name          = "mygegegems"
  spec.version       = Mygegegems::VERSION
  spec.authors       = ["kyoendo"]
  spec.email         = ["postagie@gmail.com"]
  spec.summary       = %q{Report download numbers of you gems.}
  spec.homepage      = "https://github.com/melborne/mygegegems"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'gems'
  spec.add_dependency 'thor'
  spec.add_dependency 'colcolor', ">= 0.0.3"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "tildoc"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
