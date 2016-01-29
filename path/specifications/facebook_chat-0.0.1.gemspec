# -*- encoding: utf-8 -*-
# stub: facebook_chat 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "facebook_chat"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kengo Tateishi"]
  s.date = "2013-10-22"
  s.description = "Facebook Chat API Client"
  s.email = ["embrace.ddd.flake.peace@gmail.com"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Facebook Chat API Client"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>, ["~> 1.3"])
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<xmpp4r>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<xmpp4r>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<xmpp4r>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
