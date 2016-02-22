json.array!(@menus) do |menu|
  json.extract! menu, :id, :title, :description, :restaurant_id
  json.url menu_url(menu, format: :json)
end
