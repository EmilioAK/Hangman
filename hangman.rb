require 'json'

class Hangman
  attr_reader :word, :current_guess, :wrong_guesses
  def initialize
    @word = select_word
    @current_guess = Array.new(@word.length, "_")
    @wrong_guesses = []
  end

  def winner
    if max_wrong_guesses
      return "Computer"
    end
    if word_found
      return "Player"
    end
    false
  end

  def guess_letter(letter_guess)
    letter_guess.downcase!
    if valid_input?(letter_guess)
      word_arr = @word.split("")
      if word_arr.include?(letter_guess)
        word_arr.each_with_index do |letter, index|
          @current_guess[index] = letter_guess if letter == letter_guess
        end
      else
        @wrong_guesses << letter_guess
      end
    end
  end

  def save (filename = "savefile.json")
    File.open(filename, "w") do |f|
      save = {
        'word' => @word,
        'current_guess' => @current_guess,
        'wrong_guesses' => @wrong_guesses
      }
      f.write(JSON.generate(save))
    end
  end

  def load (filename = "savefile.json")
    File.open(filename, "r") do |f|
      save = JSON.parse(f.read)
      
      @word = save["word"]
      @current_guess = save["current_guess"]
      @wrong_guesses = save["wrong_guesses"]
    end
  end

  private
  def max_wrong_guesses
    wrong_guesses.size >= 6
  end
  def word_found
    !@current_guess.include?("_")
  end
  def select_word
    word_list = []
    File.open("5desk.txt", "r") do |f|
      f.each_line do |line|
        word_list << line.delete("\n").delete("\r")
      end
    end
    word_list.select {|word| word.length.between?(5, 12)}.sample
  end
  def valid_input?(input)
    if @wrong_guesses.include?(input)
      puts "You've already guessed this letter"
      return false
    end
    if input.length > 1
      puts "Only guess one letter at a time"
      return false
    end
    true
  end
end