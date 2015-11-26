module Listeners
  class HelloWorld < Base
    listen_for(/Hello\?/i)

    def response_for(message, _)
      "Hello World!"
    end
  end
end
