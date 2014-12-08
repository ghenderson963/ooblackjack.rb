require "pry"

class Deck
  attr_accessor :count

  def initialize

    @count = 52
    @deck_of_cards = []
    suit = ["spades", "diamonds", "clubs", "hearts"]
    rank = ['2','3','4','5','6','7','8','9','jack','queen','king','ace']
    array_of_suit_rank_pairs = []
    array_of_suit_rank_pairs = suit.product(rank)
    count = 0
    array_of_suit_rank_pairs.each do |array|
      @deck_of_cards[count] = Card.new(array[0],array[1])
      count = count + 1
    end
  end


  def scramble
    @deck_of_cards.shuffle!
    @deck_of_cards.reverse!
    @deck_of_cards.shuffle!
  end

  def deal
   @deck_of_cards.pop
  end

  def to_s
    count = 0
    @deck_of_cards.each do |card|
      count = count + 1
      puts "Card number #{count} is a #{card.rank} of #{card.suit} "
    end
  end
end

class Hand
  attr_accessor :hand_array
  def initialize
    @hand_array = []
    @number_of_cards = @hand_array.count
  end

  def add_card(card)
    @hand_array.push(card)
  end

  def total_card_value
# def count_up_cards(hand)
  # card_vals = @hand_array.map  { |card| card[1] }
  @hand_array.each do |card| card.value
    total = 0
    total += value.to_i
  end
  card_vals.select { |card| card.value == 11 }.count.times do
    if total > 21
      total -= 10
    end
  end
  total
end

def to_s
  hand_total = 0
  @hand_array.each do |card|
    puts "#{card.rank} of #{card.suit}"
    hand_total += card.value(card.rank).to_i
  end
  puts "for a total of #{hand_total}"


end




end

class Card
  attr_accessor :rank, :suit, :value

  def initialize(suit, rank)
  @suit = suit
  @rank = rank
  @value = value(rank)
  end

  def value(rank)
    if rank == "ace"
      @value = 11
    elsif rank.to_i == 0
      @value = 10
    else
      @value = rank
    end
  end

  def to_s
    @suit
    @rank
  end

end


class Player
  attr_accessor :name, :hand

  def initialize
    @name = name
    @hand = Hand.new
  end

  def to_s
    name
  end



end

class Dealer < Player

  def hit


  end

  def stay

  end

def run_game

end



end



class Game
  def initialize
    @deck = Deck.new
    @hash_of_players = {}
    @current_player = " "
    @count = 0
  end

def play
  get_player_name
  system "clear"
  puts "Blackjack is the game!"
  @deck.scramble
  2.times do
    @hash_of_players.each do |k,player|
      player.hand.add_card(@deck.deal)
    end
  end


  list_hands
  num = @hash_of_players.length
  num.times
  puts "#{@hash_of_players[0]} is first "
  @player = @hash_of_players[0]


  hit_or_stay
  switch_players

end

def switch_players
  @count = @count + 1
  @player == @hash_of_players[@count]
binding.pry
end

  def hit_or_stay
    begin
      puts "Would you like a HIT or would you like to STAY #{@player}?"
      puts "Use the keyboard to type (H) for HIT or (S) to stay"
      answer = gets.chomp.upcase
    end until (answer == "H") || (answer == "S")
    if answer == "H"
      binding.pry
      @player.hand.add_card(@deck.deal)
    else
      puts "#{@player} Stays."
    end
  end





# cycle through hash_of_players twice and deal one card
# hash_of_players
  # @deck.deal



     # puts @deck_in_play.deal

end

def list_hands
  count = @hash_of_players.length
  num = 0
  count.times do
    puts "#{@hash_of_players[num].name} has:"
    @hash_of_players[num].hand.to_s
    puts " "
    num += 1
  end
end


def get_player_name
  begin
    puts "how many players are going to play?  Chose 1-4"
    number_of_players = gets.chomp.to_i
  end while number_of_players == 0 || number_of_players > 4
    number_of_players.times do |num|
      puts "What is player#{num + 1}'s name?"
      players_name = gets.chomp.to_s
      @hash_of_players[num] = Player.new
      @hash_of_players[num].name = "#{players_name}"
    end
end

def choose_who_goes_first
  count_of_players = @hash_of_players.length
  player_number = @hash_of_players.keys.sample
  @player = @hash_of_players[player_number]
end

# def alternate_players(current_player)
#   hash_of_players
#     case
#     when current_player == @player1
#       @



#     if @player == @human
#       @player = @computer
#     else
#       @player = @human
#     end
#   end
#puts hash_of_players[1].hand





      #deal cards

      #list total for all players including dealer

      #ask players for hit or stay

      #deal one card on hit















new_game = Game.new.play
