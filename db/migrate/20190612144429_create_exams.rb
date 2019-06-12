class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.datetime :started_at
      t.integer :status, null: false, default: 0
      t.integer :task_set_id, null: false
      t.string :session_token, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
