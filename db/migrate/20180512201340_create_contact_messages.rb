class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.string :name
      t.string :phone_no
      t.string :email
      t.string :message

      t.timestamps null: false
    end
  end
end
