json.array!(@meals) do |meal|
  json.extract! meal, :id, :title, :description, :price, :menu_id
  json.url meal_url(meal, format: :json)
end
