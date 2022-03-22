module Enumerable
  # Your code goes here
  def my_each_with_index
    index = -1
    my_each do |obj|
      index += 1
      yield(obj, index)
    end
  end

  def my_select
    new_array = []
    my_each do |num|
      new_array << num if yield(num)
    end
    new_array
  end

  def my_all?
    my_each do |num|
      return false unless yield(num)
    end
    true
  end

  def my_any?
    my_each do |num|
      return true if yield(num)
    end
    false
  end

  def my_none?
    my_each do |num|
      return false if yield(num)
    end
    true
  end

  def my_count
    total_nums = 0
    my_each do |num|
      if block_given?
        total_nums += 1 if yield(num)

        next
      else
        total_nums += 1
      end
    end
    total_nums
  end

  def my_map
    new_array = []

    my_each do |obj|
      new_array << yield(obj)
    end

    new_array
  end

  def my_inject(init_val)
    my_each do |obj|
      init_val = yield(init_val, obj)
    end
    init_val
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    array_clone = clone
    while array_clone.length.positive?
      current_num = array_clone.shift
      yield(current_num)
    end
    self
  end
end
