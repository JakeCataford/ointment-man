require 'random_word'


module Listeners
  class WhatDoYouThink < Base
    listen_for(/dj.*/i)

    def response_for(message, _)
      message = "DJ "
      message << RandomWord.adjs.next.gsub(/_/, " ")
      message << " "
      message << RandomWord.nouns.next.gsub(/_/, " ")
      message
    end
  end
end
