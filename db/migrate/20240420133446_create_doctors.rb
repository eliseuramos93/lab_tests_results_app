class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :crm
      t.string :crm_state
      t.string :full_name
      t.string :email

      t.timestamps
    end
  end
end
