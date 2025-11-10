# Compositeパターンなしの実装

# コンポジットタスク（バターを作るタスク）
class MakeButterTask
  attr_accessor :liquids_task, :mix_task

  def initialize(liquids_task, mix_task)
    @liquids_task = liquids_task
    @mix_task = mix_task
  end

  def required_time
    time = 0
    # 各タスクを個別に扱う必要がある
    time += @liquids_task.required_time if @liquids_task
    time += @mix_task.required_time if @mix_task
    time
  end
end

# コンポジットタスク（ケーキを作るタスク）
class MakeCakeTask
  attr_accessor :subtasks

  def initialize(subtasks)
    @subtasks = subtasks
  end

  def add_subtask(task)
    # タスクの種類によって追加方法を変える必要がある
    if task.is_a?(MakeButterTask)
      @subtasks[:butter_task] = task
    elsif task.is_a?(AddLiquidsTask)
      @subtasks[:liquids_task] = task
    elsif task.is_a?(MixTask)
      @subtasks[:mix_task] = task
    # 新しいタスクタイプが増えたらここも修正が必要
    end
  end

  def required_time
    total_time = 0
    @subtasks.each do |key, task|
      # タスクの種類を意識した処理が必要
      case task
      when MakeButterTask
        total_time += task.required_time
      when AddLiquidsTask
        total_time += task.required_time
      when MixTask
        total_time += task.required_time
      # 新しいタスクタイプが増えたらここも修正が必要
      end
    end
    total_time
  end
end

# リーフタスク
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

# 使用例
l = AddLiquidsTask.new
m = MixTask.new
mb = MakeButterTask.new(l, m)
mc = MakeCakeTask.new({butter_task: mb})
puts mc.required_time # => 15

user_names = ["alice", "bob", "charlie"]

def each_user_names(user_names)
  i = 0
  while i < user_names.length
    yield(user_names[i])
    i += 1
  end
end

each_user_names(user_names) { |x| puts x}
# => alice
#    bob
#    charlie
