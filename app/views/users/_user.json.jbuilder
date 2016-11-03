json.extract! user, :id, :path_to_fb_info, :last_logged_on, :date_joined, :created_at, :updated_at
json.url user_url(user, format: :json)