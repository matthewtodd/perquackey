require 'sinatra/base'

module Perquackey
  class Server < Sinatra::Base
    set :views, Perquackey.datadir.join('templates')

    get %r{^/([a-z]{0,13})$} do |letters|
      erb :index, :locals => {
        :letters => letters,
        :words   => Table.new(Dictionary.words(letters))
      }
    end

    post '/' do
      @letters = params[:letters]
      redirect "/#{@letters}"
    end
  end
end
