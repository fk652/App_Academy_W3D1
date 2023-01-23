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

  def my_zip(*args)
    new_arr = []
    (0..self.length-1).each do |index|
      sub_arr = []
      sub_arr << self[index]
      args.each do |arr|
        sub_arr << arr[index]
      end
      new_arr << sub_arr
    end
    new_arr
  end
  
  def my_rotate(num=1)
    new_arr = self.dup
    if num > 0
      num.times { new_arr.push(new_arr.shift) }
    else
      (num * -1).times { new_arr.unshift(new_arr.pop) }
    end
    new_arr
  end

  def 
end

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# p return_value

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# p a.my_reject { |num| num > 1 } # => [2, 3]
# p a.my_reject { |num| num == 4 } # => []

# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]