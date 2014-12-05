require 'yeeha/api/app'

class Yeeha::Api::App
  class Endpoint
    class Home < Endpoint

      set :prefix, '/'

      get '/' do
        'hello world'
      end
    end
  end
end
