require 'cgi'
require 'json'
require 'uri'

class Responder
  attr_accessor :message

  def initialize(request)
    self.message = parse_message(request)
  end

  def respond
    puts "Processing message #{message}"
    return failure if message.nil?
    responses = []
    Listeners::Base.descendants.each do |listener_class|
      listener = listener_class.new

      next unless listener.should_respond?(message)
      message_to_respond_with = listener.response_for(message)

      responses.push(message_to_respond_with)
    end

    [200, {'Content-Type'=>'application/json'}, StringIO.new(response_from_messages(responses))]
  end

  def failure
    [422, {'Content-Type'=>'application/json'}, StringIO.new]
  end

  private

  def response_from_messages(responses)
    responses.compact!
    text = responses.join('\n')
    { text: text }.to_json
  end

  def parse_message(request)
    request = URI.decode(request)
    params = CGI.parse(request)
    puts params
    params[:text]
  end
end
