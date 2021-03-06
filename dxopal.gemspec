# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/dxopal/version.rb'

Gem::Specification.new do |spec|
  spec.name          = "dxopal"
  spec.version       = DXOpal::VERSION
  spec.authors       = ["Yutaka HARA"]
  spec.email         = ["yutaka.hara+github@gmail.com"]

  spec.summary       = %q{Game development framework for Opal}
  spec.homepage      = "https://yhara.github.io/dxopal/"
  spec.metadata      = {
    "source_code_uri" => "https://github.com/yhara/dxopal"
  }
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(examples|vendor|test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", "~> 0.20"
  spec.add_runtime_dependency "rack", "~> 2.0"
end
