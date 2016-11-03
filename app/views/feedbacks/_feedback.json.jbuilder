json.extract! feedback, :id, :event_id, :from, :datetime, :text, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)