class PageAsset

  attr_accessor :request, :response

  def initialize(request, response)
    @request = request
    @response = response
  end

end