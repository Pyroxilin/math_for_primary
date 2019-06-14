class CreateExaminees < ActiveRecord::Migration[6.0]
  def change
    create_table :examinees do |t|
      t.string :username, null: false
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
