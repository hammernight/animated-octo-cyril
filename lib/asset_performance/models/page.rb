class Page

  attr_accessor :title, :total_load_time, :page_assets

  def initialize(title, total_load_time)
    @title = title
    @total_load_time = total_load_time
    @page_assets = []
  end

end