module AssetPerformance
  module AddsAssetPerformance

    ENV_OUT_DIR = ENV['ASSET_PERFORMANCE_DIR']
    DEFAULT_OUT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..', 'features', 'out'), __FILE__)

    def self.formatter_with_asset_performance(formatter_class)
      Class.new(formatter_class) { include AddsAssetPerformance }
    end

    def after_feature_element(feature_element)
      append_asset_performance_to feature_element
      super feature_element
    end

    def append_asset_performance_to(feature_element)
      binding.pry
      # TODO

      #out_dir = ENV_OUT_DIR.nil? ? DEFAULT_OUT_DIR : ENV_OUT_DIR
      #FileUtils.mkdir_p out_dir unless Dir.exists? out_dir
      #scenario_out_dir = "#{out_dir}/#{name.downcase.tr(' ', '_')}"
      #FileUtils.mkdir_p scenario_out_dir unless Dir.exists? scenario_out_dir

      # look for .HAR out directory via environment variable

      # look for .HAR out directory with default path

      # parse the timestamp on the har file

      # in the scenario's directory, create a directory with the date (%D) of the parsed har file's timestamp

      # in the scenario's date directory, place the har file

      # parse the current har file and add interesting data to the scenario name section of the HTML report

      # TODO waaaay in the future

      # based on a flag, show a histogram of asset performance (all the har files in the out directory)
    end

  end
end