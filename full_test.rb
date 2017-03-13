# full_test.rb
#
# Test suite for LinkedList::LinkedList
#
# 20170312	GH
#
require './linked-lists'

def print_list_state(list)
  puts("size: #{list.size}")
  puts("head: >>#{list.head}<<")
  puts("tail: >>#{list.tail}<<")
  list.print_list if list.head != nil
  puts('List is empty') if list.head == nil
end

def empty_tests
  a_list = LinkedList::LinkedList.new
  b_list = LinkedList::LinkedList.new

  puts("\n\nEmpty list tests:")
  puts("prepend:")
  b_list.prepend(LinkedList::Node.new('succeed'))
  print_list_state(b_list)
  puts("at(1): #{a_list.at(1)}")
  puts("pop : #{a_list.pop}")
  puts("contains?('fail'): #{a_list.contains?('fail')}")
  puts("find('fail'): #{a_list.find('fail')}")
  puts("insert_at('fail',1): #{a_list.insert_at(LinkedList::Node.new('fail'),1)}")
  puts("head: >>#{a_list.head}<<")
  puts("remove_at(1): #{a_list.remove_at(1)}")
  puts("head: >>#{a_list.head}<<")
  puts("append test:")
  a_list.append(LinkedList::Node.new('append'))
  print_list_state(a_list)
end

def single_node_tests
  a_list = LinkedList::LinkedList.new

  puts("\n\nSingle node tests:")
  a_list.append(LinkedList::Node.new('append'))
  print_list_state(a_list)
  puts("at(0): >>#{a_list.at(0)}<<")
  puts("at(1): >>#{a_list.at(1)}<<")
  puts("contains?('append'): #{a_list.contains?('append')}")
  puts("find('append'): #{a_list.find('append')}")
  puts("pop: #{a_list.pop}")
  print_list_state(a_list)

  puts("Create new list...")
  a_list = LinkedList::LinkedList.new
  a_list.append(LinkedList::Node.new('append'))
  puts("insert_at(1): #{a_list.insert_at(LinkedList::Node.new('first'),1)}")
  print_list_state(a_list)

  puts("Create new list...")
  a_list = LinkedList::LinkedList.new
  a_list.append(LinkedList::Node.new('append'))
  puts("remove_at(1): #{a_list.remove_at(1)}")
  print_list_state(a_list)
end

def multi_node_tests
  puts("\n\nMulti node tests:")
  a_list = LinkedList::LinkedList.new
  a_list.append(LinkedList::Node.new("First"))
  a_list.append(LinkedList::Node.new("Second"))
  print_list_state(a_list)

  puts("add node:")
  a_list.append(LinkedList::Node.new("Third"))
  print_list_state(a_list)

  puts("at(2): #{a_list.at(2)}")
  puts("at(3): #{a_list.at(3)}")

  puts("contains?(First): #{a_list.contains?('First')}")
  puts("contains?(Second): #{a_list.contains?('Second')}")
  puts("contains?(third): #{a_list.contains?('Third')}")

  puts("find(First): #{a_list.find('First')}")
  puts("find(Second): #{a_list.find('Second')}")
  puts("find(third): #{a_list.find('Third')}")

  puts("pop: #{a_list.pop}")
  print_list_state(a_list)

  puts("insert_at(2):")
  a_list.insert_at(LinkedList::Node.new("push1"),2)
  print_list_state(a_list)

  puts("insert_at(3):")
  a_list.insert_at(LinkedList::Node.new("push2"),3)
  print_list_state(a_list)

  puts("remove_at(2):")
  a_list.remove_at(2)
  print_list_state(a_list)

  puts("remove_at(3):")
  a_list.remove_at(3)
  print_list_state(a_list)

end

empty_tests
single_node_tests
multi_node_tests
