require 'pry-byebug'

module Input
  def get_input(correct_input)
    puts "Enter your combination. For example, 'blue, red, green, yellow'."
    input = gets.chomp
    input  = input.split(/[\s,]+/)
    input.each {|element| element.downcase!}
    if input.all? {|element| correct_input.include?(element)}
      return input
    else
      puts 'Wrong input! Please try again.'
      get_input(correct_input)
    end
  end
end