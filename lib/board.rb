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

  # @@player_1_codes = ["\u2654".encode('utf-8'), "\u2655".encode('utf-8'), "\u2656".encode('utf-8'), 
  #                     "\u2657".encode('utf-8'), "\u2658".encode('utf-8'), "\u2659".encode('utf-8'), 7, 1]

  # @@player_2_codes = ["\u265A".encode('utf-8'), "\u265B".encode('utf-8'), "\u265C".encode('utf-8'), 
  #                     "\u265D".encode('utf-8'), "\u265E".encode('utf-8'), "\u265F".encode('utf-8'), 7, 1]

                      
  def initialize(player_1, player_2)
    @board = {}
    @player_1 = player_1
    @player_2 = player_2
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
    @board[[1,1]] = Rook.new(@player_1)
    @board[[1,2]] = Knight.new(@player_1)
    @board[[1,3]] = Bishop.new(@player_1)
    @board[[1,4]] = Queen.new(@player_1)
    @board[[1,5]] = King.new(@player_1)
    @board[[1,6]] = Bishop.new(@player_1)
    @board[[1,7]] = Knight.new(@player_1)
    @board[[1,8]] = Rook.new(@player_1)

    8.times do |column|
      @board[[2, column + 1]] = Pawn.new(@player_1)
      @board[[7, column + 1]] = Pawn.new(@player_2)
    end
    
    @board[[8,1]] = Rook.new(@player_2)
    @board[[8,2]] = Knight.new(@player_2)
    @board[[8,3]] = Bishop.new(@player_2)
    @board[[8,4]] = Queen.new(@player_2)
    @board[[8,5]] = King.new(@player_2)
    @board[[8,6]] = Bishop.new(@player_2)
    @board[[8,7]] = Knight.new(@player_2)
    @board[[8,8]] = Rook.new(@player_2)
  end

  def display_board
    keys = @board.keys
    keys.sort!
    index = 0
    puts "         1   2   3   4   5   6   7   8   " + "\n"
    8.times do |row|
      print "   " + "#{(row +1)}" + "   "
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

  # def player_selection
  #   return gets.chomp.to_i
  # end

  # def valid_input?(input)
  #   if input >= 1 && input <= 8
  #     return true
  #   else
  #     messages.invalid_selection
  #     false
  #   end
  # end

end

