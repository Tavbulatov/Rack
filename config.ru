require_relative 'application'
require_relative 'time_handler'

ROUTES = { '/time' => Application.new }

use Rack::ContentType, 'text/plain'
run Rack::URLMap.new(ROUTES)
