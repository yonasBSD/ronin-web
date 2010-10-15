# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ronin-web}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-10-15}
  s.default_executable = %q{ronin-web}
  s.description = %q{Ronin Web is a Ruby library for Ronin that provides support for web scraping and spidering functionality.}
  s.email = %q{ronin-ruby@googlegroups.com}
  s.executables = ["ronin-web"]
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "README.md"
  ]
  s.files = [
    ".rspec",
    ".yardopts",
    "COPYING.txt",
    "ChangeLog.md",
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "Rakefile",
    "bin/ronin-web",
    "lib/ronin/network/mixins/web.rb",
    "lib/ronin/web.rb",
    "lib/ronin/web/extensions.rb",
    "lib/ronin/web/extensions/nokogiri.rb",
    "lib/ronin/web/extensions/nokogiri/xml.rb",
    "lib/ronin/web/extensions/nokogiri/xml/attr.rb",
    "lib/ronin/web/extensions/nokogiri/xml/document.rb",
    "lib/ronin/web/extensions/nokogiri/xml/element.rb",
    "lib/ronin/web/extensions/nokogiri/xml/node.rb",
    "lib/ronin/web/extensions/nokogiri/xml/text.rb",
    "lib/ronin/web/middleware.rb",
    "lib/ronin/web/middleware/base.rb",
    "lib/ronin/web/middleware/directories.rb",
    "lib/ronin/web/middleware/files.rb",
    "lib/ronin/web/middleware/filters.rb",
    "lib/ronin/web/middleware/filters/campaign_filter.rb",
    "lib/ronin/web/middleware/filters/ip_filter.rb",
    "lib/ronin/web/middleware/filters/path_filter.rb",
    "lib/ronin/web/middleware/filters/referer_filter.rb",
    "lib/ronin/web/middleware/filters/user_agent_filter.rb",
    "lib/ronin/web/middleware/filters/vhost_filter.rb",
    "lib/ronin/web/middleware/helpers.rb",
    "lib/ronin/web/middleware/proxy.rb",
    "lib/ronin/web/middleware/proxy_request.rb",
    "lib/ronin/web/middleware/request.rb",
    "lib/ronin/web/middleware/response.rb",
    "lib/ronin/web/middleware/router.rb",
    "lib/ronin/web/middleware/rule.rb",
    "lib/ronin/web/proxy.rb",
    "lib/ronin/web/proxy/app.rb",
    "lib/ronin/web/proxy/base.rb",
    "lib/ronin/web/proxy/web.rb",
    "lib/ronin/web/server.rb",
    "lib/ronin/web/server/app.rb",
    "lib/ronin/web/server/base.rb",
    "lib/ronin/web/server/web.rb",
    "lib/ronin/web/spider.rb",
    "lib/ronin/web/version.rb",
    "lib/ronin/web/web.rb",
    "ronin-web.gemspec",
    "spec/helpers/output.rb",
    "spec/spec_helper.rb",
    "spec/web/extensions/nokogiri_spec.rb",
    "spec/web/helpers/rack_app.rb",
    "spec/web/helpers/root.rb",
    "spec/web/helpers/root/test1.txt",
    "spec/web/helpers/root/test1/index.html",
    "spec/web/helpers/root/test1/test1.txt",
    "spec/web/helpers/root/test2.txt",
    "spec/web/helpers/root/test2/test2.txt",
    "spec/web/helpers/root/test3.txt",
    "spec/web/helpers/root/test3/test3.txt",
    "spec/web/middleware/directories_spec.rb",
    "spec/web/middleware/files_spec.rb",
    "spec/web/middleware/filters/campaign_filter_spec.rb",
    "spec/web/middleware/filters/ip_filter_spec.rb",
    "spec/web/middleware/filters/path_filter_spec.rb",
    "spec/web/middleware/filters/referer_filter_spec.rb",
    "spec/web/middleware/filters/user_agent_filter_spec.rb",
    "spec/web/middleware/filters/vhost_filter_spec.rb",
    "spec/web/middleware/proxy_spec.rb",
    "spec/web/middleware/response_spec.rb",
    "spec/web/middleware/router_spec.rb",
    "spec/web/middleware/rule_spec.rb",
    "spec/web/proxy/base_spec.rb",
    "spec/web/server/base_spec.rb",
    "spec/web/server/classes/public1/static1.txt",
    "spec/web/server/classes/public2/static2.txt",
    "spec/web/server/classes/sub_app.rb",
    "spec/web/server/classes/test_app.rb",
    "spec/web/web_spec.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/ronin-ruby/ronin-web}
  s.licenses = ["GPL-2"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Ruby library for Ronin that provides support for web scraping and spidering functionality.}
  s.test_files = [
    "spec/helpers/output.rb",
    "spec/spec_helper.rb",
    "spec/web/extensions/nokogiri_spec.rb",
    "spec/web/helpers/rack_app.rb",
    "spec/web/helpers/root.rb",
    "spec/web/middleware/directories_spec.rb",
    "spec/web/middleware/files_spec.rb",
    "spec/web/middleware/filters/campaign_filter_spec.rb",
    "spec/web/middleware/filters/ip_filter_spec.rb",
    "spec/web/middleware/filters/path_filter_spec.rb",
    "spec/web/middleware/filters/referer_filter_spec.rb",
    "spec/web/middleware/filters/user_agent_filter_spec.rb",
    "spec/web/middleware/filters/vhost_filter_spec.rb",
    "spec/web/middleware/proxy_spec.rb",
    "spec/web/middleware/response_spec.rb",
    "spec/web/middleware/router_spec.rb",
    "spec/web/middleware/rule_spec.rb",
    "spec/web/proxy/base_spec.rb",
    "spec/web/server/base_spec.rb",
    "spec/web/server/classes/sub_app.rb",
    "spec/web/server/classes/test_app.rb",
    "spec/web/web_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<data_paths>, ["~> 0.2.1"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.4.1"])
      s.add_runtime_dependency(%q<mechanize>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<spidr>, ["~> 0.2.0"])
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_runtime_dependency(%q<ronin-support>, ["~> 0.1.0"])
      s.add_runtime_dependency(%q<ronin>, ["~> 0.4.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<data_paths>, ["~> 0.2.1"])
      s.add_dependency(%q<nokogiri>, ["~> 1.4.1"])
      s.add_dependency(%q<mechanize>, ["~> 1.0.0"])
      s.add_dependency(%q<spidr>, ["~> 0.2.0"])
      s.add_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_dependency(%q<ronin-support>, ["~> 0.1.0"])
      s.add_dependency(%q<ronin>, ["~> 0.4.0"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<data_paths>, ["~> 0.2.1"])
    s.add_dependency(%q<nokogiri>, ["~> 1.4.1"])
    s.add_dependency(%q<mechanize>, ["~> 1.0.0"])
    s.add_dependency(%q<spidr>, ["~> 0.2.0"])
    s.add_dependency(%q<sinatra>, ["~> 1.0"])
    s.add_dependency(%q<ronin-support>, ["~> 0.1.0"])
    s.add_dependency(%q<ronin>, ["~> 0.4.0"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
  end
end

