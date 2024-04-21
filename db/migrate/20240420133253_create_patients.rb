class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :cpf
      t.string :full_name
      t.string :email
      t.date :birth_date
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
