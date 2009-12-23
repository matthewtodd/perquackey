require 'perquackey'
require 'sinatra/base'

module Perquackey
  class Server < Sinatra::Base
    set :views, File.dirname(__FILE__) + '/server/views'

    get '/' do
      @letters = ''
      @table   = Perquackey::WordTable.new
      erb :letters
    end

    post '/' do
      @letters = params[:letters]
      redirect "/#{@letters}"
    end

    get '/:letters' do
      @letters = params[:letters]
      @table   = Perquackey::Game.new.words(@letters)
      erb :letters
    end
  end
end