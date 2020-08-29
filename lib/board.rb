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

  def valid_coordinate?(alphanumeric)
    @cells.keys.include?(alphanumeric)
  end

  def valid_placement?(ship_type, spots)
    if coordinate_equal?(ship_type, spots) && ((consecutive_numbers?(spots) && all_letters_same?(spots)) || (consecutive_letters?(spots) && all_numbers_same?(spots)))
      return true
    elsif !all_letters_same?(spots) && !all_numbers_same?(spots)
      return false
    else
      return false
    end
  end

  def all_letters_same?(spots)
    find_letters(spots).uniq.length == 1
  end

  def all_numbers_same?(spots)
    find_digits(spots).uniq.length == 1
  end

  def coordinate_equal?(ship_type, spots)
    ship_type.length == spots.length
  end

  def find_digits(spots)
    digits = spots.map do |spot|
      spot[1].to_i
    end
  end

  def find_letters(spots)
    letters = spots.map do |spot|
      if spot.each_char != Integer
        spot.ord
      end
    end
  end

  def consecutive_numbers?(spots)
    set = @rows.each_cons(spots.length).to_a
    check = find_digits(spots).each_cons(spots.length).to_a
    set.any? do |group_element|
      group_element == check.flatten
    end
  end

  def consecutive_letters?(spots)
    set = make_letters_ord_numbers.each_cons(spots.length).to_a
    check = find_letters(spots).each_cons(spots.length).to_a
  end

  def make_letters_ord_numbers
    @columns.map do |letter|
      letter.ord
    end
  end
end
