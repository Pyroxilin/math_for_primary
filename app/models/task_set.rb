class TaskSet
  def self.find(id)
    TaskSet.new
  end

  def tasks
    Task::TASKS
  end
end
