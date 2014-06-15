# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whos_dated_who/version'

Gem::Specification.new do |spec|
  spec.name          = "whos_dated_who"
  spec.version       = WhosDatedWho::VERSION
  spec.authors       = ["Adrian Perez"]
  spec.email         = ["adrianperez.deb@gmail.com"]
  spec.summary       = %q{Unofficial API for whosdatedwho.com}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/blackxored/whos_dated_who"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "hashie"
  spec.add_dependency "nokogiri"
  spec.add_dependency "searchbing"
  spec.add_dependency "activesupport", "~> 4.1.1"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry-rescue"
end
