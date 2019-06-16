class CourseProgress
  class TheoryStep < Struct.new(:id, :title, :content_id, keyword_init: true)
    include Rails.application.routes.url_helpers

    def url
      course_theory_path(id)
    end
  end

  class PracticeStep < Struct.new(:id, :title, keyword_init: true)
    include Rails.application.routes.url_helpers

    def url
      course_task_set_path(id)
    end
  end

  COURSE_FLOW = [
    TheoryStep.new(
      id: '1-1',
      title: 'Преобразование выражений',
      content_id: '1-1_formula_transformations'
    ),
    PracticeStep.new(id: '1', title: 'Практика'),
    TheoryStep.new(
      id: '1-2',
      title: 'Невыполнение действий',
      content_id: '1-2_skipping_actions'
    ),
    PracticeStep.new(id: '2', title: 'Практика'),
    TheoryStep.new(
      id: '1-3',
      title: 'Усложнение  условий',
      content_id: '1-3_complex_conditions'
    ),
    TheoryStep.new(
      id: '2-1',
      title: 'Общая информация',
      content_id: '2-1_general_information'
    ),
    TheoryStep.new(
      id: '2-2',
      title: 'Этап 1: Усвоение теории арифметических действий',
      content_id: '2-2_stage_1'
    ),
    TheoryStep.new(
      id: '2-3',
      title: 'Этап 2: Сокращение помощи учителя, усвоение новых теоретических знаний',
      content_id: '2-3_stage_2'
    ),
    TheoryStep.new(
      id: '2-4',
      title: 'Этап 3: Самостоятельный поиск удобных способов вычислений',
      content_id: '2-4_stage_3'
    ),
    PracticeStep.new(id: '3', title: 'Практика')
  ].freeze

  TYPE_MAPPING = { theory: TheoryStep, practice: PracticeStep }.freeze

  attr_reader :current_step

  def initialize(step)
    @current_step = step
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

  class << self
    def find(type, id)
      step = COURSE_FLOW.find do |step|
        step.is_a?(TYPE_MAPPING.fetch(type)) && step.id == id
      end

      step ? new(step) : nil
    end

    def step(index)
      COURSE_FLOW[index]
    end
  end
end
