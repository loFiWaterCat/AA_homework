class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [:stone, :stone, :stone, :stone] }
    @cups[6] = []
    @cups[13] = []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12 || start_pos == 6 || start_pos == 13
      raise "Invalid starting cup"
    end

    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    curr_pos = start_pos + 1

    while num_stones > 0
      if curr_pos == 6 && current_player_name == @name1
        @cups[curr_pos] << :stone
        num_stones -= 1
        curr_pos += 1
      elsif curr_pos == 13 && current_player_name == @name2
        @cups[curr_pos] << :stone
        num_stones -= 1
        curr_pos += 1
      elsif curr_pos <= 12 && curr_pos != 6 && curr_pos != 13
        p num_stones
        @cups[curr_pos] << :stone
        num_stones -= 1
        curr_pos += 1
      end
    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
