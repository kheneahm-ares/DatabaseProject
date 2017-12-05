json.extract! notification, :id, :message, :rentalId, :userId, :created_at, :updated_at
json.url notification_url(notification, format: :json)
