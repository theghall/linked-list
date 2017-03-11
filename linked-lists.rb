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
    node.next = head

    self.head = node

    self.size += 1
  end

  def insert_at(inode, index)
    node = head

    index.times - 1.times { node = node.next }

     

  def pop
    node = head

    until node.next == tail do
     node = node.next
    end

    node.next = nil

    tail = node

    self.size -= 1
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
a_list.pop

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
