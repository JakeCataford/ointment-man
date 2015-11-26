require 'active_support'
require './ointment_man'

Dir[File.join(File.dirname(__FILE__), 'helpers', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'listeners', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'responder', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'worker', '*.rb')].each {|file| require file }

class OintmentMan
  def call(env)
    request = Rack::Request.new(env)
    request_body = request.body.read
    responder = Responder.new(request_body)
    responder.respond
  end
end
