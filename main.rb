require_relative 'hangman.rb'
require_relative "UI.rb"
include UI

def main
  match = Hangman.new
  load_game?(match)
  until match.winner
    get_input(match)
  end
  end_screen(match)
end

if $0 == __FILE__
  main
end
