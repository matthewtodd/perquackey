require 'json'
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

    get %r{^/([a-z]{0,13})\.json$} do |letters|
      content_type :json
      Dictionary.words(letters).to_json
    end

    post '/' do
      @letters = params[:letters]
      redirect "/#{@letters}"
    end
  end
end
