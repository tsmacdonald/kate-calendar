json.extract! event, :id, :day, :month, :year, :venue, :title, :location, :time, :created_at, :updated_at
json.url event_url(event, format: :json)