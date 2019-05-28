
class Card

  attr_accessor :color, :number, :shape, :shading

  def initialize(color, number, shading, shape)
    @color = color
    @number = number
    @shading = shading
    @shape = shape
  end

end

class Player
  def  initialize( name)
    @name = set_name
    @score = 0
    @set  = []
  end

end




def prepare_cards(cards, pool)

  colors = %w[red green purple]
  numbers = %w[one two three]
  shadings = %w[solid stripped open]
  shapes = %w[diamond squiggle oval]


  colors.each do |color|
    numbers.each do |number|
      shadings.each do |shading|
        shapes.each do |shape|
          cards << Card.new(color,number, shading, shape)
        end
      end
    end
  end

  cards.shuffle!

  pool.concat cards.take(12)


end


def print_cards_in_pool(pool)
  pool.each_with_index do |card, index|
    puts "#{index + 1}, color: #{card.color}, number: #{card.number}, shadding: #{card.shading}, shape: #{card.shape}"
  end
end

def maintain_pool(cards, pool)

  # TODO: a) check if there are 12+ cards in <pool>, b)call has_set_in_pool, c)if has set, then done; otherwise, add 3 cards from <cards> to <pool>
  while (pool.length < 12 &&  has_set_in_pool?(pool) ){
    pool.concat cards.take(3)
  }

end

def has_set_in_pool?(pool)

  # TODO:

end

def gameover?(pool, cards)

  # TODO:

end

# Singer player plays the game

cards = []
pool = []
var score = 0;

# Initialize 81 cards, shuffle them, and put 12 cards into the pool
prepare_cards(cards, pool)
maintain_pool(cards, pool)


clear_screen
puts "Welcome to The Set Game!"

while(!gameover?(pool, cards))
  # print_cards_in_pool cards
  print_cards_in_pool(pool)
  array_input = Array.new (3)
  user_input =Array.new (3)

  puts "Please enter three indexs of cards that is a set:"
  array_input = gets.split
  user_input = [pool[array_input[0].to_i],pool[array_input[1].to_i],pool[array_input[2].to_i]]

  if(form_a_set?(user_input))
    score++;
    #pool.reject.with_index { |i, ix| user_input.include? ix }
    pool=pool-user_input
    maintain_pool(cards, pool)
  else
    puts "Wrong. Please try again!"
  end 

end

puts "The game is end. Your score is #{score}"



