require_relative 'application'

ROUTES = { '/time' => Application.new }

use Rack::ContentType, 'text/plain'
run Rack::URLMap.new(ROUTES)
