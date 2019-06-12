class Task < Struct.new(:id, :type, :description, :contents, :options, :answers,
                        keyword_init: true)
  def multiple_choice?
    type == 'multiple_choice'
  end

  def single_input?
    type == 'single_input'
  end

  class << self
    def all
      TaskSet.new.tasks
    end

    def find(id)
      all.find { |task| task.id == id }
    end
  end
end
