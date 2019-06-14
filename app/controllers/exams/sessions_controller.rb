module Exams
  class SessionsController < ApplicationController
    before_action :initialize_session

    def show
      @token = params.fetch(:id)
      @exam = find_exam(@token)

      examinee_id = session.dig('exam_sessions', @exam.id.to_s)
      @examinee = Examinee.find_by(id: examinee_id)

      redirect_to new_exam_session_path(session_token: @token) if @examinee.nil?
    end

    def new
      @session_token = params.fetch(:session_token)
    end

    def create
      username = session_params.fetch(:username)
      token = session_params.fetch(:token)
      exam = find_exam(token)

      examinee = exam.examinees.find_or_create_by(username: username)

      session['exam_sessions'][exam.id] = examinee.id
      redirect_to exam_tasks_path(exam.id)
    end

    def destroy
      token = params.fetch(:id)
      exam = find_exam(token)
      session['exam_sessions'][exam.id.to_s] = nil

      redirect_to new_exam_session_path(session_token: token)
    end

    private

    def initialize_session
      session['exam_sessions'] ||= {}
    end

    def find_exam(token)
      Exam.find_by_token(token) || raise(ActiveRecord::RecordNotFound, 'Not found')
    end

    def session_params
      params.require(:exam_session).permit(:token, :username)
    end
  end
end
