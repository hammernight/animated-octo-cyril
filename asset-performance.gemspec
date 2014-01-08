# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'asset_performance/version'

Gem::Specification.new do |s|
  s.name = 'asset-performance'
  s.version = AssetPerformance::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Oscar Reiken', 'William Poindexter']
  s.email = %w(oreikenjr@gmail.com wpoindexter@bimfizzle.com)
  s.homepage = 'https://github.com/hammernight/animated-octo-cyril'
  s.summary = %q{custom cucumber formatter that extends the HTML formatter to include timestamps and asset downloading performance based on Firebug .HAR files}
  s.description = %q{custom cucumber formatter that extends the HTML formatter to include timestamps and asset downloading performance based on Firebug .HAR files}

  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'watir-webdriver'
  s.add_development_dependency 'syntax'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-nav'
  s.add_dependency 'har'
  s.add_dependency 'chronic'
  s.add_dependency 'tilt'
  s.add_dependency 'haml'
  s.add_dependency 'activesupport'

  s.files = `git ls-files`.split('\n')
  s.test_files = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables = `git ls-files -- bin/*`.split('\n').map { |f| File.basename(f) }
  s.require_paths = %w(lib)
end