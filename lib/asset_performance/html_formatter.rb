require 'asset_performance/asset_performance'
require 'cucumber/formatter/html'

module AssetPerformance
  HtmlFormatter = AddsAssetPerformance.formatter_with_asset_performance(Cucumber::Formatter::Html)
end