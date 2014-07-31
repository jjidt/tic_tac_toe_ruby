require './lib/grid'
require './lib/space'
require './lib/player'
require './lib/game'
require 'pry'

def prompt(str)
  print str + ":   "
  gets.chomp
end


def draw_board(game)
  system("clear")
  (0..8).step(3) do |index|
    puts "#{game.grid.spaces[index].mark}|#{game.grid.spaces[index+1].mark}|#{game.grid.spaces[index+2].mark}"
    puts "-+-+-" unless index > 5
  end
end


def game_loop(game)
  draw_board(game)

  y_coordinate = prompt("Mark Row (1-3)").to_i
  x_coordinate = prompt("Mark Column (1-3)").to_i

  x_coordinate -= 1
  y_coordinate -= 1

  if (x_coordinate < 0 || x_coordinate > 2) || (y_coordinate < 0 || y_coordinate > 2) || !game.grid.empty?(x_coordinate, y_coordinate)
      prompt "Invalid space, pick another one (press enter to continue)"
      return true
  end

  game.take_turn(x_coordinate, y_coordinate)

  if game.grid.winner?(game.players[0].symbol)
    draw_board(game)
    puts "#{game.players[0].name} WINS!"
    return false
  elsif game.grid.winner?(game.players[0].symbol)
    draw_board(game)
    puts "#{game.players[1].name} WINS!"
    return false
  end

  true
end


game = Game.new(Player.new(prompt("Player 1 name"), prompt("Player 1 symbol")[0]),
                Player.new(prompt("Player 2 name"), prompt("Player 2 symbol")[0]))

while game_loop(game)
end
