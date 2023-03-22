require_relative 'time_handler'

class Application
  def call(env)
    request = Rack::Request.new(env)
    rack_responce = Rack::Response.new
    time = TimeHandler.new(request.params)

    responce(rack_responce, time)
  end

  def responce(rack_responce, time)
    if time.unknown_format.any?
      rack_responce.status = 400
      rack_responce.body = ["Unknown time format #{time.unknown_format}"]
    else
      rack_responce.status = 200
      rack_responce.body = [time.time_now]
    end

    rack_responce.finish
  end
end
