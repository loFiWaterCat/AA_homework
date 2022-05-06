class Map
  attr_reader :map, :keys
  def initialize
    @map = Array.new { Array.new }
    @keys = Array.new
  end

  def set(key, value)
    if @keys.include?(key)
      puts "This key already exists in the map. Please delete it first
      if you want to use this key."
      return
    end

    @keys << key
    @map << [key, value]
  end

  def get(key)
    if @keys.include?(key)
      @map.select {|el| el[0] == key}
    end
  end

  def delete(key)
    @keys = @keys.select {|el| el != key}

    @map = @map.select {|el| el[0] != key}
  end

  def show
    @map
  end
end
