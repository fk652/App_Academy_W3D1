class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = []
    self.my_each do |elem|
      new_arr << elem if prc.call(elem)
    end
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each do |elem|
      new_arr << elem if !prc.call(elem)
    end
    new_arr
  end

  def my_any?(&prc)
    self.my_each do |elem|
      return true if prc.call(elem)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |elem|
      return false if !prc.call(elem)
    end
    true
  end

  def my_flatten(array = self)
    return array[0] if array.length == 1
    new_arr = []
    array.each do |ele|
      if ele.is_a?(Array)
        new_arr += self.my_flatten(ele)
      else
        new_arr << ele   
      end     
    end
    new_arr
  end
  
end

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# p return_value

a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# p a.my_reject { |num| num > 1 } # => [2, 3]
# p a.my_reject { |num| num == 4 } # => []

# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]