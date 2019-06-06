class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def show
  end

  def link
  end
end
