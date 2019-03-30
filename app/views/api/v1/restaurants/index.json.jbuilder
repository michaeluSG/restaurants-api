json.restaurants do
  json.array! @restaurants do |restaurant|
    json.extract! restaurant, :id, :name, :address, :description, :image
  end
end
