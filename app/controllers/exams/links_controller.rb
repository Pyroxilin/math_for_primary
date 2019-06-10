module Exams
  class LinksController < ApplicationController
    layout 'exam_links'

    def index
      token = params.fetch(:exam_id)
      @exam = Exam.all.select(&:ongoing?).find { |e| e.session_token == token }
      raise(ActiveRecord::RecordNotFound) unless @exam
    end
  end
end
