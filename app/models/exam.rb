class Exam < Struct.new(:id, :title, :task_set_title, :scheduled_at, :status, keyword_init: true)
  EXAMS = [
    Exam.new(
      id: 3,
      title: 'Группа 3',
      task_set_title: 'Преобразование выражений',
      scheduled_at: DateTime.parse('2019-06-30'),
      status: 'created'
    ),
    Exam.new(
      id: 2,
      title: 'Группа 2',
      task_set_title: 'Преобразование выражений',
      scheduled_at: DateTime.parse('2019-06-29'),
      status: 'ongoing'
    ),
    Exam.new(
      id: 1,
      title: 'Группа 1',
      task_set_title: 'Преобразование выражений',
      scheduled_at: DateTime.parse('2019-06-28'),
      status: 'finished'
    )
  ].freeze

  def self.all
    EXAMS
  end

  def self.find(id)
    EXAMS.find { |e| e.id == id }
  end

  def ongoing?
    status == 'ongoing'
  end

  def finished?
    status == 'finished'
  end
end
