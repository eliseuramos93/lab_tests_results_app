class CreateLabTests < ActiveRecord::Migration[7.1]
  def change
    create_table :lab_tests do |t|
      t.string :name
      t.string :limits

      t.timestamps
    end
  end
end
