class Node
    attr_accessor :value, :next_node
    
    def initialize(value = nil)
        @value = value
        @next_node = nil
    end
end

class LinkedList
    attr_reader :head, :tail, :size
    
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end
    
    def append(value)
      node = Node.new(value)
      if @head.nil?
        @head = node
        @tail = node
      else 
        @tail.next_node = node
        @tail = node
      end
      @size += 1
    end

    def prepend(value)
      node = Node.new(value)
      if @head.nil?
        @head = node
        @tail = node
      else
        node.next_node = @head
        @head = node
      end
      @size += 1
    end

    def size
      puts "Linked list is #{@size} long."
    end

    def head
      @head.value
    end

    def tail
      @tail.value
    end

    def at(index)
      return @head if index == 0
      return nil if index > @size
      current = @head
      index.times do |i|
        current = current.next_node
      end
      current
    end

    def pop
      current_node = @head
      until current_node.next_node.nil?
        previous_node = current_node
        current_node = current_node.next_node
      end
      @tail = previous_node
      @tail.next_node = nil
      @size -= 1
      current_node
    end

    def contains(value)
      current_node = @head
      until current_node.nil?
        return true if current_node.value == value
        current_node = current_node.next_node
      end
      false
    end

    def find(value)
      current_node = @head
      counter = 0 
      until current_node.nil?
        return counter if current_node.value == value
        current_node = current_node.next_node
        counter += 1
        end
        nil
      end

    def to_s
      current_node = @head
      str = ''
      @size.times do |i|
        str += "#{current_node.value} >> "
        current_node = current_node.next_node
      end
      str += 'nil'
    end
end

list = LinkedList.new

list.append(1)
list.append(20)
list.prepend(5)
list.prepend(3)
p list.head
p list.tail
p list.size
p list.contains(7)
p list.find(3)
p list.to_s
