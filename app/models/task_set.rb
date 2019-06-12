class TaskSet < Struct.new(:id, :title, :tasks, keyword_init: true)
  class << self
    def find(id)
      TASK_SETS[id.to_i] || raise(ActiveRecord::RecordNotFound)
    end

    def all
      TASK_SETS.values
    end

    private

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

  TASK_SETS = parse_task_sets(YAML.load_file('app/data/task_sets.yml'))
end
