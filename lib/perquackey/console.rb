def method_missing(symbol, *args, &block)
  Game.new.words(symbol.to_s).each { |row| puts row.join(' ') }
end