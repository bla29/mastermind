require_relative 'Input'
require 'pry-byebug'

class Mastermind
  include Input
  @@input_colors = ['blue', 'red', 'green', 'yellow']
  @@secret_code

  def initialize()
    @@board = Array.new(12) { Array.new(4, "") }
    @@secret_code = randomize_code()
  end

  def randomize_code()
    secret_code = @@input_colors.shuffle()
    return secret_code
  end

  #run loop 12 times
  #get input
  #update board with input
  #check if match with secret code. stop loop and print winner
  #if not, give feedback. 
  def play_game()
    attempt_number = 0
    tries_left = 12
    puts 'Welcome to Mastermind! The rules of the game is that you must guess the secret code in 12 tries or less. Clues will be given to you for wrong answers.'
    12.times do
      input = get_input(@@input_colors)
      update_board(input, attempt_number)
      if check_answer_with_code(input)
        puts 'Congratulations! You figured out the secret code.'
        break
      else
        give_feedback(input, attempt_number)
        attempt_number += 1
        tries_left -= 1
        puts "You have #{tries_left} tries left."
      end
    end
  end

  def update_board(answer_array, attempt_number)
    @@board[attempt_number] = answer_array
  end

  def check_answer_with_code(input)
    return input == @@secret_code
  end

  #if element is correct color and spot, give black pin
  #if element is correct color but wrong spot, give white pin
  def give_feedback(input, attempt_number)
    input.each_with_index do |element, index|
      if element == @@secret_code[index]
        puts 'You got a black pin! This means you guessed one color in the right spot.'
      elsif @@secret_code.include?(element)
        puts 'You got a white pin! This means you guessed one color, but in the wrong spot.'
      end
    end
  end

end

play = Mastermind.new()
play.play_game()