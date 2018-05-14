class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :allergies
      t.string :medical_notes

      t.timestamps null: false
    end
  end
end
