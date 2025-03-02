require_relative 'Input'
require 'pry-byebug'

class Mastermind
  include Input
  @@correct_input = ['blue', 'red', 'green', 'yellow']

  def initialize()
    @@board = Array.new(12) { Array.new(4, "") }
    @@secret_code = randomize_code()
  end

  def randomize_code()
    secret_code = @@correct_input.shuffle()
    return secret_code
  end

  def play_game()
    input = get_input(@@correct_input)
    
  end

  def update_board(answer_array, attempt_number)
    @@board[attempt_number] = answer_array
  end

  def check_answer_with_code(input)
    return input == @@secret_code
  end

  def give_feedback(input)

  end

end

play = Mastermind.new()
play.play_game()