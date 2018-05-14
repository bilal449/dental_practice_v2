json.extract! appointment, :id, :timeanddate, :dentist_id, :patient_id, :appointment_length, :fee_paid, :notes, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
