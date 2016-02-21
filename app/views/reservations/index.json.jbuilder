json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :date, :duration
  json.url reservation_url(reservation, format: :json)
end
