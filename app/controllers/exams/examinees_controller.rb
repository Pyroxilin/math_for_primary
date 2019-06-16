module Exams
  class ExamineesController < ApplicationController
    before_action :authenticate_user!

    def show
      @examinee = Examinee.find(params[:id])
      @exam = current_user.exams.find(@examinee.exam_id)
      @tasks = @exam.task_set.tasks
      @submissions = @examinee.submissions
    end
  end
end
