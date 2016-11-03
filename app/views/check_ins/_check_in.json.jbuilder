json.extract! check_in, :id, :user_id, :invitation_id, :time, :created_at, :updated_at
json.url check_in_url(check_in, format: :json)