
class Board

  WHITE = [255, 255, 255]
  BLACK = [0, 0, 0]
  PURPLE = [187, 120, 247]
  BLUE = [85, 85, 255]

  def initialize
    @shape = Array.new(8) { Array.new(8) }
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
      │#{build_line(row, row_idx, "     ")}│
      │#{build_line(row, row_idx, "  ♔  ")}│ #{8 - row_idx}
      │#{build_line(row, row_idx, "     ")}│
    ROW
  end

  def build_line row, row_idx, char
    line = ""
    row.each_with_index do |pos, pos_idx|
      cell = colorize(char, (pos_idx + row_idx).even? ? BLUE : PURPLE, WHITE)
      line += cell
    end
    line
  end

  def colorize(char, bg, fg)
    "\e[48;2;#{bg.join(";")};38;2;#{fg.join(";")}m#{char}\e[0m"
  end
end
