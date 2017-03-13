# demo.rb
#
# 20120313	GH
#
require './linked-lists'

def print_list_state(list)
  list.print_list
  puts("Head: >>#{list.head}<< Tail:>>#{list.tail}<< Size: #{list.size}")
end
ary = %w(This is a linled list x)

a_list = LinkedList::LinkedList.new

puts("--------------------------------------------")
puts("Empty list:")
print_list_state(a_list)
puts("--------------------------------------------")

puts("Append words from #{ary} into an empty list:")

ary.each do |word|
  a_list.append(LinkedList::Node.new(word))
end

print_list_state(a_list)
puts("--------------------------------------------")

puts("Pop last node: #{a_list.pop}")

print_list_state(a_list)
puts("--------------------------------------------")

puts("Find 'linled':")
index = a_list.find('linled')

puts("Found at index: #{index}")
puts("--------------------------------------------")
puts("remove_at(#{index}): #{a_list.remove_at(index)}")

print_list_state(a_list)
puts("--------------------------------------------")
puts("insert_at('linked',#{index})")

a_list.insert_at(LinkedList::Node.new('linked'),index)

print_list_state(a_list)
puts("--------------------------------------------")
puts("Prepend 'Look:'")

a_list.prepend(LinkedList::Node.new('Look:'))

print_list_state(a_list)
puts("--------------------------------------------")
puts("at(2): #{a_list.at(2)}")
puts("--------------------------------------------")
puts("contains('This'): #{a_list.contains?('This')}")
puts("--------------------------------------------")
puts("contains('doubly'): #{a_list.contains?('doubly')}")
puts("--------------------------------------------")
