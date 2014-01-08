# to use this formatter, run: cucumber --format AssetPerformance::HtmlFormatter --out features/out/out.html

require 'haml'
require 'har'
require 'active_support/inflector'
require_relative 'models/page_asset'
require_relative 'models/page'
require_relative 'models/request'
require_relative 'models/response'
require_relative 'models/scenario'
require_relative 'models/timings'

module AssetPerformance
  module AddsAssetPerformance

    ENV_OUT_DIR = ENV['ASSET_PERFORMANCE_DIR'] ||= DEFAULT_OUT_DIR

    def self.formatter_with_asset_performance(formatter_class)
      Class.new(formatter_class) { include AddsAssetPerformance }
    end

    def after_feature_element(feature_element)
      append_asset_performance_to feature_element
      super feature_element
    end

    def append_asset_performance_to(feature_element)
      raise 'Please set the environment variable ASSET_PERFORMANCE_DIR in order to allow the formatter to find your .HAR files.' if ENV_OUT_DIR.nil?

      pages = build_har_pages(get_har(feature_element.title))
      scenario = Scenario.new feature_element.title, Time.now, pages # TODO change the time to be from the HAR file

      html = Haml::Engine.new(File.read(File.join(File.dirname(__FILE__), 'views', 'asset-performance.haml'))).render(
          Object.new,
          dir: File.dirname(__FILE__),
          scenario: scenario
      )
      File.open("#{File.join("#{ENV_OUT_DIR}/#{scenario.title.parameterize.underscore}", 'asset-performance.html')}", 'w') { |file| file.write html }
    end

    private

    def get_har(scenario_name)
      last_har_file_name = Dir.glob("#{ENV_OUT_DIR}/#{scenario_name.parameterize.underscore}/*.har").last # hack to get the file that was created last
      HAR::Archive.from_file last_har_file_name
    end

    def build_har_pages(har)
      # TODO use OpenStruct here...no need to have real models
      pages = []
      har.pages.each do |har_page|
        page = Page.new har_page.title, har_page.timings.on_load
        har_page.entries.each do |har_asset|
          har_request = har_asset.request
          request = Request.new har_request.url, har_request.method
          har_timings = har_asset.timings
          timings = Timings.new har_timings.blocked, har_timings.dns, har_timings.connect, har_timings.send, har_timings.wait, har_timings.receive
          har_response = har_asset.response
          response = Response.new har_response.status, har_response.headers_size, har_response.body_size, har_response.content.mime_type, timings
          asset = PageAsset.new request, response
          page.page_assets << asset
        end
        pages << page
      end
      pages
    end

  end
end