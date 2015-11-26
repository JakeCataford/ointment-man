class Listeners::HelloWorld < Listeners::Base
  listen_for(/Hello\?/i)

  def response_for(message)
    "Hello World!"
  end
end
