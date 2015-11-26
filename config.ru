require File.expand_path("../ointment_man", __FILE__)

app = Proc.new do |env|
  ointment = OintmentMan.new
  ointment.call(env)
end

run app
