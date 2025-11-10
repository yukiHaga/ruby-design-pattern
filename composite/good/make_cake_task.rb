# composite
module CompositeTask
  attr_accessor :tasks
  def initialize(tasks)
    @tasks = tasks
  end

  def add_task(task)
    tasks << task
  end

  def delete_task(task)
    tasks.delete(task)
  end

  def required_time
    total_time = 0
    tasks.each do |task|
      total_time += task.required_time # delegation
    end
    total_time
  end
end

# composite
class MakeCakeTask
  include CompositeTask
end

class MakeButterTask
  include CompositeTask
end

# leaf
class AddLiquidsTask
  def required_time
    5
  end
end

class MixTask
  def required_time
    10
  end
end

l = AddLiquidsTask.new
m = MixTask.new
mb = MakeButterTask.new([l, m])
mc = MakeCakeTask.new([mb])
puts mc.required_time # => 15