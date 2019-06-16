module Course
  class TheoryController < ApplicationController
    layout "course"

    before_action :set_course_progress, only: [:show]

    def index
      redirect_to CourseProgress.step(0).url
    end

    def show
      @content_id = @course_progress.current_step.content_id
    end

    private

    def set_course_progress
      @course_progress = CourseProgress.find(:theory, params[:id])
      raise(ActionController::RoutingError, 'Not Found') unless @course_progress
    end
  end
end
