class Page

  attr_accessor :title, :total_load_time, :page_assets

  def initialize
    @page_assets = []
  end

end