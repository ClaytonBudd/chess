require_relative "board.rb"
require_relative "pieces.rb"
require_relative "messages.rb"

class Game
  attr_accessor :current_player, :player_1, :player_2

  @@player_1_codes = ["\u2654".encode('utf-8'), "\u2655".encode('utf-8'), "\u2656".encode('utf-8'), 
                      "\u2657".encode('utf-8'), "\u2658".encode('utf-8'), "\u2659".encode('utf-8'), 7, 1]

  @@player_2_codes = ["\u265A".encode('utf-8'), "\u265B".encode('utf-8'), "\u265C".encode('utf-8'), 
                      "\u265D".encode('utf-8'), "\u265E".encode('utf-8'), "\u265F".encode('utf-8'), 7, 1]

  def initialize
    @player_1 = Player.new("White", @@player_1_codes)
    @player_2 = Player.new("Black", @@player_2_codes)
    @current_player = @player_1
    @board = Board.new(self)
    @messages = Messages.new
  end 

  def play_round

    @messages.start_of_round(self, @board)
    
    start_key = select_piece
    end_key = select_destination
    start_value = @board.board[start_key]
    end_value = @board.board[end_key]

    if start_value.validate_move(start_key, end_key, @board) == false
      @messages.invalid_move()
      play_round
    else
      @board.board[end_key] = @board.board[start_key]
      @board.board[start_key] = nil
      @board.display_board
      next_player(@current_player)
      play_round
    end
  

    
   
    
    

  end

  def select_piece
    @messages.select_piece
    piece = get_node
    if confirm_selection(piece) == true
      return piece
    else
      select_piece
    end
  end

  def select_destination
    @messages.select_destination
    destination = get_node
    if confirm_selection(destination) == true
      return destination
    else
      select_destination
    end
  end

  def get_node()
    
    @messages.select_row
    row = player_selection
    
    while valid_input?(row) == false
      row = player_selection
    end

    @messages.select_column
    column = player_selection
    
    while valid_input?(column) == false
      column = player_selection
    end

    node = [row,column]
    return node
  end

  def confirm_selection(node)
    @messages.confirm_selection(node)
    while true
      input = gets.chomp
      if input == "y"
        return true
      elsif input == "n"
        return false
      else
        puts "invalid selection please type y for yes or n for no."
      end
    end
  end

  def player_selection
    return gets.chomp.to_i
  end

  def valid_input?(input)
    if input >= 1 && input <= 8
      return true
    else
      @messages.invalid_selection
      false
    end
  end

  def next_player(current_player)
    if current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1 
    end
  end


end




game = Game.new
game.play_round