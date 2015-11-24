json.array!(@supplements) do |supplement|
  json.extract! supplement, :id, :name, :profile_id
  json.url supplement_url(supplement, format: :json)
end
