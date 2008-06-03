%w(rubygems camping perquackey).each { |lib| require lib }

Camping.goes :Perquackey

module Perquackey::Controllers
  class Index < R '/'
    def get
      @letters, @table = '', WordTable.new
      render :letters
    end
    
    def post
      redirect Letters, input.letters
    end
  end
  
  class Letters < R '/([a-z]+)'
    def get(letters)
      @letters, @table = letters, Game.new.words(letters)
      render :letters
    end
  end
end

module Perquackey::Views
  def layout
    html do
      head { title 'Perquackey' }
      body do
        h1 'Perquackey'
        form(:name => 'form', :action => R(Index), :method => 'post') { input :name => 'letters', :value => @letters }
        script(:type => 'text/javascript') { 'document.formas.form.letters.focus();' }
        self << yield
        p { 'Thanks to Mendel Cooper and Alan Beale for the ' + a('YAWL Word List', :href => 'http://personal.riverusers.com/~thegrendel/software.html') + '.' }
      end
    end
  end
  
  def letters
    table do
      tr { @table.headers.each { |header| th header } }
      
      @table.each do |row|
        tr { row.each { |word| td word } }
      end
    end
  end
end