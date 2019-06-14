class Task < Struct.new(:id, :type, :description, :contents, :options, :answers, :hint,
                        keyword_init: true)
  def initialize(args)
    super
    return unless multiple_choice?

    self.options.map! { |raw| Option.new(text: raw['text'], correct: raw['correct']) }
  end

  def multiple_choice?
    type == 'multiple_choice'
  end

  def single_input?
    type == 'single_input'
  end

  def correct_answer?(answer)
    if multiple_choice?
      options.each.with_index.select { |o, _| o[:correct] }.map { |_, i| i }.sort == answer.map(&:to_i).sort
    elsif single_input?
      answers.permutation.any? { |variant| variant.join(' ') == answer.join.downcase }
    end
  end

  class << self
    def all
      TaskSet.all.flat_map(&:tasks)
    end

    def find(id)
      all.find { |task| task.id == id }
    end
  end
end
