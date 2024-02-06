class Messages 

  def start_of_round(game, board)
    board.display_board
    puts "#{game.current_player.player_id}" + " - It is your turn."
  end

  def select_piece
    puts "Select the piece you wish to move."
  end

  def invalid_selection
    puts "that selection was invalid, please try again"
  end
  
  def select_row
    puts "Please select row (1-8)"
  end

  def select_column
    puts "Please select column (1-8)"
  end

  def select_destination
    puts "Where do you want to piece to move to?"
  end

  def confirm_selection(node)
    puts "You have selected " + "#{node}" + " is this correct? (y/n)"
  end



end