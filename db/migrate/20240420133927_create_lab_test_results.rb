class CreateLabTestResults < ActiveRecord::Migration[7.1]
  def change
    create_table :lab_test_results do |t|
      t.references :examination, null: false, foreign_key: true
      t.references :lab_test, null: false, foreign_key: true
      t.string :result

      t.timestamps
    end
  end
end
