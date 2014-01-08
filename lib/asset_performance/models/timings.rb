class Timings

  attr_accessor :blocked, :dns, :connect, :send, :wait, :receive

  def initialize(blocked, dns, connect, send, wait, receive)
    @blocked = blocked
    @dns = dns
    @connect = connect
    @send = send
    @wait = wait
    @receive = receive
  end

end