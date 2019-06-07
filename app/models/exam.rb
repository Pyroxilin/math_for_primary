class Exam
  include ActiveModel::Model
  attr_accessor :id, :title, :task_set_title, :started_at, :status

  EXAMS = [
    Exam.new(
      id: 3,
      title: 'Группа 3',
      task_set_title: 'Преобразование выражений',
      status: 'created'
    ),
    Exam.new(
      id: 2,
      title: 'Группа 2',
      task_set_title: 'Преобразование выражений',
      started_at: DateTime.parse('2019-06-29T12:00:00+0300'),
      status: 'ongoing'
    ),
    Exam.new(
      id: 1,
      title: 'Группа 1',
      task_set_title: 'Преобразование выражений',
      started_at: DateTime.parse('2019-06-28T12:00:00+0300'),
      status: 'finished'
    )
  ].freeze

  def self.all
    EXAMS
  end

  def self.find(id)
    EXAMS.find { |e| e.id == id }
  end

  def new_record?
    to_h.values.none?
  end

  def to_h
    {
      id: id,
      title: title,
      task_set_title: task_set_title,
      started_at: started_at,
      status: status
    }
  end

  def ongoing?
    status == 'ongoing'
  end

  def finished?
    status == 'finished'
  end
end
