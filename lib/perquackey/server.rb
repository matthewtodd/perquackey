require 'perquackey'
require 'sinatra/base'

module Perquackey
  class Server < Sinatra::Base
    set :views, File.dirname(__FILE__) + '/server'

    get %r{^/([a-z]{0,13})$} do |letters|
      erb :letters, :locals => { :letters => letters, :table => Game.new.words(letters) }
    end

    post '/' do
      @letters = params[:letters]
      redirect "/#{@letters}"
    end
  end
end