class Exam < Struct.new(:title, :task_set_title, :scheduled_at, :status, keyword_init: true)
  EXAMS = [
    Exam.new(
      title: 'Группа 3',
      task_set_title: 'Преобразование выражений',
      scheduled_at: DateTime.parse('2019-06-30'),
      status: 'created'
    ),
    Exam.new(
      title: 'Группа 2',
      task_set_title: 'Преобразование выражений',
      scheduled_at: DateTime.parse('2019-06-29'),
      status: 'ongoing'
    ),
    Exam.new(
      title: 'Группа 1',
      task_set_title: 'Преобразование выражений',
      scheduled_at: DateTime.parse('2019-06-28'),
      status: 'finished'
    )
  ].freeze

  def self.all
    EXAMS
  end

  def ongoing?
    status == 'ongoing'
  end

  def finished?
    status == 'finished'
  end
end
