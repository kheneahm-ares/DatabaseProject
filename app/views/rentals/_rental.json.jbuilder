json.extract! rental, :id, :dateRented, :dateDue, :daysLeft, :returned, :dateReturned, :fee, :created_at, :updated_at
json.url rental_url(rental, format: :json)
