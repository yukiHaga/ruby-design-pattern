class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "アヒル #{@name} は食事中です。"
  end

  def speak
    puts "アヒル #{@name} はガーガー鳴いてます。"
  end

  def sleep
    puts "アヒル #{@name} は眠っています。"
  end
end

class Flog
  def initialize(name)
    @name = name
  end

  def eat
    puts "フロッグ #{@name} は食事中です。"
  end

  def speak
    puts "フロッグ #{@name} はケツケツ鳴いてます。"
  end

  def sleep
    puts "フロッグ #{@name} は眠りません。一晩中ゲロゲロ鳴いてます。"
  end
end

class Pond
  def initialize(number_ducks)
    @animals = []
    number_ducks.times do |i|
      animal = new_animal(i)
      @animals << animal
    end
  end

  def simulate_one_day
    @animals.each { |animal| animal.speak }
    @animals.each { |animal| animal.eat }
    @animals.each { |animal| animal.sleep }
  end
end

class DuckPond < Pond
  def new_animal(index)
    Duck.new("アヒル#{index}")
  end
end

class FlogPond < Pond
  def new_animal(index)
    Flog.new("フロッグ#{index}")
  end
end

pond = DuckPond.new(2)
pond.simulate_one_day

pond = FlogPond.new(2)
pond.simulate_one_day