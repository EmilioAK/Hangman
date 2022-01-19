module UI
  def get_input(match)
    input = gets.chomp.downcase
    case input
    when 'save'
      match.save
      puts 'Match saved to file'
    when 'load'
      match.load
      puts 'Match loaded from file'
    else
      match.guess_letter(input)
    end
    print_results(match)
  end

  def load_game?(match)
    puts 'You can load your saved game right now or at any time by typing "load" during the game.'
    puts 'Load your saved game right now? [y/N]'
    input = gets.chomp

    match.load if input.downcase[0] == 'y'
    print_results(match)
  end

  private

  def print_results(match)
    formatted_current_guess = match.current_guess.map {|chr| chr.nil? ? '_' : chr}
    puts "Current guess: #{formatted_current_guess}"
    puts "Wrong guesses: #{match.wrong_guesses} (#{match.wrong_guesses.size} / #{match.max_wrong_guesses})"
    puts ''
  end

  def end_screen(match)
    puts "#{match.winner} won! The secret word was \"#{match.word}\""
  end
end
