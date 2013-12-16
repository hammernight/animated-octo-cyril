require 'asset_performance/adds_asset_performance'
require 'cucumber/formatter/html'

module Timestamped
  HtmlFormatter = AddsAssetPerformance.formatter_with_asset_performance(Cucumber::Formatter::Html)
end