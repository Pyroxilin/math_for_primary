module Course
  class TheoryController < ApplicationController
    layout "course"

    before_action :set_course_progress, only: [:show]

    THEORY_SECTIONS = {
      '1-1' => '1-1_formula_transformations',
      '1-2' => '1-2_skipping_actions',
      '1-3' => '1-3_complex_conditions',
      '2-1' => '2-1_general_information',
      '2-2' => '2-2_stage_1',
      '2-3' => '2-3_stage_2',
      '2-4' => '2-4_stage_3'
    }.freeze

    def index
      redirect_to course_theory_path('1-1')
    end

    def show
      @content_id = THEORY_SECTIONS.fetch(params[:id]) do
        raise(ActionController::RoutingError, 'Not Found')
      end
    end

    private

    def set_course_progress
      @course_progress = CourseProgress.new(:theory, params[:id])
    end
  end
end
