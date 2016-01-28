# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'net/ssh/stream/version'

Gem::Specification.new do |spec|
  spec.name          = 'net-ssh-stream'
  spec.version       = Net::Ssh::Stream::VERSION
  spec.authors       = ['Gabriel Naiman']
  spec.email         = ['gabynaiman@gmail.com']
  spec.description   = 'Net::SSH extension for streaming stdout and stderr from remote commnad'
  spec.summary       = 'Net::SSH extension for streaming stdout and stderr from remote commnad'
  spec.homepage      = 'https://github.com/gabynaiman/net-ssh-stream'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'net-ssh', '~> 2.0'
  
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 4.7'
  spec.add_development_dependency 'turn', '~> 0.9'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'pry-nav'
end