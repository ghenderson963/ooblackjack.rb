require "pry"

class Deck



end

class Hand



end

class Player
  attr_accessor :name

  def initialize
    @name = name
  end

  def to_s
    name
  end


end

class Dealer < Player



end

class Card



end


class Game
  def initialize
    @deck = Deck.new


  end
def play
    begin
      puts "how many players are going to play?  Chose 1-4"
      number_of_players = gets.chomp.to_i
    end while number_of_players == 0 || number_of_players >= 4
      hash_of_players = {}
      number_of_players.times do |num|
        puts "What is player#{num + 1}'s name?"
        players_name = gets.chomp.to_s
        hash_of_players[num] = Player.new.name = "#{players_name}"
      end




  end





end


new_game = Game.new.play
