class Response

  attr_accessor :status, :header_size, :body_size, :mime_type, :timings

  def initialize(status, header_size, body_size, mime_type, timings)
    @status = status
    @header_size = header_size
    @body_size = body_size
    @mime_type = mime_type
    @timings = timings
  end

end