class Scenario

  attr_accessor :title, :timestamp, :pages

  def initialize(title, timestamp)
    @title = title
    @timestamp = timestamp
    @pages = []
  end

end