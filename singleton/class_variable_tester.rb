class ClassVariableTester
  # クラス変数
  @@class_count = 0

  def initialize
    @instance_count = 0
  end

  def increment
    @@class_count = @@class_count + 1
    @instance_count = @instance_count + 1
  end

  def to_s
    "class_count: #{@@class_count}, instance_count: #{@instance_count}"
  end
end

c1 = ClassVariableTester.new
c1.increment
c1.increment
# to_sつける前
# puts "c1: #{c1}" # => c1: #<ClassVariableTester:0x000000010710a8a8>

puts "c1: #{c1}" # => c1: class_count: 2, instance_count: 2

c2 = ClassVariableTester.new
puts "c2: #{c2}" # => c2: class_count: 2, instance_count: 0