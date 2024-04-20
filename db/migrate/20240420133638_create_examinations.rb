class CreateExaminations < ActiveRecord::Migration[7.1]
  def change
    create_table :examinations do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :token
      t.date :date

      t.timestamps
    end
  end
end
