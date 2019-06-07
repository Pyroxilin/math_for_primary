class JoinController < ApplicationController
  def show
    session_token = params.fetch(:id)
    redirect_to exam_session_path(session_token)
  end
end
