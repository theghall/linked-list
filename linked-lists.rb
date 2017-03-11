# linked-lists.rb
#
# 20170310	GH
#
require 'byebug'

class Node
  attr_accessor :value, :next

  def initialize(data, next_node = nil)
    @value = data

    @next = next_node
  end

  def to_s
    value
  end
end

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def print_list
    node = head

    until node == nil
      print("(#{node})->")
      node = node.next
    end

    print("nil\n")
  end

  def append(node)
    self.head = self.tail = node if head == nil

    self.tail = self.tail.next = node unless head == nil

    self.size += 1
  end

  def prepend(node)
    node.next = head == nil ? nil : head

    self.head = node

    self.size += 1

    tail = node if node.next == nil
  end

  # returns nil if out of bounds, inode otherwise
  def insert_at(inode, index)
    return nil if index < 1 || index > size

    prev_node = get_prev_node(index) unless index == 1

    if index > 1
      inode.next = prev_node.next

      prev_node.next = inode

      self.size += 1
    else
      prepend(inode)
    end

    inode
  end 

  # returns nil if out of bounds or removed node otherwise
  def remove_at(index)
    return nil if index < 1 or index  > size

    if index == 1
      node = head

      self.head = head.next
    else
      prev_node = get_prev_node(index)

      node = prev_node.next

      prev_node.next = node.next
    end

    self.size -=1
    
    node
  end

  def pop
    return nil if head == nil

    node = head

    (self.size - 2).times { node = node.next }

    pop_node = node.next

    node.next = nil

    tail = node

    self.size -= 1

    pop_node
  end

  # 1 based index
  def at(index)
    return nil if index > size

    node = head

    index.times { node = node.next }

    node
  end

  def contains?(value)
    found = false

    node = head

    until node == nil
      if node.value == value
        found = true
        break
      end
      
      node = node.next
    end

    found
  end

  def find(value)
    index = 0

    node = head

    until node == nil
      index += 1

      break if node.value == value

      node = node.next
    end
      
    index = nil if node == nil

    index
  end

  def size
    @size
  end
  
  private

  def get_prev_node(index)
    prev_node = node = head

    (index - 1).times do
      prev_node = node 
      node = node.next
    end

    prev_node
  end

  def head=(node)
    @head = node
  end

  def tail=(node)
    @tail = node
  end

  def size=(num)
    @size = num
  end
end

array = %w(This is a singly linked list)

a_list = LinkedList.new

array.each do |word|
  a_list.append(Node.new(word))
end

a_list.print_list

puts("Linked list size: #{a_list.size}")

puts("Head node: #{a_list.head}")

puts("Tail node: #{a_list.tail}")

puts("The fourth node is: #{a_list.at(4)}")

puts("Remove last element")
puts("Removed: #{a_list.pop}")

puts("Linked list size: #{a_list.size}")

a_list.print_list

puts("The list contains 'singly': #{a_list.contains?('singly')}")

puts("The list contains 'linked': #{a_list.contains?('linked')}")

puts("The list contains 'doubly': #{a_list.contains?('doubly')}")

puts("Prepend 'Wow'")

a_list.prepend(Node.new('Wow'))

puts("Linked list size: #{a_list.size}")

a_list.print_list

puts("'singly' is located at index: #{a_list.find('singly')}")

puts("Insert at 'Really' at index 1:")

a_list.insert_at(Node.new('Really'), 1)

puts("Linked list size: #{a_list.size}")

a_list.print_list

puts("Insert at 'nifty' at index 2:")

a_list.insert_at(Node.new('nifty'), 2)

puts("Linked list size: #{a_list.size}")

a_list.print_list

puts("Insert at 'Cool!' at index 8:")

a_list.insert_at(Node.new('Cool!'), 8)

puts("Linked list size: #{a_list.size}")

a_list.print_list

puts("Remove index 8:")

puts("Removed: #{a_list.remove_at(8)}")

puts("Linked list size: #{a_list.size}")

a_list.print_list

puts("Remove index 1:")

puts("Removed: #{a_list.remove_at(1)}")

puts("Linked list size: #{a_list.size}")

a_list.print_list

puts("Remove tail:")

puts("Removed: #{a_list.remove_at(a_list.size)}")

puts("Linked list size: #{a_list.size}")

a_list.print_list






