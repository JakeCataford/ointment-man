require 'net/http'
require 'uri'
require 'nokogiri'
module Listeners
  class TakeALookAt < Base
    listen_for(/ointment man, take a look at (https?:.*)/i)

    def response_for(message, match_data)
      markov = Markov.new
      info = paragraphs_in_webpage(match_data.captures.first)
      markov.learn(info)
      sentence = markov.sentence
      markov.save
      sentence
    rescue StandardError => e
      "I don't know how to access that webpage. (#{e.message})"
    end

    def paragraphs_in_webpage(url)
      paragraphs = ""
      page = Net::HTTP.get(URI.parse(url))

      html_doc = Nokogiri::HTML(page)
      html_doc.css('p').each do |paragraph|
        paragraphs << paragraph
      end

      paragraphs
    end
  end
end
