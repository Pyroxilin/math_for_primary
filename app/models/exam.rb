class Exam
  include ActiveModel::Model
  attr_accessor :id, :title, :task_set_id, :started_at, :status, :session_token

  EXAMS = [
    Exam.new(
      id: 3,
      title: 'Группа 3',
      task_set_id: 1,
      status: 'pending'
    ),
    Exam.new(
      id: 2,
      title: 'Группа 2',
      task_set_id: 1,
      started_at: DateTime.parse('2019-06-29T12:00:00+0300'),
      status: 'ongoing',
      session_token: 'EwLoc'
    ),
    Exam.new(
      id: 1,
      title: 'Группа 1',
      task_set_id: 1,
      started_at: DateTime.parse('2019-06-28T12:00:00+0300'),
      status: 'finished',
      session_token: '7kca7'
    )
  ].freeze

  def self.all
    EXAMS
  end

  def self.find(id)
    EXAMS.find { |e| e.id == id.to_i }
  end

  def self.find_by_token(token)
    Exam.all.select(&:ongoing?).find { |e| e.session_token == token }
  end

  def task_set
    TaskSet.find(task_set_id)
  end

  def new_record?
    to_h.values.none?
  end

  def to_h
    {
      id: id,
      title: title,
      task_set_id: task_set_id,
      started_at: started_at,
      status: status
    }
  end

  def pending?
    status == 'pending'
  end

  def ongoing?
    status == 'ongoing'
  end

  def finished?
    status == 'finished'
  end
end
