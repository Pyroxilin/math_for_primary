class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def show
  end

  def new
    @exam = Exam.new
  end

  def edit
    @exam = Exam.find(params.fetch(:id).to_i)
  end
end
