json.extract! invitation, :id, :guest_id, :event_id, :user_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)