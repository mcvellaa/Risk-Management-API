json.extract! event, :id, :title, :location, :start, :end, :max_attendance, :time_to_send_invites, :list_close, :created_at, :updated_at
json.url event_url(event, format: :json)