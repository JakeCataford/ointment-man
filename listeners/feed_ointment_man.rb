module Listeners
  class FeedOintmentMan < Base
    listen_for(/.*/i)

    def response_for(message, _)
      markov = Markov.new
      markov.learn(message)
      markov.save
      ""
    end
  end
end
