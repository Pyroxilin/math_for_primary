module Course
  class TaskSetsController < ApplicationController
    layout "course"

    before_action :set_task_set
    before_action :init_session

    def show
      task_id = params[:tid].to_i
      @current_task = @task_set.tasks.find { |t| t.id == task_id }
      raise(ActionController::RoutingError, 'Not Found') unless @current_task

      @submission = find_submission(task_id)
      @tasks = @task_set.tasks.map do |task|
        submission = find_submission(task.id)
        {
          id: task.id,
          status: submission.present? ? submission.status : nil
        }
      end
    end

    def submit
      session['practice'][@task_set.id.to_s] ||= {}
      session['practice'][@task_set.id.to_s][submission_params[:task_id]] = submission_params[:contents]

      redirect_to course_task_set_path(@task_set.id, tid: submission_params[:task_id])
    end

    private

    def set_task_set
      @task_set = TaskSet.find(params[:id])
    end

    def init_session
      session['practice'] ||= {}
    end

    def submission_params
      params.require(:submission).permit(:task_id, contents: [])
    end

    def find_submission(task_id)
      content = session.dig('practice', @task_set.id.to_s, task_id.to_s)
      content ? Submission.new(task_id: task_id, contents: content) : nil
    end
  end
end
