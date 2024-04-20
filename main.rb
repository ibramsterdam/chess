require_relative "lib/game"
require_relative "lib/player"
require "pry-byebug"


puts "Welcome to my chess game! Before the game starts I would like to know the names of the players"

print "Player one (white): "
p1 = Player.new gets.chomp

print "Player two (black): "
p2 = Player.new gets.chomp
game = Game.new p1, p2



