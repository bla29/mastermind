require_relative 'Input'
require 'pry-byebug'

class Mastermind
  include Input
  @@input_colors = ['blue', 'red', 'green', 'yellow']
  @@secret_code
  @@computer_plays = false

  def initialize()
    puts 'Welcome to Mastermind! The rules of the game is that you must guess the secret code in 12 tries or less. Clues will be given to you for wrong answers.'
    @@secret_code = randomizer_choice()
  end

  def randomize_code()
    secret_code = @@input_colors.shuffle()
    return secret_code
  end

  def randomizer_choice()
    puts 'Would you like to pick the secret code? Reply Y/N'
    answer = gets.chomp
    answer = answer.upcase
    if answer == 'Y'
      input = get_input(@@input_colors)
      @@computer_plays = true
      return input
    elsif answer == 'N'
      return randomize_code()
    else
      puts 'Wrong input!'
      randomizer_choice()
    end
  end

  #run loop 12 times
  #get input
  #update board with input
  #check if match with secret code. stop loop and print winner
  #if not, give feedback. 
  def play_game()
    tries_left = 12
    puts
    print 'Now let us start the game. '
    12.times do
      input = get_input(@@input_colors)
      update_board(input)
      if check_answer_with_code(input)
        puts ''
        puts 'Congratulations! You figured out the secret code.'
        break
      else
        give_feedback(input)
        tries_left -= 1
        puts ''
        puts "You have #{tries_left} tries left."
        puts
      end
    end
    puts 'You lost! I guess you are not a mastermind after all. :-('
  end

  def check_answer_with_code(input)
    return input == @@secret_code
  end

  #if element is correct color and spot, give black pin
  #if element is correct color but wrong spot, give white pin
  def give_feedback(input)
    puts ''
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
#play.play_game()