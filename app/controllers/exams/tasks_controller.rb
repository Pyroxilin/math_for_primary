module Exams
  class TasksController < ApplicationController
    layout 'exam_tasks'

    before_action :set_exam
    before_action :set_examinee

    def index
      task_id = params[:tid].to_i
      @current_task = @exam.task_set.tasks.find { |t| t.id == task_id }
      raise(ActionController::RoutingError, 'Not Found') unless @current_task

      @submission = @exam.submissions.find_by(examinee: @examinee, task_id: task_id)

      @tasks = @exam.task_set.tasks.map do |task|
        {
          id: task.id,
          status: ('submitted' if @exam.submissions.exists?(examinee: @examinee, task_id: task.id))
        }
      end
    end

    private

    def set_exam
      @exam = Exam.ongoing.find(params[:exam_id])
    end

    def set_examinee
      @examinee = Examinee.find_by(id: session['exam_sessions'][@exam.id.to_s])
      redirect_to new_exam_session_path(session_token: @exam.session_token) unless @examinee
    end
  end
end
