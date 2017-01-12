require 'pry'
require_relative 'node'

class LinkedList
  def initialize
   @head = nil
  end

  def head
    @head
  end


  def prepend(value)
    @head = Node.new(value, @head)

  end

  def [](index)
    node = @head
    current_index = 0
    until current_index == index || node.nil?
      node = node.next_node
      current_index += 1
    end
    node
  end

  def to_s
    list = []
    current_node = @head
    until current_node.nil?
      list << current_node.data
      current_node = current_node.next_node

    end
    return ("LinkedList(" + list.join(", ") + ")")
  end

  def each
    node = @head

    while !node.nil?
      yield(node)
      node = node.next_node
    end
  end

  def insert(index, value)
		if index == 0
			prepend(value)
		else
      i = 1
      node = @head

      while true
        if i == index
          @previous_node = node
  				@past_node = node.next_node if node.next_node != nil
  				new_node = Node.new(value)
  				@previous_node.next_node = new_node
  				new_node.next_node = @past_node
          return
        else
          node = node.next_node if node.next_node != nil
        end
        i += 1
      end
    end
  end

  def remove(index)
		node = @head

		if index == 0
			@head = @head.next_node
			return
		end

		i = 1

		while true
			if i == index
				@previous_node = node
				@past_node = node.next_node.next_node if node.next_node.next_node != nil
				@previous_node.next_node = @past_node
				return
			end
			node = node.next_node
			i += 1
		end
		return
	end

end
