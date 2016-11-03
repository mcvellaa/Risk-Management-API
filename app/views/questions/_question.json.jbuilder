json.extract! question, :id, :question, :required, :form_type, :created_at, :updated_at
json.url question_url(question, format: :json)