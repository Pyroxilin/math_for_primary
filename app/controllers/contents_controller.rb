class ContentsController < ApplicationController
  layout "course"

  def index
    redirect_to content_path('1-1_formula_transformations')
  end

  def show
    @content_id = params.fetch(:id, '1-1_formula_transformations')
  end
end
