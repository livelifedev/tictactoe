=begin
Winning patterns
  #horizontal wins
  [0][0], [0][1], [0][2]
  [1][0], [1][1], [1][2]
  [2][0], [2][1], [2][2]

  #vertical wins
  [0][0], [1][0], [2][0]
  [0][1], [1][1], [2][1]
  [0][2], [1][2], [2][2]

  #diagonal wins
  [0][0], [1][1], [2][2]
  [0][2], [1][1], [2][0]
=end

class Board
  def initialize
    @grid = [
      ["tl", "tc", "tr"],
      ["ml", "mc", "mr"],
      ["bl", "bc", "br"]
    ]
    @top_row = "| | | |"
    @mid_row = "| | | |"
    @bot_row = "| | | |"

    @instructions = ["|tl|tc|tr|", "|ml|mc|mr|", "|bl|bc|br|"]
  end

  def show
    puts @top_row
    puts @mid_row
    puts @bot_row
  end

  def show_instructions
    puts "Welcome to terminal tic tac toe!"
    puts "The following are the move positions you are able to make:"
    puts @instructions, ""
  end

  def check(a, b, player)
    @grid[a][b] == player
  end

  def move(position, player)
    case position
    when "tl"
      @grid[0][0] = player
      @top_row[1] = player
    when "tc"
      @grid[0][1] = player
      @top_row[3] = player
    when "tr"
      @grid[0][2] = player
      @top_row[5] = player
    when "ml"
      @grid[1][0] = player
      @mid_row[1] = player
    when "mc"
      @grid[1][1] = player
      @mid_row[3] = player
    when "mr"
      @grid[1][2] = player
      @mid_row[5] = player
    when "bl"
      @grid[2][0] = player
      @bot_row[1] = player
    when "bc"
      @grid[2][1] = player
      @bot_row[3] = player
    when "br"
      @grid[2][2] = player
      @bot_row[5] = player
    end
  end

  def win(player)
    #horizontal wins
    return true if (0..2).all? { |i| check(0, i, player) }
    return true if (0..2).all? { |i| check(1, i, player) }
    return true if (0..2).all? { |i| check(2, i, player) }
    #vertical wins
    return true if (0..2).all? { |i| check(i, 0, player) }
    return true if (0..2).all? { |i| check(i, 1, player) }
    return true if (0..2).all? { |i| check(i, 2, player) }
    #diagonal wins
    return true if (0..2).all? { |i| check(i, i, player) }
    return true if (0..2).all? { |i| check(i, 2 - i, player) }
  end

end


#run game
ttt = Board.new
player = ["x", "o"]

ttt.show_instructions

loop do
  puts "It's Player #{player[0]}'s turn."
  input = gets.chomp
  ttt.move input, player[0]
  ttt.show
  break if ttt.win player[0]
  player[0], player[1] = player[1], player[0]
end

puts "Congrats Player #{player[0]}, you have won!"

