class Request

  attr_accessor :url, :type

  def initialize(url, type)
    @url = url
    @type = type
  end

end