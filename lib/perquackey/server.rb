require 'sinatra/base'

module Perquackey
  class Server < Sinatra::Base
    set :views, Perquackey.datadir + '/templates'

    get %r{^/([a-z]{0,13})$} do |letters|
      erb :index, :locals => { :letters => letters, :words => Game.new.words(letters) }
    end

    post '/' do
      @letters = params[:letters]
      redirect "/#{@letters}"
    end
  end
end
