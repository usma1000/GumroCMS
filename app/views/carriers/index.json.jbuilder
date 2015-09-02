json.array!(@carriers) do |carrier|
  json.extract! carrier, :id, :name
  json.url carrier_url(carrier, format: :json)
end
