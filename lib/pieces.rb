player_1 = ["u/2654", "u/2655", "u/2656", "u/2657", "u/2658", "u/2689", 7, 1]
player_2 = ["u/265A", "u/265B", "u/265C", "u/265D", "u/265E", "u/265F", 2, 8]

class Player 
  attr_accessor :player_id

  def initialize(player_id)
    @player_id = player_id
  end

end


class King 

  def initialize(player)
    @player = player
    @marker = @player[0]
    @possible_moves = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1]] 
  end

end


class Queen 

  def initialize(player)
    @player = player
    @marker = @player[1]
    @possible_moves = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1]] 
  end

end


class Rook 

  def initialize(player)
    @player = player
    @marker = player[2]
    @possible_moves = [[1,0],[0,1],[-1,0],[0,-1]]
  end
  
end

class Bishop 

  def initialize(player)
    @player = player
    @marker = player[3]
    @possible_moves = [[1,1],[-1,1],[-1,-1],[1,-1]]
  end

end

class Knight 

  def initialize(player)
    @player = player
    @marker = player[4]
    @possible_moves = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
  end

end

class Pawn
 
  def initialize(player)
    @player = player
    @marker = player[5]
    @home_row = player[6]
    @upgrade_row = player[7]
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