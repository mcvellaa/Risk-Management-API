json.extract! guest, :id, :name, :optional_title, :optional_text, :phone, :birthdate, :texting_consent, :created_at, :updated_at
json.url guest_url(guest, format: :json)