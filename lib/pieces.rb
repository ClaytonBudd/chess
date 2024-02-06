


player_1 = ["u/2654", "u/2655", "u/2656", "u/2657", "u/2658", "u/2689", 7, 1]
player_2 = ["u/265A", "u/265B", "u/265C", "u/265D", "u/265E", "u/265F", 2, 8]





class Player 
  attr_accessor :player_id, :codes
  

  def initialize(player_id, codes)
    @player_id = player_id
    @codes = codes
  end

end

class Piece 

  def friendly_fire?(source, destination, board)
    puts "#{board.board[destination]}"
    if board.board[destination] == nil
      return false
    elsif board.board[destination].player == board.board[source].player
      return true
    else
      return false
    end
  end


end


class King < Piece 
  attr_accessor :marker, :player

  def initialize(player)
    @player = player
    @marker = "| " + player.codes[0] + " "
    @possible_moves = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1]] 
  end

  def validate_move(source, destination, board)
    return false if friendly_fire?(source, destination, board)
    legal_moves = []

    @possible_moves.each { |a,b| legal_moves.append([source[0] +a, source[1]+ b] )}
    legal_moves.select { |move| move.all? { |d| d >=1  && d <=8 } }

    return true if legal_moves.include?(destination)
    false
  end


end


class Queen < Piece 
  attr_accessor :marker, :player

  def initialize(player)
    @player = player
    @marker = "| " + player.codes[1] + " "
    @possible_moves = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1]] 
  end

  def validate_move(source, destination, board)
    return false if friendly_fire?(source, destination, board)

    legal_moves = []
    index = 0
    current = [source[0] + @possible_moves[index][0], source[1] + @possible_moves[index][1]]
    
    while current[0].between?(1,8) && current[1].between?(1,8)
      if board.board[current] == nil
        legal_moves.append(current)
        current = [source[0] + @possible_moves[index][0], source[1] + @possible_moves[index][1]]
      else
        if board.board[current].player != board.game.current_player
          legal_moves.append(current)
          index +=1
        else
          index +=1
        end
      end 
    end
  return true if legal_moves.include?(destination)
  false
  end
end


class Rook < Piece 
  attr_accessor :marker, :player

  def initialize(player)
    @player = player
    @marker = "| " + player.codes[2] + " "
    @possible_moves = [[1,0],[0,1],[-1,0],[0,-1]]
  end

  def validate_move(source, destination, board)
    return false if friendly_fire?(source, destination, board)

    legal_moves = []
    index = 0
    current = [source[0] + @possible_moves[index][0], source[1] + @possible_moves[index][1]]
    
    while current[0].between?(1,8) && current[1].between?(1,8)
      if board.board[current] == nil
        legal_moves.append(current)
        current = [source[0] + @possible_moves[index][0], source[1] + @possible_moves[index][1]]
      else
        if board.board[current].player != board.game.current_player
          legal_moves.append(current)
          index +=1
        else
          index +=1
        end
      end 
    end
  return true if legal_moves.include?(destination)
  false
  end
  
end

class Bishop < Piece 
  attr_accessor :marker, :player

  def initialize(player)
    @player = player
    @marker = "| " + player.codes[3] + " "
    @possible_moves = [[1,1],[-1,1],[-1,-1],[1,-1]]
  end
  
  def validate_move(source, destination, board)
    return false if friendly_fire?(source, destination, board)

    legal_moves = []
    index = 0
    current = [source[0] + @possible_moves[index][0], source[1] + @possible_moves[index][1]]
    
    while current[0].between?(1,8) && current[1].between?(1,8)
      if board.board[current] == nil
        legal_moves.append(current)
        current = [source[0] + @possible_moves[index][0], source[1] + @possible_moves[index][1]]
      else
        if board.board[current].player != board.game.current_player
          legal_moves.append(current)
          index +=1
        else
          index +=1
        end
      end 
    end
  return true if legal_moves.include?(destination)
  false
  end

end

class Knight < Piece
  attr_accessor :marker, :player

  def initialize(player)
    @player = player
    @marker = "| " + player.codes[4] + " "
    @possible_moves = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
  end

  def validate_move(source, destination, board)
    return false if friendly_fire?(source, destination, board)
    legal_moves = []

    @possible_moves.each { |a,b| legal_moves.append([source[0] +a, source[1]+ b] )}
    legal_moves.select { |move| move.all? { |d| d >=1  && d <=8 } }
    puts "#{legal_moves}"


    return true if legal_moves.include?(destination)
    false
  end

end

class Pawn < Piece 
  attr_accessor :marker, :player
 
  def initialize(player)
    @player = player
    @marker = "| " + player.codes[5] + " "
    @home_row = player.codes[6]
    @upgrade_row = player.codes[7]
    @first_move = [[1,0],[2,0]]
    @normal_move = [[1,0]]
    @attack_move = [[1,-1],[1,1]]
  end


end
# pieces

# king can move and attack in any direction 1 square
  #[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1] 

# queen can move and attack in any direction any squares
  #[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1] until outside board or until hits another piece
  
# rook can move and attack l / r or up / down any squares
  #[1,0],[0,1],[-1,0],[0,-1] until outside board or until hits another piece

# bishop can move and attack diagonally any squares
  #[1,1],[-1,1],[-1,-1],[1,-1] until outside board or until hits another piece

# knight can move and attack *

# pawn can move 
  #forward one if space is unoccupied
  #forward two if at starting position and space is unoccupied
  #diagonal one if space is occupied with opposing player's piece
  #if pawn makes it to opposite end it can upgrade.