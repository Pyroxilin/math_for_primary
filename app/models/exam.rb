class Exam < ActiveRecord::Base
  include SessionTokenGeneration

  enum status: %w[created ongoing finished]

  belongs_to :user

  validates_presence_of :user, :title, :task_set_id, :status, :session_token
  validates_uniqueness_of :session_token

  def task_set
    TaskSet.find(task_set_id)
  end

  def self.find_by_token(token)
    ongoing.find_by!(session_token: token)
  end
end
