class TaskSetsController < ApplicationController
  layout "course"

  def show
    task_set = TaskSet.find(params.fetch(:id))
    @tasks_count = task_set.tasks.count

    task_id = params.fetch(:tid, 0).to_i
    @task = task_set.tasks.fetch(task_id, task_set.tasks.first)
  end
end
