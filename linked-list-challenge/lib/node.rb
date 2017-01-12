class Node
  attr_accessor :data, :next_node
  def initialize(data, next_node = nil)
    self.data = data

    @next_node = next_node
  end


  def info
    @data
  end

  def next_node
      @next_node
  end

end
