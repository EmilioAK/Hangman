module UI
  
  def get_input(match)
    input = gets.chomp
    if input.downcase == "save"
      match.save
      puts "Match saved to file"
    elsif input.downcase == "load"
      match.load
      puts "Match loaded from file"
    else
      match.guess_letter(input)
    end
    print_results(match)
  end

  def load_game?(match)
    puts "Load your saved game? [y/N]"
    puts "You can also load your saved game at any time by typing \"load\" during the game."
    input = gets.chomp

    match.load if input.downcase[0] == "y"
    print_results(match)
  end

  private
  def print_results(match)
    p match.current_guess
    p match.wrong_guesses
  end
  def end_screen(match)
    puts "#{match.winner} won! The secret word was \"#{match.word}\""
  end
end