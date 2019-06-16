class ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :start, :stop]

  def index
    @exams = current_user.exams.order(created_at: :desc)
  end

  def show
  end

  def new
    @exam = Exam.new
  end

  def edit
  end

  def create
    @exam = current_user.exams.create(exam_params)
    @exam.valid? ? redirect_to(@exam) : render(:new)
  end

  def update
    # TODO: forbid to update task set for ongoing & finished exams
    @exam.update(exam_params) ? redirect_to(@exam) : render(:edit)
  end

  def destroy
    @exam.destroy
    redirect_to exams_path
  end

  def start
    @exam.update!(status: 'ongoing', started_at: Time.zone.now)
    redirect_to @exam
  end

  def stop
    @exam.update!(status: 'finished')
    redirect_to @exam
  end

  private

  def exam_params
    params.require(:exam).permit(:title, :task_set_id)
  end

  def set_exam
    @exam = current_user.exams.find(params.fetch(:id).to_i)
  end
end
