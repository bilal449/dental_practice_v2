json.extract! contact_message, :id, :name, :phone_no, :email, :message, :created_at, :updated_at
json.url contact_message_url(contact_message, format: :json)
