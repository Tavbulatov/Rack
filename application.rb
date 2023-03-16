require_relative 'time_handler'

class Application
  def call(env)
    request = Rack::Request.new(env)
    time = TimeHandler.new(request.params, request.path_info)

    responce(time.status, time.result)
  end

  def responce(status, body)
    [status,
     { 'Content - type' => 'text/plain' },
     [body]]
  end
end
