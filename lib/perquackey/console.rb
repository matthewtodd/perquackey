require 'perquackey'
require 'readline'

puts 'Type ctrl-d or quit to exit.'

game = Perquackey::Game.new

loop do
  line = Readline::readline('> ') || 'quit'
  next if line.strip == ''
  Readline::HISTORY.push(line)

  if line == 'quit'
    puts 'Goodbye.'
    exit
  else
    game.words(line).each { |row| puts row.join(' ') }
  end
end
