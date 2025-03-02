require_relative 'Mastermind'
require 'pry-byebug'

class Computer < Mastermind
  def initialize()
    if @@computer_plays
      computer_play_game()
    end
  end

  def computer_play_game()
    tries_left = 12
    12.times do
      computer_answer = @@input_colors.shuffle()
      puts "The computer has chosen #{computer_answer}"
      if check_answer_with_code(computer_answer)
        puts 'The computer has won!'
        return
      else
        give_feedback(computer_answer)
        tries_left -= 1
        puts ''
        puts "You have #{tries_left} tries left."
        puts
      end
    end
  end
end

comp = Computer.new()