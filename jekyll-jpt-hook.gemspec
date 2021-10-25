# frozen_string_literal: true

require_relative "lib/jekyll-jpt-hook/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-jpt-hook"
  spec.version       = "0.1.0"
  spec.authors       = ["alexzhangs"]
  spec.email         = ["alexzhangs@gmail.com"]
  spec.summary       = "A Jekyll plugin to inject jekyll_picture_tag tags into content of post through hooks."
  spec.homepage      = "https://github.com/alexzhangs/jekyll-jpt-hook"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.8", "< 5.0"
  spec.add_development_dependency "jekyll_picture_tag"
end