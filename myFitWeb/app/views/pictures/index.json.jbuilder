json.array!(@pictures) do |picture|
  json.extract! picture, :id, :name, :profile_id
  json.url picture_url(picture, format: :json)
end
