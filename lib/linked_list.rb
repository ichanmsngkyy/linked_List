# frozen_string_literal: true

require_relative 'node'

# Use array for linkedlist
class LinkedList
  attr_accessor :head, :tail, :size

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
    node = Node.new(value, @head)
    @head = node
    @tail = node if @tail.nil?
    @size += 1
  end

  def at(index)
    return nil if index.negative? || index >= @size

    temp = @head
    index.times { temp = temp.next_node }
    temp
  end

  def pop
    return nil if @head.nil?

    if @head == @tail
      value = @head.value
      @head = nil
      @tail = nil
      @size -= 1
      return value
    end

    temp = @head
    temp = temp.next_node until temp.next_node == tail

    value = @tail.value
    temp.next_node = nil
    @tail = temp
    @size -= 1
    value
  end

  def contains?(value)
    return false if @head.nil?

    temp = @head
    until temp.nil?
      return true if temp.value == value

      temp = temp.next_node
    end
    false
  end

  def find(value)
    return false if @head.nil?

    temp = @head
    index = 0
    until temp.nil?
      return true if temp.value == value

      temp = temp.next_node
      index += 1
    end
    false
  end

  def to_s
    return false if @head.nil?

    temp = @head
    result = ''
    until temp.nil?
      result += "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    result += 'nil'
    result
  end

  def insert_at(value, index)
    return false if index.negative? || index >= @size

    if index == 0
      prepend(value)
      return
    end

    if index == @size
      append(value)
      return
    end
    temp = @head
    (index - 1).times { temp = temp.next_node }

    new_node = Node.new(value, temp.next_node)
    temp.next_node = new_node
    @size += 1
  end

  def remove_at(index)
    return false if index.negative? || index >= @size

    if index.zero?
      @head = @head.next_node
      @tail = nil if @head.nil?
      @size -= 1
      return true
    end
    temp = @head
    (index - 1).times { temp = temp.next_node }
    target_node = temp.next_node
    temp.next_node = target_node.next_node

    @tail = temp if target_node == @tail
    @size -= 1
    true
  end
end
