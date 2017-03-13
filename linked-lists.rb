# linked-lists.rb
#
# 20170310	GH
#
module LinkedList
  # Linked List Node (Singly linked)
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

  # Implements a Ruby Linked List
  class LinkedList
    attr_reader :head, :tail, :size

    def initialize
      @head = nil

      @tail = nil

      @size = 0
    end

    def print_list
      node = head

      until node.nil?
        print("(#{node})->")

        node = node.next
      end

      print("nil\n")
    end

    def append(node)
      self.tail = self.tail.next = node unless head.nil?

      self.head = self.tail = node if head.nil?

      self.size += 1
    end

    def prepend(node)
      if head.nil?
        append(node)
      else
        node.next = head.nil? ? nil : head

        self.head = node

        self.tail = node if node.next.nil?

        self.size += 1
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
      return nil if index < 1 || index > size

      node = remove_at_head if index == 1

      node = remove_after_head(index) if index > 1

      self.size -= 1

      node
    end

    def pop
      return nil if head.nil?

      if head == tail
        pop_node = head

        self.head = self.tail = nil
      else
        prev_node = get_prev_node(size)

        pop_node = prev_node.next

        prev_node.next = nil

        self.tail = prev_node
      end

      self.size -= 1

      pop_node
    end

    # 1 based index
    def at(index)
      return nil if index < 1 || index > size

      node = head

      (index - 1).times { node = node.next }

      node
    end

    def contains?(value)
      found = false

      node = head

      until node.nil?
        found = true if node.value == value

        break if found

        node = node.next
      end

      found
    end

    def find(value)
      index = 0

      node = head

      until node.nil?
        index += 1

        break if node.value == value

        node = node.next
      end

      index = nil if node.nil?

      index
    end

    private

    attr_writer :head, :tail, :size

    def get_prev_node(index)
      prev_node = node = head

      (index - 1).times do
        prev_node = node
        node = node.next
      end

      prev_node
    end

    def remove_at_head
      node = head

      self.head = head.next if head != tail

      self.head = self.tail = nil if head == tail

      node
    end

    def remove_after_head(index)
      prev_node = get_prev_node(index)

      node = prev_node.next

      prev_node.next = node.next

      self.tail = prev_node if tail == node

      node
    end
  end
end
