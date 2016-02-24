# -*- encoding: utf-8 -*-
# stub: odf-report 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "odf-report"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sandro Duarte"]
  s.date = "2014-07-30"
  s.description = "Generates ODF files, given a template (.odt) and data, replacing tags"
  s.email = "sandrods@gmail.com"
  s.homepage = "http://sandrods.github.com/odf-report/"
  s.rubygems_version = "2.2.2"
  s.summary = "Generates ODF files, given a template (.odt) and data, replacing tags"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 1.1.0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.5.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rubyzip>, ["~> 1.1.0"])
      s.add_dependency(%q<nokogiri>, [">= 1.5.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rubyzip>, ["~> 1.1.0"])
    s.add_dependency(%q<nokogiri>, [">= 1.5.0"])
  end
end
