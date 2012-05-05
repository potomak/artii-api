require 'goliath'
require 'artii'

VERSION = '0.1.0'.freeze

class MakeAsciiArt < Goliath::API
  use Goliath::Rack::Params

  def response(env)
    options = params['font'] ? {:font => params['font'].to_s} : {}

    begin
      [200, {'Content-Type' => 'text/plain'}, Artii::Base.new(options).asciify(params['text'].to_s)]
    rescue
      [500, {'Content-Type' => 'text/plain'}, 'An error has occurred while asciifying.']
    end
  end
end

class FontsList < Goliath::API
  def response(env)
    [200, {'Content-Type' => 'text/plain'}, Artii::Base.new.all_fonts.keys.join("\n")]
  end
end

class ArtiiAPI < Goliath::API
  # Make ASCII art
  get '/make', MakeAsciiArt
  # List of available fonts
  get '/fonts_list', FontsList

  # Render static files from ./public
  use(Rack::Static,
    :root  => Goliath::Application.app_path('public'),
    :urls  => ['/favicon.ico', '/stylesheets'],
    :index => '/index.html')

  not_found do
    run Proc.new { |env| [404, {'Content-Type' => 'text/plain'}, 'Not found'] }
  end

  # You must use either maps or response, but never both!
  def response(env)
    raise "#response is ignored when using maps, so this exception won't raise. See spec/integration/rack_routes_spec."
  end
end
