class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.references :examinee, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.integer :task_id, null: false
      t.string :contents, null: false, array: true

      t.references
    end

    add_index :submissions, [:exam_id, :examinee_id, :task_id], unique: true
  end
end
