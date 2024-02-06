require_relative "pieces.rb"
#Encoding: UTF-8

# board is hash 
# key is board grid 
# value is either empty or holds a "piece node"

#   a b c d  e f g h
# 8 R K B Q KG B K R
# 7 P P P P P  P P P
# 6
# 5
# 4
# 3
# 2 P P P P P  P P P
# 1 R K B Q KG B K R



class Board
  attr_accessor :board

  def initialize(game)
    @game = game
    @board = {}
    empty_board
    fill_board
  end


  def empty_board
    8.times do |row|
      8.times do |column|
        @board[[row+1, column+1]] = nil
      end
    end
  end

  def fill_board
    @board[[1,1]] = Rook.new(@game.player_1)
    @board[[1,2]] = Knight.new(@game.player_1)
    @board[[1,3]] = Bishop.new(@game.player_1)
    @board[[1,4]] = Queen.new(@game.player_1)
    @board[[1,5]] = King.new(@game.player_1)
    @board[[1,6]] = Bishop.new(@game.player_1)
    @board[[1,7]] = Knight.new(@game.player_1)
    @board[[1,8]] = Rook.new(@game.player_1)

    8.times do |column|
      @board[[2, column + 1]] = Pawn.new(@game.player_1)
      @board[[7, column + 1]] = Pawn.new(@game.player_2)
    end
    
    @board[[8,1]] = Rook.new(@game.player_2)
    @board[[8,2]] = Knight.new(@game.player_2)
    @board[[8,3]] = Bishop.new(@game.player_2)
    @board[[8,4]] = Queen.new(@game.player_2)
    @board[[8,5]] = King.new(@game.player_2)
    @board[[8,6]] = Bishop.new(@game.player_2)
    @board[[8,7]] = Knight.new(@game.player_2)
    @board[[8,8]] = Rook.new(@game.player_2)
  end

  def display_board
    keys = @board.keys
    keys.sort!
    index = 0
    puts "         1   2   3   4   5   6   7   8   " + "\n"
    8.times do |row| 
      print "   " + "#{(row+1)}" + "   "
      8.times do 
        if @board[keys[index]] != nil
          print "#{@board[keys[index]].marker}"
          index +=1
        else
          print "|   "
        index +=1
      end
    end
      puts "|" + "\n" + "        _______________________________"
    end
  end


end

