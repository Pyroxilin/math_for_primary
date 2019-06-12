module Exams
  class LinksController < ApplicationController
    layout 'exam_links'

    before_action :authenticate_user!

    def index
      token = params.fetch(:exam_id)
      @exam = Exam.find_by_token(token)
    end
  end
end
