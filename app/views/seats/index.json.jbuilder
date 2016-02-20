json.array!(@seats) do |seat|
  json.extract! seat, :id, :x, :y, :reserved, :configuration_id
  json.url seat_url(seat, format: :json)
end
