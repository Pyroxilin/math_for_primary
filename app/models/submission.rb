class Submission < ActiveRecord::Base
  belongs_to :exam
  belongs_to :examinee

  validates_presence_of :exam, :examinee, :task_id, :contents

  def status
    task = Task.find(task_id)
    task.correct_answer?(contents) ? 'correct' : 'incorrect'
  end
end
