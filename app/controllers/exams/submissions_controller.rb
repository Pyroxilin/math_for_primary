module Exams
  class SubmissionsController < ApplicationController
    before_action :set_exam
    before_action :set_examinee

    def create
      task = @exam.task_set.tasks.find { |t| t.id == submission_params[:task_id].to_i }
      raise(ActiveRecord::RecordNotFound, 'Not found') unless task

      @exam
        .submissions
        .create_with(contents: submission_params[:contents])
        .find_or_create_by(examinee: @examinee, task_id: task.id)
        .update(contents: submission_params[:contents])

      redirect_to exam_tasks_path(@exam, tid: task.id)
    end

    private

    def submission_params
      params.require(:submission).permit(:task_id, contents: [])
    end

    def set_exam
      @exam = Exam.ongoing.find(params[:exam_id])
    end

    def set_examinee
      @examinee = Examinee.find(session['exam_sessions'][@exam.id.to_s])
    end
  end
end
