class TaskSet < Struct.new(:id, :title, :tasks, keyword_init: true)
  class << self
    def find(id)
      task_sets[id.to_i] || raise(ActiveRecord::RecordNotFound)
    end

    def all
      task_sets.values
    end

    private

    def task_sets
      parse_task_sets(YAML.load_file('app/data/task_sets.yml'))
    end

    def parse_task_sets(raw_task_sets)
      raw_task_sets.map do |raw_ts|
        [
          raw_ts['id'],
          TaskSet.new(
            id: raw_ts['id'],
            title: raw_ts['title'],
            tasks: raw_ts['tasks'].map { |raw_task| Task.new(**raw_task.symbolize_keys)}
          )
        ]
      end.to_h
    end
  end
end
