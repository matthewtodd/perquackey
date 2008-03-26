class WordsController < ApplicationController
  def index
  end
  
  def create
    redirect_to word_path(params[:letters])
  end
  
  def show
    @letters = params[:letters]
    @table = Game.new.words(@letters)
  end
end