# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-hooks"
  spec.version       = "0.1.0"
  spec.authors       = ["alexzhangs"]
  spec.email         = ["alexzhangs@gmail.com"]
  spec.summary       = "A Jekyll plugin to do find-and-replace in site content through hooks."
  spec.homepage      = "https://github.com/alexzhangs/jekyll-hooks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.8", "< 5.0"
end