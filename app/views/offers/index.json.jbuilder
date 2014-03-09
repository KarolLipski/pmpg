json.array!(@offers) do |offer|
  json.extract! offer, :id, :name, :description, :price
  json.url offer_url(offer, format: :json)
end
