require "./hash_map.rb"

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts test.get('grape')
puts test.get('jacket')
puts test.get('scarf')

puts test.has?('grape')
puts test.has?('scarf')
puts test.length

puts test.remove('jacket')
puts test.get('jacket')

puts test.keys
puts test.values
puts test.entries