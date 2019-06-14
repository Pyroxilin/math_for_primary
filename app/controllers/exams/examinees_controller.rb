module Exams
  class ExamineesController < ApplicationController
    def show
      @examinee = Examinee.find(params[:id])
      @exam = @examinee.exam
      @tasks = @exam.task_set.tasks
      @submissions = @examinee.submissions
    end
  end
end
