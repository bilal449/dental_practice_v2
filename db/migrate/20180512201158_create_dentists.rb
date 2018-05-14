class CreateDentists < ActiveRecord::Migration
  def change
    create_table :dentists do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :registered_dental_no
      t.boolean :isActive

      t.timestamps null: false
    end
  end
end
