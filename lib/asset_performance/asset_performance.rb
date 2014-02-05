# to use this formatter, run: cucumber --format AssetPerformance::HtmlFormatter --out features/out/out.html

require 'haml'
require 'har'
require 'active_support/inflector'
require 'launchy'

module AssetPerformance
  module AddsAssetPerformance

    ENV_OUT_DIR = ENV['ASSET_PERFORMANCE_DIR'] ||= DEFAULT_OUT_DIR
    TEST_RUN_START = Time.now

    def self.formatter_with_asset_performance(formatter_class)
      Class.new(formatter_class) { include AddsAssetPerformance }
    end

    def scenario_name(keyword, name, file_colon_line, source_indent)
      name = append_timestamp_to name
      super keyword, name, file_colon_line, source_indent
    end

    def after_feature(feature)
      raise 'Please set the environment variable ASSET_PERFORMANCE_DIR in order to allow the formatter to find your .HAR files.' if ENV_OUT_DIR.nil?

      feature_title = feature.title
      scenarios = []
      feature.feature_elements.each { |scenario| scenarios << build_scenario_timings(scenario) }

      html = Haml::Engine.new(File.read(File.join(File.dirname(__FILE__), 'views', 'asset-performance.haml'))).render(
          Object.new,
          dir: File.dirname(__FILE__),
          feature_title: feature_title,
          scenarios: scenarios
      )

      report_file = File.join ENV_OUT_DIR, feature_title.parameterize.underscore, 'asset-performance.html'
      File.open(report_file, 'w') { |file| file.write html }
      Launchy.open report_file
    end

    private

    def append_timestamp_to(name)
      ts = Time.now - TEST_RUN_START
      formatted_timestamp = '%i:%02i' % [ts.to_i/60, (ts%60).round]
      "#{name} [#{formatted_timestamp}]"
    end

    def build_scenario_timings(scenario)
      OpenStruct.new title: scenario.title, pages: build_har_pages(get_har(scenario))
    end

    def get_har(scenario)
      feature_title = scenario.feature.title.parameterize.underscore
      scenario_title = scenario.title.parameterize.underscore
      last_har_file_name = Dir.glob("#{ENV_OUT_DIR}/#{feature_title}/#{scenario_title}/*.har").last
      HAR::Archive.from_file last_har_file_name
    end

    def build_har_pages(har)
      pages = []
      har.pages.each do |har_page|
        assets = []
        har_page.entries.each do |har_asset|
          har_request = har_asset.request
          request = OpenStruct.new url: har_request.url, type: har_request.method
          har_timings = har_asset.timings
          timings = OpenStruct.new blocked: har_timings.blocked, dns: har_timings.dns, connect: har_timings.connect, send_timing: har_timings.send, wait: har_timings.wait, receive: har_timings.receive
          har_response = har_asset.response
          response = OpenStruct.new status: har_response.status, headers_size: har_response.headers_size, body_size: har_response.body_size, mime_type: har_response.content.mime_type, timings: timings
          asset = OpenStruct.new request: request, response: response
          assets << asset
        end
        page = OpenStruct.new title: har_page.title, total_load_time: har_page.timings.on_load, page_assets: assets
        pages << page
      end
      pages
    end

  end
end