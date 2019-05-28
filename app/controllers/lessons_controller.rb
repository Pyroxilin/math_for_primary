class LessonsController < ApplicationController
  def index
  end

  def show
    @tasks_count = Task.all.count

    task_id = params.fetch(:tid, 0).to_i
    @task = Task.find(task_id) || Task.find(0)
  end
end
