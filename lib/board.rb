require_relative "chess_pieces/rook"
require_relative "chess_pieces/knight"
require_relative "chess_pieces/queen"
require_relative "chess_pieces/king"
require_relative "chess_pieces/pawn"
require_relative "chess_pieces/bishop"

class Board

  WHITE = [255, 255, 255]
  BLACK = [0, 0, 0]
  PURPLE = [187, 120, 247]
  BLUE = [85, 85, 255]
  START_SHAPE = [[Rook.new("black"), Knight.new("black"), Bishop.new("black"), Queen.new("black"), King.new("black"), Bishop.new("black"), Knight.new("black"), Rook.new("black")],
                [Pawn.new("black"), Pawn.new("black"), Pawn.new("black"), Pawn.new("black"), Pawn.new("black"), Pawn.new("black"), Pawn.new("black"), Pawn.new("black")],
                [nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil],
                [nil,nil,nil,nil,nil,nil,nil,nil],
                [Pawn.new("white"), Pawn.new("white"), Pawn.new("white"), Pawn.new("white"), Pawn.new("white"), Pawn.new("white"), Pawn.new("white"), Pawn.new("white")],
                [Rook.new("white"), Knight.new("white"), Bishop.new("white"), King.new("white"), Queen.new("white"), Bishop.new("white"), Knight.new("white"), Rook.new("white")]]

  def initialize
    @shape = START_SHAPE
  end

  def render
    puts "┌#{'─────' * 8}┐"
    @shape.each_with_index do |row, idx|
      puts render_row row, idx
    end
    puts "└#{'─────' * 8}┘"
    puts " #{('a'..'h').map { |letter| letter.center(5) }.join}"
  end

  private
  
  def render_row row, row_idx
    <<~ROW
      │#{build_line(row, row_idx, true)}│
      │#{build_line(row, row_idx, false)}│ #{8 - row_idx}
      │#{build_line(row, row_idx, true)}│
    ROW
  end

  def build_line row, row_idx, empty_row
    char = "     "
    line = ""
    row.each_with_index do |pos, pos_idx|
      char = "  #{@shape[row_idx][pos_idx].symbol}  " if !@shape[row_idx][pos_idx].nil? && !empty_row
      cell = colorize(char, (pos_idx + row_idx).even? ? BLUE : PURPLE, WHITE)
      line += cell
    end
    line
  end

  def colorize(char, bg, fg)
    "\e[48;2;#{bg.join(";")};38;2;#{fg.join(";")}m#{char}\e[0m"
  end
end
