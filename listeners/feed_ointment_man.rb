module Listeners
  class FeedOintmentMan < Base
    listen_for(/.*/i)

    def response_for(message, _)
      markov = Markov.new
      markov.learn(message)
      markov.save
      if rand > 0.1
        markov.sentence
      else
        ""
      end
    end
  end
end
