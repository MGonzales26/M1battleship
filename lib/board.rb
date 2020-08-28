class Board
  attr_reader :cells, :rows, :columns
  def initialize
    @cells = {}
    @rows = rows
    @columns = columns
  end

  def make_board_size
    board_size = 4
    alphabet = ("A".."Z").to_a
    @rows = (1..(board_size)).to_a
    @columns = ("A"..alphabet[board_size -1]).to_a
    coordinates = @columns.map do |letter|
      @rows.map do |number|
        letter + number.to_s
      end
    end
    coordinates.flatten
  end

  def cells
    make_board_size.map do |key|
      @cells[key] = Cell.new(key)
    end
    @cells
  end
end
