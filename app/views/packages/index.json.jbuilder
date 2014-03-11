json.array!(@packages) do |package|
  json.extract! package, :id, :name, :description, :price
  json.url package_url(package, format: :json)
end
