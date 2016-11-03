json.extract! event_user, :id, :event_id, :user_id, :role, :last_location, :location_datetime, :created_at, :updated_at
json.url event_user_url(event_user, format: :json)