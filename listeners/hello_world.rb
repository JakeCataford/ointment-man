class Listeners::HelloWorld < Listeners::Base
  listen_for(/hello/i)

  def response_for(message)
    "Hello World!"
  end
end
