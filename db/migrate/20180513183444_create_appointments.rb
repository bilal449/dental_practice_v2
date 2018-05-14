class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :timeanddate
      t.references :dentist, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true
      t.integer :appointment_length
      t.decimal :fee_paid
      t.string :notes

      t.timestamps null: false
    end
  end
end
