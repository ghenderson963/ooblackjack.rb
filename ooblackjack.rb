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
    total = 0
    @hand_array.each do |card|
      total += card.value(card.rank).to_i
    end
    @hand_array.select { |card| card.value(card.rank) == 11 }.count.times do
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
    end
    hand_total += total_card_value
    puts "for a total of #{hand_total}"
    # if hand_total == 21
    #   puts "Blackjack! You win!"
    #
    # elsif hand_total > 21
    #   puts "Busted! You loose!"
    #   exit
    # end
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
    @dealer = Dealer.new
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
  puts "#{@hash_of_players[0]} is first "
  @player = @hash_of_players[0]

 # if !["h", "s"].include?(player_call)
 #      puts "you must enter s or h"
 #      next
 #    end
 #    if player_call == "s"
 #      puts "You choose to stay"
 #      break
 #    end
 #    if player_total_count == 21
 #      puts "Blackjack! you win!"
 #      exit
 #    elsif player_total_count > 21
 #      puts "Busted! you loose!"
 #      exit
 #    end

while @count < @hash_of_players.length
    hit_or_stay
    switch_players
  end
  puts "dealers turn"
  2.times do
    @dealer.hand.add_card(@deck.deal)

  end
  @dealer.hand.to_s
end

def switch_players
  @count = @count + 1
  @player = @hash_of_players[@count]
end

  def hit_or_stay
    while @player.hand.total_card_value < 21
      puts "Would you like a HIT or would you like to STAY #{@player}?"
      puts "Use the keyboard to type (H) for HIT or (S) to stay"
      answer = gets.chomp.downcase
      # system "clear"
      if !["h", "s"].include?(answer)
        puts "You must enter s or h"
        next
      end
      if answer == "s"
        puts "You choose to stay!"
        break
      end
       @player.hand.add_card(@deck.deal)
      if @player.hand.total_card_value == 21
        puts "Blackjack! #{@player} wins!"
        list_hands
        remove_player
        break
      elsif @player.hand.total_card_value > 21
        puts "Busted! #{@player} looses!"
        remove_player
        break
      end
      system "clear"
      list_hands
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

def remove_player
  @hash_of_players.delete_if{ |key, value| key == "#{@player}"}
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
