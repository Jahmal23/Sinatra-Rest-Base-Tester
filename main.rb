require 'rest_base'
require 'sinatra_app'

class SinatraApp
  get '/' do
    {
        :foo => "This is so easy now!"
    }
  end

 end