require 'cgi'
require 'json'
require 'uri'

class Responder
  attr_accessor :request, :params, :message, :is_bot

  def initialize(request)
    self.request = request
    self.message = parse_message(request)
  end

  def respond
    puts "Processing message #{message}"
    return failure if message.nil?
    return failure if is_bot?
    responses = []
    Listeners::Base.descendants.each do |listener_class|
      listener = listener_class.new

      next unless listener.should_respond?(message)
      match_data = listener_class.matcher.match(message)
      message_to_respond_with = listener.response_for(message, match_data)

      responses.push(message_to_respond_with)
    end

    [200, {'Content-Type'=>'application/json'}, StringIO.new(response_from_messages(responses))]

  rescue Exception => e
    [200, {'Content-Type'=>'application/json'}, StringIO.new("{ \"text\" : \"Ah, shit. #{e.message}\" }")]
  end

  def failure
    [422, {'Content-Type'=>'application/json'}, StringIO.new]
  end

  def is_bot?
    params.key?("bot_id")
  end

  private

  def response_from_messages(responses)
    responses.compact!
    text = responses.join('\n')
    { text: text }.to_json
  end

  def parse_message(request)
    request = URI.decode(request)
    self.params = CGI.parse(request)
    self.params["text"].first
  end
end
