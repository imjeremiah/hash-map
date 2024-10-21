class HashMap
  attr_accessor :capacity, :load_factor

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @length = 0
    @buckets = Array.new(capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
        
    key.each_char { |char| hash_code = (prime_number * hash_code + char.ord) % @buckets.length }
    raise IndexError if hash_code.negative? || hash_code >= @buckets.length

    hash_code
  end

  def set(key, value)
    i = hash(key)
    @buckets[i] = [key, value]
    @length += 1
    resize if @length > @capacity * @load_factor
  end

  def resize
    new_capacity = @capacity * 2
    @buckets = Array.new(new_capacity)
  end

  def get(key)
    return nil if key.nil?

    key_value = hash(key)
    bucket = @buckets[key_value]

    return nil if bucket.nil?
    bucket[1]
  end

  def has?(key)
    return true if get(key)
    false
  end

  def remove(key)
    return nil if key.nil?

    key_value = hash(key)
    bucket = @buckets[key_value]

    return nil if bucket.nil?
    @buckets[key_value] = nil
    @length -= 1
  end

  def length
    @length
  end

  def clear
    @buckets = Array.new(capacity)
    @length = 0
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      keys.push(bucket[0]) if bucket != nil
    end
    keys.flatten
  end

  def values
    values = []
    @buckets.each do |bucket|
      values.push(bucket[1]) if bucket != nil
    end
    values.flatten
  end

  def entries
    entries = []
    @buckets.each do |bucket|
      entries.push(bucket) if bucket != nil
    end
    entries 
  end
end