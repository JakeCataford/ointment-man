require 'random_word'


module Listeners
  class WhatDoYouThink < Base
    listen_for(/dj.*/i)

    def response_for(message, _)
      message = RandomWord.adjs.next
      message << " "
      message << RandomWord.noun
      message
    end
  end
end
