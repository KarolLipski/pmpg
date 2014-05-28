json.array!(@sell_point_offers) do |sell_point_offer|
  json.extract! sell_point_offer, :id
  json.url sell_point_offer_url(sell_point_offer, format: :json)
end
