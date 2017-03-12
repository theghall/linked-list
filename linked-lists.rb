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
    self.tail = self.tail.next = node unless head == nil

    self.head = self.tail = node if head == nil

    self.size += 1
  end

  def prepend(node)
    if head == nil
      append(node)
    else
      node.next = head == nil ? nil : head

     self.head = node

     self.size += 1

     self.tail = node if node.next == nil
    end
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
    return nil if index < 1 || index  > size

    if index == 1
      node = head

      self.head = head.next if head != tail

      self.head = self.tail = nil if head == tail
    else
      prev_node = get_prev_node(index)

      node = prev_node.next

      prev_node.next = node.next

      self.tail = prev_node
    end

    self.size -=1
    
    node
  end

  def pop
    return nil if head == nil

    if head == tail
      pop_node = head

      self.head = self.tail = nil
    else
     node = head

     (self.size - 2).times { node = node.next }

     pop_node = node.next

     node.next = nil

     self.tail = node
    end

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
      found = true if node.value == value
     
      break if found

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

def print_list_stats(list)
  puts("size: #{list.size}")
  puts("head: >>#{list.head}<<")
  puts("tail: >>#{list.tail}<<")
  list.print_list if list.head != nil
  puts('List is empty') if list.head == nil
end

def empty_tests
  a_list = LinkedList.new
  b_list = LinkedList.new

  puts("\n\nEmpty list tests:")
  puts("prepend:")
  b_list.prepend(Node.new('succeed'))
  print_list_stats(b_list)
  puts("at(1): #{a_list.at(1)}")
  puts("pop : #{a_list.pop}")
  puts("contains?('fail'): #{a_list.contains?('fail')}")
  puts("find('fail'): #{a_list.find('fail')}")
  puts("insert_at('fail',1): #{a_list.insert_at(Node.new('fail'),1)}")
  puts("head: >>#{a_list.head}<<")
  puts("remove_at(1): #{a_list.remove_at(1)}")
  puts("head: >>#{a_list.head}<<")
  puts("append test:")
  a_list.append(Node.new('append'))
  print_list_stats(a_list)
end

def single_node_tests
  a_list = LinkedList.new

  puts("\n\nSingle node tests:")
  a_list.append(Node.new('append'))
  print_list_stats(a_list)
  puts("at(0): >>#{a_list.at(0)}<<")
  puts("at(1): >>#{a_list.at(1)}<<")
  puts("contains?('append'): #{a_list.contains?('append')}")
  puts("find('append'): #{a_list.find('append')}")
  puts("pop: #{a_list.pop}")
  print_list_stats(a_list)

  puts("Create new list...")
  a_list = LinkedList.new
  a_list.append(Node.new('append'))
  puts("insert_at(1): #{a_list.insert_at(Node.new('first'),1)}")
  print_list_stats(a_list)

  puts("Create new list...")
  a_list = LinkedList.new
  a_list.append(Node.new('append'))
  puts("remove_at(1): #{a_list.remove_at(1)}")
  print_list_stats(a_list)
end

empty_tests
single_node_tests

