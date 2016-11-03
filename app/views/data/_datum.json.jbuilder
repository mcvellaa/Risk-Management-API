json.extract! datum, :id, :user_id, :event_id, :question_id, :response, :created_at, :updated_at
json.url datum_url(datum, format: :json)