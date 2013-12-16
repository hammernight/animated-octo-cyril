module AssetPerformance
  module AddsAssetPerformance

    def self.formatter_with_asset_performance(formatter_class)
      Class.new(formatter_class) { include AddsAssetPerformance }
    end

    def scenario_name(keyword, name, file_colon_line, source_indent)
      name = append_asset_performance_to(name)
      super(keyword, name, file_colon_line, source_indent)
    end

    def append_asset_performance_to(name)
      # TODO

      # create an out directory somewhere with the scenario name if it doesn't exist already

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