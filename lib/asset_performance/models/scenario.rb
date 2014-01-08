class Scenario

  attr_accessor :title, :timestamp, :pages

  def initialize(title, timestamp, pages)
    @title = title
    @timestamp = timestamp
    @pages = pages
  end

end