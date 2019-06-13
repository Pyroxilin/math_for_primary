module Exams
  class TasksController < ApplicationController
    layout 'exam_tasks'

    def index
      task_set = Exam.find(params[:exam_id]).task_set
      @tasks = task_set.tasks.map { |task| { id: task.id, status: nil } }

      task_id = params.fetch(:tid, 0).to_i
      @current_task = task_set.tasks.find { |t| t.id == task_id } || task_set.tasks.first
    end
  end
end
