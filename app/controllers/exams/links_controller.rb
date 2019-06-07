module Exams
  class LinksController < ApplicationController
    layout 'exam_links'

    def index
      id = params.fetch(:exam_id).to_i
      @exam = Exam.all.select(&:ongoing?).find { |e| e.id == id }
      raise(ActiveRecord::RecordNotFound) unless @exam
    end
  end
end
