class ArrayIterator
  def initialize(array)
    @array = array.clone
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

if __FILE__ == $0
  i = ArrayIterator.new(%w(vmware pivotal google))
  puts "item: #{i.next_item}" while i.has_next?
end
