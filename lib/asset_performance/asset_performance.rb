# to use this formatter, run: cucumber --format AssetPerformance::HtmlFormatter --out features/out/out.html

require 'haml'
require 'har'
require_relative 'models/page_asset'
require_relative 'models/page'
require_relative 'models/request'
require_relative 'models/response'
require_relative 'models/scenario'
require_relative 'models/timings'

module AssetPerformance
  module AddsAssetPerformance

    ENV_OUT_DIR = ENV['ASSET_PERFORMANCE_DIR']

    def self.formatter_with_asset_performance(formatter_class)
      Class.new(formatter_class) { include AddsAssetPerformance }
    end

    def after_feature_element(feature_element)
      append_asset_performance_to feature_element
      super feature_element
    end

    def append_asset_performance_to(feature_element)
      raise 'Please set the environment variable ASSET_PERFORMANCE_DIR in order to allow the formatter to find your .HAR files.' if ENV_OUT_DIR.nil?

      scenario = Scenario.new
      scenario.title = feature_element.title
      scenario.pages = build_har_pages get_har

      html = Haml::Engine.new(File.read(File.join(File.dirname(__FILE__), 'views', 'asset-performance.haml'))).render(
          Object.new,
          dir: File.dirname(__FILE__),
          scenario: scenario
      )
      File.open("#{File.join(ENV_OUT_DIR, 'asset-performance.html')}", 'w') { |file| file.write html }
    end

    private

    def get_har
      last_har_file_name = Dir.glob("#{ENV_OUT_DIR}/*.har").last # hack to get the file that was created last
      HAR::Archive.from_file last_har_file_name
    end

    def build_har_pages(har)
      pages = []
      har.pages.each do |har_page|
        page = Page.new
        page.total_load_time = har_page.timings.on_load
        page.title = har_page.title
        har_page.entries.each do |har_asset|
          asset = PageAsset.new
          har_request = har_asset.request
          request = Request.new
          request.url = har_request.url
          request.type = har_request.method
          asset.request = request
          har_response = har_asset.response
          response = Response.new
          response.status = har_response.status
          response.header_size = har_response.headers_size
          response.body_size = har_response.body_size
          response.mime_type = har_response.content.mime_type
          asset.response = response
          har_timings = har_asset.timings
          timings = Timings.new
          timings.blocked = har_timings.blocked
          timings.dns = har_timings.dns
          timings.connect = har_timings.connect
          timings.send = har_timings.send
          timings.wait = har_timings.wait
          timings.receive = har_timings.receive
          response.timings = timings
          page.page_assets << asset
        end
        pages << page
      end
      pages
    end

  end
end