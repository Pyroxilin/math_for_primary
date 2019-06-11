class ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exam, only: [:show, :edit]

  def index
    @exams = Exam.all
  end

  def show
  end

  def new
    @exam = Exam.new
  end

  def edit
  end

  private

  def set_exam
    @exam = Exam.find(params.fetch(:id).to_i)
  end
end
