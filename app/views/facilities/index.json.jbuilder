json.array!(@facilities) do |facility|
  json.extract! facility, :id, :address, :city, :state
  json.url facility_url(facility, format: :json)
end
