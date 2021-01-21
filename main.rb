require_relative 'hangman'
require_relative 'UI'
include UI

def main
  match = Hangman.new
  load_game?(match)
  get_input(match) until match.winner
  end_screen(match)
end

main if $PROGRAM_NAME == __FILE__
