# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pony-gae}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bas Wilbers"]
  s.date = %q{2009-04-12}
  s.description = %q{Pony-GAE, the express way to send email in JRuby on Google App Engine}
  s.email = %q{baswilbers@gmail.com}
  s.files = ["README.rdoc","lib/pony.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/Basaah/pony-gae}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Easily send emails from jruby on google's app engine.}
end
