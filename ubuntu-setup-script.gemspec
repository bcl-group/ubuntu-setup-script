# frozen_string_literal: true

require_relative 'lib/ubuntu/setup/script/version'

Gem::Specification.new do |spec|
  spec.name          = 'ubuntu-setup-script'
  spec.version       = Ubuntu::Setup::Script::VERSION
  spec.authors       = ['Murata Mitsuharu']
  spec.email         = ['hikari.photon+dev@gmail.com']
  spec.summary       = '研究室用の Ubuntu セットアップスクリプト'
  spec.required_ruby_version = '>= 2.5.0'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rubocop'
end
