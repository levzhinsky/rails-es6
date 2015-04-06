# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "es6/version"

Gem::Specification.new do |s|
  s.name        = 'rails-es6'
  s.version     = Es6::VERSION
  s.summary     = 'Babel adapter for the Rails asset pipeline.'
  s.description = 'Babel adapter for the Rails asset pipeline.'
  s.authors     = ["Oleksii Levzhynskyi"]
  s.email       = 'oleksii.levzhynskyi@gmail.com'
  s.homepage    = 'https://github.com/levzhinsky/rails-es6'
  s.files       = Dir["lib/**/*.rb"]
  s.license     = 'MIT'

  s.add_dependency 'railties',        '>= 4.0.0', '< 5.0'
  s.add_dependency 'sprockets-rails', '>= 2.0', '< 4.0'
  s.add_dependency 'sprockets',       '>= 2.8', '< 4.0'
  s.add_dependency 'tilt',            '~> 1.1'
  s.add_dependency 'babel-transpiler','~> 0'
end