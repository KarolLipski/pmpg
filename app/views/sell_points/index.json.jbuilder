json.array!(@sell_points) do |sell_point|
  json.extract! sell_point, :id, :name, :chain_id
  json.url sell_point_url(sell_point, format: :json)
end
