require './max_queue.rb'

def sliding_maximum(num, array)
  res_max = []
  maxqueue = MaxQueue.new

  count = 0
  (0..array.length - 1).each do |idx|
    count += 1
    if count > num
      maxqueue.take_off
      maxqueue.add(array[idx])
      res_max << maxqueue.maximum_value
    else
      maxqueue.add(array[idx])
    end
    res_max << maxqueue.maximum_value if count == num
  end
  res_max
end

# p sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]

# p sliding_maximum(4, [9, 3, 5, 1, 7, 10])
# => [5, 7, 9, 9]
