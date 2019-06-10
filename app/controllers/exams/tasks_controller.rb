module Exams
  class TasksController < ApplicationController
    layout 'exam_tasks'

    def index
      # exam = Exam.find(params[:exam_id])
      task_set = TaskSet.new # exam.task_set
      @tasks = TaskSet.new.tasks.map { |task| { id: task[:id], status: nil } }

      task_id = params.fetch(:tid, 0).to_i
      @current_task = task_set.tasks.fetch(task_id, task_set.tasks.first)
    end
  end
end
