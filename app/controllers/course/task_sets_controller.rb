module Course
  class TaskSetsController < ApplicationController
    layout "course"

    def show
      task_set = TaskSet.find(params.fetch(:id))
      @tasks = task_set.tasks.map { |task| { id: task.id, status: nil } }

      task_id = params.fetch(:tid, 0).to_i
      @current_task = task_set.tasks.find { |t| t.id == task_id } || task_set.tasks.first
    end
  end
end
