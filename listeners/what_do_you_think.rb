module Listeners
  class WhatDoYouThink < Base
    listen_for(/ointment man, what do you think\?/i)

    def response_for(message, _)
      markov = Markov.new
      markov.sentence(that_starts_with: "I think that")
    end
  end
end
