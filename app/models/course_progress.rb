class CourseProgress
  class TheoryStep < Struct.new(:id, :title)
    include Rails.application.routes.url_helpers

    def url
      course_theory_path(id)
    end
  end

  class PracticeStep < Struct.new(:id, :title)
    include Rails.application.routes.url_helpers

    def url
      course_task_set_path(id)
    end
  end

  COURSE_FLOW = [
    TheoryStep.new('1-1', 'Преобразование выражений'),
    PracticeStep.new('1', 'Практика'),
    TheoryStep.new('1-2', 'Невыполнение действий'),
    PracticeStep.new('2', 'Практика'),
    TheoryStep.new('1-3', 'Усложнение  условий'),
    TheoryStep.new('2-1', 'Общая информация'),
    TheoryStep.new('2-2', 'Этап 1: Усвоение теории арифметических действий'),
    TheoryStep.new('2-3', 'Этап 2: Сокращение помощи учителя, усвоение новых теоретических знаний'),
    TheoryStep.new('2-4', 'Этап 3: Самостоятельный поиск удобных способов вычислений'),
    PracticeStep.new('3', 'Практика')
  ].freeze

  TYPE_MAPPING = { theory: TheoryStep, practice: PracticeStep }.freeze

  def initialize(type, id)
    @current_step = COURSE_FLOW.find do |step|
      step.is_a?(TYPE_MAPPING.fetch(type)) && step.id == id
    end
  end

  def prev?
    COURSE_FLOW.index(current_step) > 0
  end

  def next?
    COURSE_FLOW.index(current_step) < COURSE_FLOW.size - 1
  end

  def step_number
    COURSE_FLOW.index(current_step) + 1
  end

  def steps_count
    COURSE_FLOW.size
  end

  def next_url
    return nil unless next?

    next_step = COURSE_FLOW[COURSE_FLOW.index(current_step) + 1]
    next_step.url
  end

  def prev_url
    return nil unless prev?

    prev_step = COURSE_FLOW[COURSE_FLOW.index(current_step) - 1]
    prev_step.url
  end

  private

  attr_reader :current_step
end
